import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:touchqueue_app/Common/Widgets/internetconnectioncheck.dart';
import 'package:touchqueue_app/Core/Config/assets/app_image.dart';
import 'package:touchqueue_app/Common/Widgets/TitleNameTemplate.dart';

import '../../Login Page/Page/Login.dart';
import '../../Profile Page/Page/Profile.dart';
import '../Widget/TileTemplate.dart';

class History extends StatelessWidget {
  final String type;

  const History({Key? key, required this.type}) : super(key: key);

  String _generateRandomId() {
    final random = Random();
    return random
        .nextInt(100000)
        .toString(); // Generates a random number as a string
  }

  @override
  Widget build(BuildContext context) {
    final randomId = _generateRandomId();
    final qrData = '$type - ID: $randomId';

    return InternetConnectionChecker(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).colorScheme.background,),
          ),
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Text(
            'TouchQueue',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'default',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          titleSpacing: 0,
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                popupMenuTheme: PopupMenuThemeData(
                  color: Theme.of(context).colorScheme.background,
                  textStyle: const TextStyle(color: Colors.black),
                ),
              ),
              child: PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_vert_outlined,
                  color: Theme.of(context).colorScheme.background,
                ),
                onSelected: (value) {
                  if (value == 'profile') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  } else if (value == 'logout') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      value: 'profile',
                      child: Row(
                        children: [
                          Icon(Icons.person, color: Colors.black), // Profile icon
                          SizedBox(width: 8), // Add some space between icon and text
                          Text(
                            'Profile',
                            style: TextStyle(
                              fontFamily: 'default',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'logout',
                      child: Row(
                        children: [
                          Icon(Icons.logout, color: Colors.black),
                          SizedBox(width: 8),
                          Text(
                            'Logout',
                            style: TextStyle(
                              fontFamily: 'default',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
                offset: Offset(0, 40),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                image: DecorationImage(
                  image: AssetImage(AppImages.LightBG),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Image(
                    image: AssetImage(AppImages.LargeLogo),
                    height: 100,
                    width: 300,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  VisitorTokenTile(
                    qrData: qrData,
                    tokenNo: qrData,
                    counterNo: '3',
                    timeanddate: '12:30 PM, 24-06-2024',
                  ),
                  SizedBox(height: 10,),
                  VisitorTokenTile(
                    qrData: qrData,
                    tokenNo: qrData,
                    counterNo: '3',
                    timeanddate: '12:30 PM, 24-06-2024',
                  ),
                  SizedBox(height: 10,),
                  VisitorTokenTile(
                    qrData: qrData,
                    tokenNo: qrData,
                    counterNo: '3',
                    timeanddate: '12:30 PM, 24-06-2024',
                  ),
                  SizedBox(height: 10,),
                  VisitorTokenTile(
                    qrData: qrData,
                    tokenNo: qrData,
                    counterNo: '3',
                    timeanddate: '12:30 PM, 24-06-2024',
                  ),
                  SizedBox(height: 10,),
                  VisitorTokenTile(
                    qrData: qrData,
                    tokenNo: qrData,
                    counterNo: '3',
                    timeanddate: '12:30 PM, 24-06-2024',
                  ),
                  SizedBox(height: 10,),
                  VisitorTokenTile(
                    qrData: qrData,
                    tokenNo: qrData,
                    counterNo: '3',
                    timeanddate: '12:30 PM, 24-06-2024',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
