import 'package:flutter/material.dart';
import '../../../../Core/Connection Checker/internetconnectioncheck.dart';
import 'passwordchanged.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool _isLoading = true;
  late TextEditingController _newPasswordcontroller = TextEditingController();
  late TextEditingController _confirmPasswordcontroller =
  TextEditingController();
  bool _pageloading = false;
  bool _isObscuredPassword = true;
  bool _isObscuredConfirmPassword = true;


  IconData _getIconPassword() {
    return _isObscuredPassword ? Icons.visibility_off : Icons.visibility;
  }

  IconData _getIconConfirmPassword() {
    return _isObscuredConfirmPassword ? Icons.visibility_off : Icons.visibility;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  // Method to handle the creation of a new password
  Future<void> _createNewPassword(
      String email, String password, String confirmPassword) async {
    setState(() {
      _pageloading = true;
    });
  /*  final apiService = await CreateNewPasswordAPIService.create();
    apiService.NewPassword(email, password, confirmPassword).then((response) {
      if (response == 'Password Update Successfully') {
        setState(() {
          _pageloading = false;
        });
        // Navigate to the PasswordChanged screen if password update is successful
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PasswordChangedUI()));
      }
    }).catchError((error) {
      setState(() {
        _pageloading = false;
      });
      print(error);
      const snackBar = SnackBar(
        content: Text('There was an error. Try again'),
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
                  image: AssetImage('Assets/Images/bg_light.png'),
                  fit: BoxFit.cover, // Use BoxFit.cover to cover the entire screen
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Container(
                          padding: EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).colorScheme.onPrimary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios,
                                color: Theme.of(context).colorScheme.onPrimary),
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Navigate back to the previous screen
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('Assets/Images/Logo_Large.png'), height: 100, width: 300,),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Enter new password',
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
                                  'Please enter a new password. Your new password must be different from any of your previous password',
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
                                  controller: _newPasswordcontroller,
                                  obscureText: _isObscuredPassword,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(143, 150, 158, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'default',
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                    Color.fromRGBO(247, 248, 250, 1),
                                    border: OutlineInputBorder(),
                                    labelText: 'Enter your new password',
                                    labelStyle: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: 'default',
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(_getIconPassword()),
                                      onPressed: () {
                                        setState(() {
                                          _isObscuredPassword = !_isObscuredPassword;
                                          _newPasswordcontroller.text = _newPasswordcontroller.text;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: screenWidth * 0.9,
                                height: 70,
                                child: TextFormField(
                                  controller: _confirmPasswordcontroller,
                                  obscureText: _isObscuredConfirmPassword,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(143, 150, 158, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'default',
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                    Color.fromRGBO(247, 248, 250, 1),
                                    border: OutlineInputBorder(),
                                    labelText: 'Confirm new password',
                                    labelStyle: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: 'default',
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(_getIconConfirmPassword()),
                                      onPressed: () {
                                        setState(() {
                                          _isObscuredConfirmPassword =
                                          !_isObscuredConfirmPassword;
                                          _confirmPasswordcontroller.text =
                                              _confirmPasswordcontroller.text;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => PasswordChanged()),
                                    );
                                    // Check if both password fields are not empty
                                    if (_newPasswordcontroller
                                        .text.isNotEmpty &&
                                        _confirmPasswordcontroller
                                            .text.isNotEmpty) {
                                      if (_newPasswordcontroller.text !=
                                          _confirmPasswordcontroller.text) {
                                        const snackBar = SnackBar(
                                          content: Text(
                                              'Password and Confirm Password did not Match'),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      } else {
                                      /*  final email = (context
                                            .read<EmailCubit>()
                                            .state as EmailSaved)
                                            .email;
                                        print(
                                            'Retrieved email from Cubit: $email');
                                        print(email);
                                        _createNewPassword(
                                            email,
                                            _newPasswordcontroller.text,
                                            _confirmPasswordcontroller.text);*/
                                      }
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
                                      : const Text('Submit',
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
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
