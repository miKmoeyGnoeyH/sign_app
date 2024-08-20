import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../global/widgets/navigator_key_manager.dart';

class SigningPage extends StatefulWidget {
  const SigningPage({super.key});

  @override
  State<SigningPage> createState() => _SigningPageState();
}

class _SigningPageState extends State<SigningPage> {
  final double _signatureBoxWidth = 384;
  final double _signatureBoxHeight = 128;
  final int _signatureWidth = 256;
  final int _signatureHeight = 128;
  final NavigatorKeyManager navigatorKeyManager = NavigatorKeyManager();
  final HandSignatureControl handSignatureControl = HandSignatureControl(
    threshold: 5.0,
    smoothRatio: 1,
    velocityRange: 5.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Signing"),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          GestureDetector(
            onTap: () => clearSign(),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(Icons.refresh, size: 28,),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                width: _signatureBoxWidth,
                height: _signatureBoxHeight,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.3),
                    width: 0.33,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: HandSignature(
                  control: handSignatureControl,
                  color: Colors.black,
                  width: 1.0,
                  maxWidth: 4.0,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: Theme.of(context).colorScheme.primary,
              ),
              GestureDetector(
                onTap: () => saveSign(),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Center(
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clearSign() {
    handSignatureControl.clear();
  }

  void saveSign() async {
    final status = await Permission.storage.status;
    late final SnackBar snackBar;

    if(!status.isGranted) {
      await Permission.storage.request();
    }

    final signatureName = "${DateTime.now().millisecondsSinceEpoch}.jpeg";
    final image = await handSignatureControl.toImage(
      width: _signatureWidth,
      height: _signatureHeight,
      color: Colors.black,
      background: Colors.white,
    );
    Uint8List pngBytes = image!.buffer.asUint8List();

    final result = await ImageGallerySaver.saveImage(pngBytes, name: signatureName);
    final bool isSuccess = result['isSuccess'];

    if(isSuccess) {
      log("Signature saved successfully");
      navigatorKeyManager.popUntilFirst();
      snackBar = const SnackBar(content: Text("Signature saved successfully"));
    } else {
      log("Signature save failed");
      snackBar = const SnackBar(content: Text("Signature save failed"));
    }

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
