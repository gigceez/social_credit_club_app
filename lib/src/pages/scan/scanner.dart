// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:social_credit_club_app/src/pages/guestlist/guestlist.dart';

import 'package:social_credit_club_app/src/pages/scan/widget/clubmembercard.dart';
import 'package:social_credit_club_app/src/services/apihandler.dart';

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
    facing: CameraFacing.back,
    torchEnabled: true,
  );

  @override
  Widget build(BuildContext context) {
    late User user;

    final Completer<String> completer = Completer();

    return Scaffold(
      appBar: AppBar(
        title: const Text('scan'),
      ),
      body: FutureBuilder(
        future: completer.future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(child: Dialog(user: user));
          }
          return MobileScanner(
            onDetect: (value) async {
              if (!completer.isCompleted) {
                String userId = value.barcodes.first.displayValue!;
                user = await getUserById(userId);
                completer.complete(value.barcodes.first.displayValue);
              }
            },
          );
        },
      ),
    );
  }
}

class Dialog extends StatelessWidget {
  final User user;
  const Dialog({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          ClubMemberCard(memberId: user.rating),
          SizedBox(
            height: 200,
            child: Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    var a = await registerUserById(user);
                    if (a) {
                      Navigator.of(context).pop();
                    }
                  },
                  icon: const Icon(Icons.check),
                  label: const Text('OK'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    
                  },
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
}
