import 'package:flutter/material.dart';
import 'package:touchqueue_app/Core/Config/assets/app_image.dart';
import '../../../../Common/Widgets/internetconnectioncheck.dart';
import '../../Profile Page/Page/Profile.dart';

class AccountPasswordChanged extends StatefulWidget {
  const AccountPasswordChanged({super.key});

  @override
  State<AccountPasswordChanged> createState() => _AccountPasswordChangedState();
}

class _AccountPasswordChangedState extends State<AccountPasswordChanged> {
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
              color: Theme.of(context).colorScheme.background,
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
                    'Password Changed!',
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
                    'Your password has been changed successfully',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
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
                        MaterialPageRoute(builder: (context) => const Profile()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: Size(screenWidth * 0.9, 70),
                    ),
                    child: Text(
                      'Back to Profile',
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
