import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footer/footer.dart';
import 'package:touchqueue_app/Core/Config/assets/app_image.dart';
import '../../../../Common/Widgets/internetconnectioncheck.dart';
import '../../Login Page/Page/Login.dart';
import 'OTPVerfication.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController _mobileController = TextEditingController();
  bool _isloading = false;

  @override
  void initState() {
    super.initState();
    _mobileController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

  Future<void> _sendCode(String email) async {
    setState(() {
      _isloading = true;
    });
    /*final apiService = await ForgotPasswordAPIService.create();
    apiService.sendForgotPasswordOTP(email).then((response) {
      if (response == 'Forget password otp send successfully') {
        // Navigate to OTP verification screen if OTP is sent successfully
        setState(() {
          _isloading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OPTVerificationUI()),
        );
      } else if (response == 'validation error') {
        setState(() {
          _isloading = false;
        });
        // Show snackbar if there is a validation error
        const snackBar = SnackBar(
          content: Text('Invalid Email'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }).catchError((error) {
      setState(() {
        _isloading = false;
      });
      print(error);
      const snackBar = SnackBar(
        content: Text('Invalid Email'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });*/
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return InternetConnectionChecker(
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
                            color: Theme.of(context).colorScheme.onPrimary, width: 2),
                        // Border properties
                        borderRadius: BorderRadius.circular(
                            10), // Optional: Rounded border
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(
                              context); // Navigate back to the previous screen
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
                              image: AssetImage(AppImages.LargeLogo), height: 100, width: 300,),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Forgot Password?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'default',
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0, right: 30.0),
                              child: Text(
                                'Don\'t worry! it occurs. Please Enter the mobile number linked with your account',
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
                            Container(
                              width: screenWidth * 0.9,
                              height: 70,
                              child: TextFormField(
                                controller: _mobileController,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(11),
                                ],
                                validator: (input) {
                                  if (input == null || input.isEmpty) {
                                    return 'Please enter your mobile number';
                                  }
                                  if (input.length != 11) {
                                    return 'Mobile number must be 11 digits';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                  color: Color.fromRGBO(143, 150, 158, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'default',
                                ),
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromRGBO(247, 248, 250, 1),
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter your Mobile Number',
                                  labelStyle: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'default',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                            ElevatedButton(
                              onPressed: () async {
                                String mobile = _mobileController.text;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => OTPVerification()),
                                );
                                /*_sendCode(email);
                                final emailCubit = context.read<EmailCubit>();
                                emailCubit.saveEmail(email);*/
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fixedSize: Size(screenWidth * 0.9, 70),
                              ),
                              child: _isloading
                                  ? CircularProgressIndicator() // Show circular progress indicator when button is clicked
                                  : const Text(
                                      'Send Code',
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
                              'Remember Password?  ',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color.fromRGBO(143, 150, 158, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'default',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigate to login screen
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: Text(
                                'Login',
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
          ),
        ),
      ),
    );
  }
}
