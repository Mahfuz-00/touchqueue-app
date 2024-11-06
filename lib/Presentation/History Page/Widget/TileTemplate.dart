import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../Common/Widgets/TitleNameTemplate.dart';

class VisitorTokenTile extends StatelessWidget {
  final String qrData;
  final String tokenNo;
  final String counterNo;
  final String timeanddate;

  const VisitorTokenTile({
    Key? key,
    required this.qrData,
    required this.tokenNo,
    required this.counterNo,
    required this.timeanddate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // QR code section on the left
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(right: 16),
              child: QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 100.0,
              ),
            ),
            // Details section on the right
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleNameWidget(title: 'Token No.', name: tokenNo),
                  TitleNameWidget(title: 'Counter No', name: counterNo),
                  TitleNameWidget(title: 'Time and Date', name: timeanddate),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
