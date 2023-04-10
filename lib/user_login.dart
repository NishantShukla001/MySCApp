import 'package:demo_app/dashboard.dart';
import 'package:demo_app/user_register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'NetworkLawyer/user_actions.dart';
import 'Utility/constant.dart';
import 'Utility/progress_hud.dart';
import 'Utility/user_details.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final ProgressHud _progressHUD = ProgressHud();

  bool hidePassword = true;
  bool userIdValidate = false;
  bool passwordValidate = false;
  bool isLoggedIn = false;

  // function to validate the input
  void validateInput() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    bool isValidEmailOrMobile = RegExp(emailRegex).hasMatch(email) ||
        RegExp(mobileRegex).hasMatch(email);

    setState(() {
      userIdValidate = email.isNotEmpty && isValidEmailOrMobile;
      passwordValidate = password.isNotEmpty && password.length > 7;
    });
  }

  // function to perform user login
  void userLogin() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    // bool isValidEmailOrMobile = RegExp(emailRegex).hasMatch(email) ||
    //     RegExp(mobileRegex).hasMatch(email);

    // setState(() {
    //   userIdValidate = email.isEmpty || !isValidEmailOrMobile;
    //   passwordValidate = (password.isEmpty || password.length < 8);
    // });

    if (userIdValidate && passwordValidate) {
      _progressHUD.state?.show();

      Map data = {'mobile_no': email, 'password': password};
      UserActions().userLogin(data).then((response) {
        _progressHUD.state?.dismiss();
        if (response.containsKey("status") && response["status_code"] == 200) {
          saveUserDetails(response["data"]);
        } else {
          showError(response);
        }
      });
    }
  }

  saveUserDetails(Map<String, dynamic> value) async {
    String token = value["token"];
    Map<String, dynamic> userInfo = value[UserDetails.key];
    UserDetails userDetails = UserDetails.fromMap(userInfo);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    prefs.setInt("user_id", userDetails.id);

    showSuccess();
  }

  showError(Map<String, dynamic> response) {
    String errorMessage = login_error;
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

  showSuccess() {
    // const snackBar = SnackBar(
    //   content: Text(registration_success),
    //   duration: Duration(seconds: 2),
    //   backgroundColor: Colors.red,
    // );
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Dashboard()),
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
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 38,
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Access account",
                    style: TextStyle(
                      color: Color.fromRGBO(141, 141, 141, 1),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 30.0, // soften the shadow
                                spreadRadius: 3.0, //extend the shadow
                              )
                            ],
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.white,
                            ),
                            child:
                                Image.asset('graphics/google.png', width: 30),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 30.0, // soften the shadow
                                spreadRadius: 3.0, //extend the shadow
                              )
                            ],
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor:
                                  const Color.fromRGBO(74, 95, 155, 1),
                            ),
                            child:
                                Image.asset('graphics/facebook.png', width: 30),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 30.0, // soften the shadow
                                spreadRadius: 3.0, //extend the shadow
                              )
                            ],
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.white,
                            ),
                            child: Image.asset('graphics/apple.png', width: 30),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  const Text(
                    "or Login with Email",
                    style: TextStyle(
                      color: Color.fromRGBO(141, 141, 141, 1),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 44,
                          ),
                          const Text("Email/Mobile Number",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              )),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 60.0,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
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
                                hintText: "Email ",
                                // errorText: userIdValidate
                                //     ? 'Enter valid email or mobile number'
                                //     : null
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
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
                                  obscureText: hidePassword,
                                  onSubmitted: (value) {
                                    validateInput();
                                  },
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
                                    hintText: "Password ",
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
                                    color: const Color.fromRGBO(10, 66, 117, 1),
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
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: Color.fromRGBO(141, 141, 141, 1),
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => ForgetPwd()),
                                    // );
                                  },
                                )
                              ]),
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
                                backgroundColor: MaterialStateProperty.all<
                                    Color>(userIdValidate &&
                                        passwordValidate
                                    ? const Color.fromRGBO(68, 97, 115, 1)
                                    : const Color.fromRGBO(68, 97, 115, 0.4)),
                              ),
                              onPressed: userIdValidate && passwordValidate
                                  ? () {
                                      userLogin();
                                    }
                                  : null,
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account?",
                                  style: TextStyle(
                                    color: Color.fromRGBO(141, 141, 141, 1),
                                    fontSize: 16,
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const UserRegister()),
                                    );
                                  },
                                  child: const Text(
                                    "Register",
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
            _progressHUD
          ],
        ),
      ),
    );
  }
}
