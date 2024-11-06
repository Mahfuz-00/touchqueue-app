import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footer/footer.dart';
import 'package:touchqueue_app/Core/Config/assets/app_image.dart';
import 'package:touchqueue_app/Presentation/Pages/Register%20Page/Pages/OTPVerfication.dart';
import '../../../../Common/Widgets/internetconnectioncheck.dart';
import '../../Login Page/Page/Login.dart';
import '../Widgets/CustomField.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isObscuredPassword = true;
  bool _isObscuredConfirmPassword = true;
 // late RegisterRequestmodel _registerRequest;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  var globalKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalfromkey = GlobalKey<FormState>();
  bool _isButtonLoading = false;

  IconData _getIconPassword() {
    return _isObscuredPassword ? Icons.visibility_off : Icons.visibility;
  }

  IconData _getIconConfirmPassword() {
    return _isObscuredConfirmPassword ? Icons.visibility_off : Icons.visibility;
  }

  @override
  void initState() {
    super.initState();
   /* _registerRequest = RegisterRequestmodel(
      fullName: '',
      organization: '',
      designation: '',
      NID: '',
      email: '',
      phone: '',
      password: '',
      confirmPassword: '',
      userType: '',
    );*/
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return InternetConnectionChecker(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                image: DecorationImage(
                  image: AssetImage(AppImages.LightBG),
                  fit: BoxFit.cover, // Use BoxFit.cover to cover the entire screen
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Column(children: [
                          Image(
                            image: AssetImage(AppImages.LargeLogo),
                            height: 100,
                            width: 300,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Register',
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
                            'Register to get started!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(143, 150, 158, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'default',
                            ),
                          ),
                          const SizedBox(height: 50),
                          Form(
                            key: globalfromkey,
                            child: Column(
                              children: [
                                CustomTextFormField(
                                  controller: _phoneController,
                                  labelText: 'Mobile Number',
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
                                ),
                                const SizedBox(height: 10),
                                CustomTextFormField(
                                  controller: _passwordController,
                                  labelText: 'Password',
                                  hinttext:
                                  "Password should be more than 7 characters and must include an uppercase letter, a lowercase letter, a number, and a special character.",
                                  validator: (input) {
                                    if (input!.length < 8) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              "Password should be more than 7 characters"),
                                          duration: Duration(seconds: 3),
                                        ),
                                      );
                                      return "Password should be more than 7 characters";
                                    } else if (!RegExp(
                                        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]')
                                        .hasMatch(input)) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              "Password must include an uppercase letter, a lowercase letter, a number, and a special character."),
                                          duration: Duration(seconds: 3),
                                        ),
                                      );
                                      return "Password must include an uppercase letter, a lowercase letter, a number, and a special character.";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  obscureText: _isObscuredPassword,
                                  suffixIcon: IconButton(
                                    icon: Icon(_getIconPassword()),
                                    onPressed: () {
                                      setState(() {
                                        _isObscuredPassword =
                                        !_isObscuredPassword;
                                        _passwordController.text =
                                            _passwordController.text;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10),
                                CustomTextFormField(
                                  controller: _confirmPasswordController,
                                  labelText: 'Confirm Password',
                                  hinttext:
                                  "Password should be more than 7 characters and must include an uppercase letter, a lowercase letter, a number, and a special character.",
                                  validator: (input) {
                                    if (input!.length < 8) {
                                      return "Password should be more than 7 characters";
                                    } else if (!RegExp(
                                        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]')
                                        .hasMatch(input)) {
                                      return "Password must include an uppercase letter, a lowercase letter, a number, and a special character.";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  obscureText: _isObscuredConfirmPassword,
                                  suffixIcon: IconButton(
                                    icon: Icon(_getIconConfirmPassword()),
                                    onPressed: () {
                                      setState(() {
                                        _isObscuredConfirmPassword =
                                        !_isObscuredConfirmPassword;
                                        _confirmPasswordController.text =
                                            _confirmPasswordController.text;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 50),
                          ElevatedButton(
                              onPressed: _registerUser,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fixedSize: Size(screenWidth * 0.9, 70),
                              ),
                              child: _isButtonLoading
                                  ? CircularProgressIndicator()
                                  : const Text('Register',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'default',
                                  ))),
                        ])),
                    SizedBox(height: 70,),
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
                              const Text(
                                'Already have an account?  ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(143, 150, 158, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'default',
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                                child: Text(
                                  'Login now',
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
      ),
    );
  }

  void _registerUser() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OTPVerification()),
    );
    setState(() {
      _isButtonLoading = true;
    });
    if (validateAndSave() && checkConfirmPassword()) {
      const snackBar = SnackBar(
        content: Text('Processing'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      /*final registerRequest = RegisterRequestmodel(
        phone: _phoneController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
      );*/

  /*    final apiService = UserRegistrationAPIService();
      apiService.register(registerRequest, _imageFile).then((response) {
        print("Submitted");
        if (response != null && response == "User Registration Successfully.") {
          setState(() {
            _isButtonLoading = false;
          });
          clearForm();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginUI()),
                (route) => false,
          );
          const snackBar = SnackBar(
            content: Text('Registration Submitted!'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (response != null &&
            response == "The email has already been taken.") {
          setState(() {
            _isButtonLoading = false;
          });
          const snackBar = SnackBar(
            content: Text(
                'The Email is Taken!, Please Try entering a different Email'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (response != null &&
            response == "The phone has already been taken.") {
          setState(() {
            _isButtonLoading = false;
          });
          const snackBar = SnackBar(
            content: Text(
                'The Phone Number is Taken!, Please Try a different Number'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (response != null &&
            response == "The identification number has already been taken.") {
          setState(() {
            _isButtonLoading = false;
          });
          const snackBar = SnackBar(
            content: Text(
                'The NID or Passport Number is Taken!, Please Try a different Number'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          setState(() {
            _isButtonLoading = false;
          });
          const snackBar = SnackBar(
            content: Text('Registration Failed!'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }).catchError((error) {
        setState(() {
          _isButtonLoading = false;
        });
        print(error);
        const snackBar = SnackBar(
          content: Text('Registration failed!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });*/
    } else {
      setState(() {
        _isButtonLoading = false;
      });
      if (_passwordController.text != _confirmPasswordController.text) {
        const snackBar = SnackBar(
          content: Text('Passwords do not match'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (validateAndSave() == false) {
        const snackBar = SnackBar(
          content: Text('Fill all Fields'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  bool validateAndSave() {
    final form = globalfromkey.currentState;
    if (form != null && form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  bool checkConfirmPassword() {
    return _passwordController.text == _confirmPasswordController.text;
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Error",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(13, 70, 127, 1),
              fontWeight: FontWeight.bold,
              fontFamily: 'default',
              fontSize: 22,
            ),
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "OK",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'default',
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void clearForm() {
    _phoneController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }
}
