import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:touchqueue_app/Core/Config/assets/app_image.dart';
import 'package:touchqueue_app/Presentation/Pages/Register%20Page/Pages/registered.dart';
import '../../../../Common/Widgets/internetconnectioncheck.dart';
import '../Widgets/CustomBox.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  bool _isLoading = true;
  bool _pageloading = false;
  final List<TextEditingController> _controllers =
  List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  Future<void> _sendCode(String email) async {
   /* final apiService = await ForgotPasswordAPIService();
    apiService.sendForgotPasswordOTP(email).then((response) {
      if (response == 'Forget password otp send successfully') {
        const snackBar = SnackBar(
          content: Text('Code Sent to your Email.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (response == 'validation error') {
        const snackBar = SnackBar(
          content: Text('Invalid Email'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }).catchError((error) {
      print(error);
      const snackBar = SnackBar(
        content: Text('Invalid Email'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });*/
  }

  Future<void> _sendOTP(String email, String OTP) async {
    setState(() {
      _pageloading = true;
    });
  /*  final apiService = await OTPVerificationAPIService.create();
    apiService.OTPVerification(email, OTP).then((response) {
      if (response == 'Otp Verified Successfully') {
        setState(() {
          _pageloading = false;
        });
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreateNewPasswordUI()));
      } else if (response ==
          'Otp not match. Please resend forget password otp') {
        setState(() {
          _pageloading = false;
        });
        const snackBar = SnackBar(
          content: Text('OTP did not Match. Try again!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }).catchError((error) {
      setState(() {
        _pageloading = false;
      });
      print(error);
      const snackBar = SnackBar(
        content: Text('OTP did not Match. Try again!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });*/
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return _isLoading
        ? Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // Show circular loading indicator while waiting
        child: CircularProgressIndicator(),
      ),
    )
        : InternetConnectionChecker(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                image: DecorationImage(
                  image: AssetImage(AppImages.LightBG),
                  fit: BoxFit.cover, // Use BoxFit.cover to cover the entire screen
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.onPrimary,
                              width: 2),
                          // Border properties
                          borderRadius: BorderRadius.circular(
                              10), // Optional: Rounded border
                        ),
                        child: IconButton(
                          onPressed: () {
                            // Handle back button press here
                            Navigator.pop(
                                context); // This will pop the current route off the navigator stack
                          },
                          icon: Icon(Icons.arrow_back_ios),
                          iconSize: 30,
                          padding: EdgeInsets.all(10),
                          splashRadius: 30,
                          color: Theme.of(context).colorScheme.onPrimary,
                          splashColor: Colors.grey,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage(AppImages.LargeLogo),
                                height: 100,
                                width: 300,),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'OTP Verification',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'default'),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, right: 30.0),
                                child: Text(
                                  'Enter the Verification code we just sent on your email address',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(143, 150, 158, 1),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'default',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 50),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(4, (index) {
                                    return Row(
                                      children: [
                                        CustomTextBox(
                                          textController: _controllers[index],
                                          currentFocusNode:
                                          _focusNodes[index],
                                          nextFocusNode: index < 3
                                              ? _focusNodes[index + 1]
                                              : null,
                                        ),
                                        if (index < 3) SizedBox(width: 10),
                                      ],
                                    );
                                  }),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => Registered()),
                                    );
                                    bool allFieldsFilled = _controllers.every(
                                            (controller) =>
                                        controller.text.isNotEmpty);
                                    if (allFieldsFilled) {
                                     /* String OTP = _controllers
                                          .map(
                                              (controller) => controller.text)
                                          .join();
                                      final emailcubit =
                                      context.read<EmailCubit>();
                                      final emailState = emailcubit.state;
                                      String email = '';
                                      if (emailState is EmailSaved) {
                                        email = emailState.email;
                                      }
                                      _sendOTP(email, OTP);*/
                                    } else {
                                      const snackBar = SnackBar(
                                        content: Text(
                                            'Please fill all OTP fields'),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    fixedSize: Size(screenWidth * 0.9, 70),
                                  ),
                                  child: _pageloading
                                      ? CircularProgressIndicator() // Show circular progress indicator when button is clicked
                                      : const Text('Verify',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: 'default',
                                      ))),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Footer(
                      backgroundColor: Color.fromRGBO(246, 246, 246, 255),
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Didn\'t recived code?  ',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color.fromRGBO(143, 150, 158, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'default',
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                              /*    final emailcubit =
                                  context.read<EmailCubit>();
                                  final emailState = emailcubit.state;
                                  String email = '';
                                  if (emailState is EmailSaved) {
                                    email = emailState.email;
                                  }
                                  _sendCode(email!);*/
                                },
                                child: Text(
                                  'Resend',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'default',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
