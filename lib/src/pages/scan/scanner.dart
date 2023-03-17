import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:social_credit_club_app/src/pages/scan/widget/clubmembercard.dart';

class Scanner extends StatefulWidget {
  const Scanner({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  var scanController = MobileScannerController(
    facing: CameraFacing.front,
    torchEnabled: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: MobileScanner(
        controller: scanController,
        // fit: BoxFit.contain,
        onDetect: (capture) async {
          await scanController.stop();

          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;
          for (final barcode in barcodes) {
            //debugPrint('Barcode found! ${barcode.rawValue}');
            AlertDialog(
              content: Column(
                children: [
                  ClubMemberCard(memberId: barcode.rawValue as int),
                  SizedBox(
                    height: 200,
                    child: Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.check),
                          label: const Text('OK'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.garage),
                          label: const Text('Deny'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
