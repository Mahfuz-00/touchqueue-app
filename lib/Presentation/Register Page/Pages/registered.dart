import 'package:flutter/material.dart';
import 'package:touchqueue_app/Core/Config/assets/app_image.dart';
import '../../../../Common/Widgets/internetconnectioncheck.dart';
import '../../../Core/Config/theme/app_color.dart';
import '../../Login Page/Page/Login.dart';

class Registered extends StatefulWidget {
  const Registered({super.key});

  @override
  State<Registered> createState() => _RegisteredState();
}

class _RegisteredState extends State<Registered> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return InternetConnectionChecker(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.lightBackground,
              image: DecorationImage(
                image: AssetImage(AppImages.LightBG),
                fit: BoxFit.cover, // Use BoxFit.cover to cover the entire screen
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image(
                      image: AssetImage(AppImages.Successmark),
                      height: 150,
                      width: 150,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Account Registered!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Your account has been changed registered',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      /*final emailCubit = EmailCubit();
                      emailCubit.clearEmail();*/
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: Size(screenWidth * 0.9, 70),
                    ),
                    child: Text(
                      'Back to Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'default',
                      ),
                    ),
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
