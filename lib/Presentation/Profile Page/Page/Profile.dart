import 'package:flutter/material.dart';
import 'package:touchqueue_app/Core/Config/assets/app_image.dart';
import 'package:touchqueue_app/Presentation/Password%20Change%20Page/Pages/AccountChangePassword.dart';

import '../../../../Common/Widgets/CustomButton.dart';
import '../../History Page/Page/TokenHistory.dart';
import '../../Login Page/Page/Login.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.background,
          ),
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
               if (value == 'history') {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => History(type: 'Doctor Appointment - ID: 23456',)),
                 );
                } else if (value == 'logout') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                }
              },
              itemBuilder: (BuildContext context) {
                return [
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                'Your Mobile Number :',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'default',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Change Password',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'default',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'Change Password',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountChangePassword()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
