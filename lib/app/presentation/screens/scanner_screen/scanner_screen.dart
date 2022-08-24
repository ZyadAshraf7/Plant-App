import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController?qrViewController;
  void onQrCreated(QRViewController qrViewController){
    setState((){
      this.qrViewController = qrViewController;
    });
  }
  @override
  void dispose() {
    qrViewController?.dispose();
    super.dispose();
  }
  @override
  void reassemble()async{
    super.reassemble();
    if(Platform.isAndroid){
      await qrViewController!.pauseCamera();
    }
    qrViewController!.resumeCamera();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QRView(
          key: qrKey,
          onQRViewCreated: onQrCreated,
          overlay: QrScannerOverlayShape(

          ),
        ),
      ),
    );
  }
}
