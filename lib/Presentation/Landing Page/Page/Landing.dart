import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touchqueue_app/Common/Widgets/internetconnectioncheck.dart';
import 'package:touchqueue_app/Core/Config/assets/app_image.dart';
import '../../Comfimation Page/Page/Confimation.dart';
import '../../History Page/Page/TokenHistory.dart';
import '../../Login Page/Page/Login.dart';
import '../../Profile Page/Page/Profile.dart';
import '../../../../Common/Widgets/CustomButton.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InternetConnectionChecker(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'TouchQueue',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'default',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
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
                      MaterialPageRoute(builder: (context) => History(type: 'Doctor Appointment - ID: 23456',)),
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
                          Icon(Icons.person, color: Colors.black),
                          // Profile icon
                          SizedBox(width: 8),
                          // Add some space between icon and text
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
                          Icon(Icons.history, color: Colors.black),
                          // History icon
                          SizedBox(width: 8),
                          // Add some space between icon and text
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
                          // Logout icon
                          SizedBox(width: 8),
                          // Add some space between icon and text
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
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              image: DecorationImage(
                image: AssetImage(AppImages.LightBG),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    'Welcome',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Please Select a Service',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                    text: 'Doctor Appointment',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Confirmation(
                                  type: 'Doctor Appointment',
                                )),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: 'Report Collection',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Confirmation(
                                  type: 'Report Collection',
                                )),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: 'Sample Collection (IPD)',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Confirmation(
                                  type: 'Sample Collection (IPD)',
                                )),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: 'Sample Collection (OPD)',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Confirmation(
                                  type: 'Sample Collection (OPD)',
                                )),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                ]),
          ),
        ),
      ),
    );
  }
}
