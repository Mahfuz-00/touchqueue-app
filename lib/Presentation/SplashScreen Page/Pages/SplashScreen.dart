import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:touchqueue_app/Core/Config/assets/app_image.dart';
import 'package:touchqueue_app/Core/Config/theme/app_color.dart';

import '../../Welcome Page/Page/Welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
/*  late AnimationController animationController;
  late Animation<double> FadeAnimation;
  late Animation<Offset> SlideAnimation;
  late Animation<Offset> animatedpadding;*/

  @override
  void initState() {
    super.initState();
/*    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    SlideAnimation = Tween(begin: const Offset(0, 3), end: const Offset(0, 0))
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeInOutCirc));
    FadeAnimation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    animatedpadding = Tween(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.easeIn));

    Future.delayed(const Duration(seconds: 5), () {
      animationController.forward();
    });*/

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Welcome()),
      );
    });
  }

 /* @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                AppImages.RecLogo
              ),
              width: 500,
              height: 200,
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
            Align(
              alignment: Alignment.bottomCenter,
              child: const Image(
                image: AssetImage(AppImages.TNSLogo),
                height: 100,
                width: 150,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
