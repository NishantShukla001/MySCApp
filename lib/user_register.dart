import 'package:flutter/material.dart';
import 'NetworkLawyer/user_actions.dart';
import 'Utility/constant.dart';
import 'Utility/progress_hud.dart';
import 'otp_screen.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  bool userNameValidate = false;
  bool mobilenumberValidate = false;
  bool emailValidate = false;
  bool passwordValidate = false;
  bool dobValidate = false;
  bool confirmPasswordValidate = false;

  bool genderMale = true;
  final ProgressHud _progressHUD = ProgressHud();

  Future selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  void validateInput() {
    String fullName = userNameController.text.trim();
    String email = emailController.text.trim();
    String mobile = mobileController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String dob = dobController.text.trim();

    setState(() {
      userNameValidate = fullName.isNotEmpty;
      mobilenumberValidate =
          mobile.isNotEmpty && RegExp(mobileRegex).hasMatch(mobile);
      emailValidate = email.isEmpty && RegExp(emailRegex).hasMatch(email);
      passwordValidate = password.isNotEmpty && password.length > 7;
      confirmPasswordValidate =
          confirmPassword.isNotEmpty && password == confirmPassword;
      dobValidate = dob.isNotEmpty;
    });
  }

  bool isInputValid() {
    return userNameValidate &&
        mobilenumberValidate &&
        emailValidate &&
        passwordValidate &&
        confirmPasswordValidate &&
        dobValidate;
  }

  // function to register user
  void registerUser() {
    String fullName = userNameController.text.trim();
    String email = emailController.text.trim();
    String mobile = mobileController.text.trim();
    String password = passwordController.text.trim();
    String dob = dobController.text.trim();

    if (isInputValid()) {
      _progressHUD.state?.show();

/*

Request
{
    "mobile_no" : "7985694515",
    "email" : "gyanendram85sd2@gmail.com",
    "first_name" : "Rakesh",
    "last_name" : "Mishra",
    "dob" : "05-03-1994",
    "password" : "12345678",
    "gender" : "male"
}


Response
  /*
  {
    "status": "success",
    "status_code": 200,
    "message": "Registered successfully",
    "otp": 972043
}
*/

*/
      Map data = {
        'fullname': fullName,
        'email': email,
        'mobile_no': mobile,
        'gender': genderMale ? "male" : "female",
        'dob': dob,
        "password": password
      };

      UserActions().userRegistration(data).then((response) {
        print(response);
        _progressHUD.state?.dismiss();
        if (response.containsKey("status") && response["status_code"] == 200) {
          int value = response["otp"];
          navigateToOTPScreen(value, email);
        } else {
          showError(response);
        }
      });
    }
  }

  showError(Map<String, dynamic> response) {
    String errorMessage = registration_error;
    if (response.containsKey("message")) {
      errorMessage = response["message"];
    }

    final snackBar = SnackBar(
      content: Text(errorMessage),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void navigateToOTPScreen(int otpValue, String email) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => OTPScreen(
                otp: otpValue,
                email: email,
              )),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 38,
                    ),
                    const Text(
                      "Registration",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: size.width * 0.92,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 38,
                            ),
                            const Text("Full Name",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                )),
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 12.0, // soften the shadow
                                    spreadRadius: 3.0, //extend the shadow
                                  )
                                ],
                              ),
                              child: TextField(
                                controller: userNameController,
                                 onSubmitted: (value) {
                                    validateInput();
                                  },
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'name',
                                    // errorText: userNameValidate
                                    //     ? 'Full Name can\'t be empty'
                                    //     : null
                                        ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            const Text("Email",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                )),
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 12.0, // soften the shadow
                                    spreadRadius: 3.0, //extend the shadow
                                  )
                                ],
                              ),
                              child: TextField(
                                controller: emailController,
                                 onSubmitted: (value) {
                                    validateInput();
                                  },
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'email',
                                    // errorText: emailValidate
                                    //     ? 'Enter valid email address'
                                    //     : null
                                        ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            const Text("Mobile Number",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                )),
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 12.0, // soften the shadow
                                    spreadRadius: 3.0, //extend the shadow
                                  )
                                ],
                              ),
                              child: TextField(
                                controller: mobileController,
                                 onSubmitted: (value) {
                                    validateInput();
                                  },
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'mobile',
                                    // errorText: mobilenumberValidate
                                    //     ? 'Enter valid mobile number'
                                    //     : null
                                        ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            const Text("Date of Birth",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                )),
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 12.0, // soften the shadow
                                    spreadRadius: 3.0, //extend the shadow
                                  )
                                ],
                              ),
                              child: Stack(
                                children: [
                                  TextField(
                                    controller: dobController,
                                     onSubmitted: (value) {
                                    validateInput();
                                  },
                                    enabled: false,
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "dob",
                                        // errorText: dobValidate
                                        //     ? 'Select valid Date of Birth'
                                        //     : null
                                            ),
                                  ),
                                  Positioned(
                                    right: 4.0,
                                    top: 5.0,
                                    child: IconButton(
                                      icon: const Icon(Icons.calendar_month),
                                      color: Colors.grey,
                                      iconSize: 22.0,
                                      onPressed: () {
                                        selectDate(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            const Text("Gender",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                )),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  width: ((size.width * 0.92) - 24) / 2,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 12.0, // soften the shadow
                                        spreadRadius: 3.0, //extend the shadow
                                      )
                                    ],
                                  ),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              genderMale
                                                  ? const Color.fromRGBO(
                                                      0, 213, 217, 1)
                                                  : Colors.white),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        genderMale = true;
                                      });
                                    },
                                    child: Text(
                                      "Male",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: genderMale
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 60.0,
                                  width: ((size.width * 0.92) - 24) / 2,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 12.0, // soften the shadow
                                        spreadRadius: 3.0, //extend the shadow
                                      )
                                    ],
                                  ),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              genderMale
                                                  ? Colors.white
                                                  : const Color.fromRGBO(
                                                      0, 213, 217, 1)),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        genderMale = false;
                                      });
                                    },
                                    child: Text(
                                      "Female",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: genderMale
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.03),
                            const Text("Password",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                )),
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 12.0, // soften the shadow
                                    spreadRadius: 3.0, //extend the shadow
                                  )
                                ],
                              ),
                              child: Stack(
                                children: [
                                  TextField(
                                    controller: passwordController,
                                     onSubmitted: (value) {
                                    validateInput();
                                  },
                                    obscureText: hidePassword,
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "password ",
                                        // errorText: passwordValidate
                                        //     ? 'Password must be 8 char long'
                                        //     : null
                                            ),
                                  ),
                                  Positioned(
                                    right: 4.0,
                                    top: 5.0,
                                    child: IconButton(
                                      icon: Icon(hidePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                      color:
                                          const Color.fromRGBO(68, 97, 115, 1),
                                      iconSize: 22.0,
                                      onPressed: () {
                                        setState(() {
                                          hidePassword = !hidePassword;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            const Text("Confirm Password",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                )),
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 12.0, // soften the shadow
                                    spreadRadius: 3.0, //extend the shadow
                                  )
                                ],
                              ),
                              child: Stack(
                                children: [
                                  TextField(
                                    controller: passwordController,
                                     onSubmitted: (value) {
                                    validateInput();
                                  },
                                    obscureText: hidePassword,
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "confirm password",
                                        // errorText: confirmPasswordValidate
                                        //     ? 'Password and confirm password should be same'
                                        //     : null
                                            ),
                                  ),
                                  Positioned(
                                    right: 4.0,
                                    top: 5.0,
                                    child: IconButton(
                                      icon: Icon(hidePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                      color:
                                          const Color.fromRGBO(68, 97, 115, 1),
                                      iconSize: 22.0,
                                      onPressed: () {
                                        setState(() {
                                          hidePassword = !hidePassword;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),
                            SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                        isInputValid() 
                                        ? const Color.fromRGBO(68, 97, 115, 1)
                                        : const Color.fromRGBO(68, 97, 115, 0.4),
                                  ),
                                ),
                                onPressed: isInputValid() ? () {
                                  registerUser();
                                } : null,
                                child: const Text(
                                  "CREATE & CONTINUE",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an account?",
                                    style: TextStyle(
                                      color: Color.fromRGBO(141, 141, 141, 1),
                                      fontSize: 16,
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _progressHUD
          ],
        ),
      ),
    );
  }
}
