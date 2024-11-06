import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touchqueue_app/Core/Config/assets/app_image.dart';
import 'package:touchqueue_app/Presentation/Register%20Page/Pages/Register.dart';

import '../../../Core/Config/theme/app_color.dart';
import '../../Login Page/Page/Login.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.lightBackground,
          image: DecorationImage(
            image: AssetImage(AppImages.LightBG),
            fit: BoxFit.cover, // Use BoxFit.cover to cover the entire screen
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                AppImages.LargeLogo
              ),
              width: 300,
              height: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Start Queue Management System helps minimize wait times, making your experience quicker and more convenient',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'default',
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const Login()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                        color: AppColors.primary,
                        width: 2),
                  ),
                  fixedSize: Size(screenWidth * 0.9, 70),
                ),
                child: Text('Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'default',
                    ))),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const Register()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                        width: 2,
                        color: AppColors.primary),
                  ),
                  fixedSize: Size(screenWidth * 0.9, 70),
                ),
                child: Text('Register',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      fontFamily: 'default',
                    ))),
          ],
        ),
      ),
    );
  }
}
