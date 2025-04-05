import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScaner extends StatefulWidget {
  const BarcodeScaner({super.key});

  @override
  State<BarcodeScaner> createState() => _BarcodeScanerState();
}

class _BarcodeScanerState extends State<BarcodeScaner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Código de barras ',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        leading: BackButton(
          style: ButtonStyle(
            iconSize: WidgetStatePropertyAll(30)
          ),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        backgroundColor: Color.fromARGB(141, 0, 0, 0),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: MobileScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
          returnImage: true,
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;
          for (final barcode in barcodes) {
            log('Barcode found! ${barcode.rawValue}');
          }
          if (image != null) {
            showDialog(
              context: context, 
              builder: (context) {
                return AlertDialog(
                  title: Text( 
                    barcodes.first.rawValue ?? '',
                  ),
                  content: Image(
                    image: MemoryImage(image)
                  ),
                );
              }
            );
          }
        },
      ),
    );
  }
}