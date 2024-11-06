import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:touchqueue_app/Common/Widgets/internetconnectioncheck.dart';
import 'package:touchqueue_app/Core/Config/assets/app_image.dart';
import 'package:touchqueue_app/Common/Widgets/TitleNameTemplate.dart';

import '../../History Page/Page/TokenHistory.dart';
import '../../Login Page/Page/Login.dart';
import '../../Profile Page/Page/Profile.dart';

class Confirmation extends StatelessWidget {
  final String type;

  const Confirmation({Key? key, required this.type}) : super(key: key);

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
                  } else if (value == 'history') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => History(type: type,)),
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
                      value: 'history',
                      child: Row(
                        children: [
                          Icon(Icons.history, color: Colors.black), // History icon
                          SizedBox(width: 8), // Add some space between icon and text
                          Text(
                            'History',
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
                Text(
                  'Visitor',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Self Check-in',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
                const SizedBox(height: 30),
                QrImageView(
                  data: qrData,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                Text(
                  'Scan QR Code at the location to self check-in',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TitleNameWidget(title: 'Token No.', name: qrData),
                TitleNameWidget(title: 'Counter No', name: '3'),
                TitleNameWidget(title: 'Est. Time', name: '12:30 PM'),
                TitleNameWidget(title: 'People in Queue', name: '23'),
                TitleNameWidget(
                    title: 'Location', name: 'House-32, Mirpur D.O.H.S, Dhaka'),
                SizedBox(height: 30),
                Text(
                  'Thank You for Visiting ore Establishment. Stay Safe, Stay Healthy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
