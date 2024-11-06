import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footer/footer.dart';
import 'package:touchqueue_app/Core/Config/assets/app_image.dart';
import 'package:touchqueue_app/Presentation/Landing%20Page/Page/Landing.dart';
import 'package:touchqueue_app/Presentation/Register%20Page/Pages/Register.dart';

import '../../../../Common/Widgets/internetconnectioncheck.dart';
import '../../Forget Password Page/Pages/Forgotpassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscured = true;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  //late LoginRequestmodel _loginRequest;
  var globalKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalfromkey = GlobalKey<FormState>();
  late String userType;
  bool _isLoading = false;
  bool _isButtonClicked = false;

  // late AuthCubit authCubit;

  IconData _getIcon() {
    return _isObscured ? Icons.visibility_off : Icons.visibility;
  }

/*  void _checkLoginRequest() {
    if (_loginRequest != null) {
      _loginRequest.Email;
      _loginRequest.Password;
    }
  }*/

  @override
  void initState() {
    super.initState();
    // _loginRequest = LoginRequestmodel(Email: '', Password: '');
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
    //  _checkLoginRequest();
    //   authCubit = context.read<AuthCubit>();
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
        key: globalKey,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              image: DecorationImage(
                image: AssetImage(AppImages.LightBG),
                fit:
                    BoxFit.cover, // Use BoxFit.cover to cover the entire screen
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: Container(
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
                              'Login',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'default'),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50.0),
                              child: const Text(
                                'Please, Enter Your Mobile Number and Password to log in',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(143, 150, 158, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'default',
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            Form(
                              key: globalfromkey,
                              child: Column(
                                children: [
                                  Container(
                                    width: screenWidth * 0.9,
                                    height: 70,
                                    child: TextFormField(
                                      controller: _phoneController,
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
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'default',
                                      ),
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(247, 248, 250, 1),
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
                                  const SizedBox(height: 15),
                                  Container(
                                    width: screenWidth * 0.9,
                                    height: 85,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          keyboardType: TextInputType.text,
                                          /*   onSaved: (input) =>
                                          _loginRequest.Password = input!,*/
                                          validator: (input) => input!.length <
                                                  8
                                              ? "Password should be more than 7 characters"
                                              : null,
                                          controller: _passwordController,
                                          obscureText: _isObscured,
                                          style: const TextStyle(
                                            color: Color.fromRGBO(
                                                143, 150, 158, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'default',
                                          ),
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: const Color.fromRGBO(
                                                247, 248, 250, 1),
                                            border: const OutlineInputBorder(),
                                            labelText: 'Enter your Password',
                                            labelStyle: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              fontFamily: 'default',
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(_getIcon()),
                                              onPressed: () {
                                                setState(() {
                                                  _isObscured = !_isObscured;
                                                  _passwordController.text =
                                                      _passwordController.text;
                                                });
                                              },
                                            ),
                                            errorStyle: TextStyle(height: 0),
                                          ),
                                        ),
                                        if (_passwordController
                                                .text.isNotEmpty &&
                                            _passwordController.text.length < 8)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "Password should be more than 8 characters",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: (screenWidth * 0.1 - 20)),
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ForgotPassword()));
                                    },
                                    child: const Text(
                                      'Forgot Password?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color.fromRGBO(143, 150, 158, 1),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'default',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const LandingPage()));
                                  /*   setState(() {
                                    _isButtonClicked = true;
                                  });
                                  if (await validateAndSave(
                                      globalfromkey, context)) {
                                    print('Checking $userType');
                                    if (userType != null) {
                                      if (userType == 'ndc_internal') {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VisitorDashboardUI(
                                                      shouldRefresh: true)),
                                              (route) => false,
                                        );
                                      } else if (userType == 'ndc_vendor') {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VisitorDashboardUI(
                                                      shouldRefresh: true)),
                                              (route) => false,
                                        );
                                      } else if (userType == 'ndc_customer') {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VisitorDashboardUI(
                                                      shouldRefresh: true)),
                                              (route) => false,
                                        );
                                      } else if (userType == 'ndc_admin') {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdminDashboardUI(
                                                      shouldRefresh: true)),
                                              (route) => false,
                                        );
                                      } else if (userType ==
                                          'ndc_security_admin') {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SecurityAdminDashboardUI(
                                                      shouldRefresh: true)),
                                              (route) => false,
                                        );
                                      } else {
                                        String errorMessage =
                                            'Invalid User!, Please enter a valid email address.';
                                        showTopToast(context, errorMessage);
                                      }
                                    }
                                  }
                                  setState(() {
                                    _isButtonClicked = false;
                                  });*/
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  fixedSize: Size(screenWidth * 0.9, 70),
                                ),
                                child: _isButtonClicked
                                    ? CircularProgressIndicator()
                                    : const Text('Login',
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
                  //SizedBox(height: 20),
                  Footer(
                    backgroundColor: const Color.fromRGBO(246, 246, 246, 255),
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?  ',
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
                                        builder: (context) =>
                                        const Register()));
                              },
                              child: Text(
                                'Register now',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'default',
                                ),
                              ),
                            )
                          ],
                        )
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

/*  Future<bool> validateAndSave(
      GlobalKey<FormState> formKey, BuildContext context) async {
    final form = formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      final apiService = LoginAPIService();
      final loginRequestModel = LoginRequestmodel(
        Email: _phoneController.text,
        Password: _passwordController.text,
      );
      try {
        final response = await apiService.login(loginRequestModel);
        if (response != null) {
          storeTokenLocally(response.token);
          userType = response.userType;
          print('UserType :: $userType');
          _fetchUserProfile(response.token);
          return true;
        } else {
          showTopToast(context, 'Email or password is not valid.');
          return false;
        }
      } catch (e) {
        String errorMessage = 'Incorrect Email and Password.';
        if (e.toString().contains('Invalid User')) {
          errorMessage = 'Invalid User!, Please enter a valid email address.';
        } else if (e.toString().contains('Invalid Credentials')) {
          errorMessage = 'Incorrect Password. Try again.';
        } else if (e.toString().contains('The email field is required') ||
            e.toString().contains('The password field is required')) {
          errorMessage =
          'Email or password is empty. Please fill in both fields.';
        }
        showTopToast(context, errorMessage);
        return false;
      }
    }
    return false;
  }*/

  void showTopToast(BuildContext context, String message) {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    overlayState?.insert(overlayEntry);

    Future.delayed(Duration(seconds: 3)).then((_) {
      overlayEntry.remove();
    });
  }

  late String AuthenToken;
  late final String? UserName;
  late final String? OrganizationName;
  late final String? PhotoURL;
  late final String? User;
/*
  Future<void> storeTokenLocally(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    print(prefs.getString('token'));
  }

  Future<void> _fetchUserProfile(String token) async {
    try {
      final apiService = await ProfileAPIService();

      if (!mounted) return;

      print('Mounted');

      final profile = await apiService.fetchUserProfile(token);
      final userProfile = UserProfile.fromJson(profile);

      print('Mounted Again');

      authCubit.login(userProfile, token);
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }*/
}
