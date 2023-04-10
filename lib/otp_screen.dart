import 'package:demo_app/Utility/constant.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'NetworkLawyer/user_actions.dart';
import 'Utility/progress_hud.dart';
import 'Utility/user_details.dart';
import 'dashboard.dart';

class OTPScreen extends StatefulWidget {
  final int otp;
  final String email;
  const OTPScreen({super.key, required this.otp, required this.email});
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool otpValidate = false;
  String enteredOTP = "";
  final ProgressHud _progressHUD = ProgressHud();

  void verifyOTP() {
    _progressHUD.state?.show();

    Map data = {
      'otp': enteredOTP,
      'email': widget.email,
    };

    UserActions().userOTPVerification(data).then((response) {
      // print(response);
      _progressHUD.state?.dismiss();
      if (response.containsKey("status") && response["status_code"] == 200) {
        saveUserDetails(response["data"]);
      } else {
        showError(response);
      }
    });
  }

  // function to resend otp
  resendOTP() {
    _progressHUD.state?.show();

    Map data = {'email': widget.email};
    UserActions().userResendOTP(data).then((response) {
      _progressHUD.state?.dismiss();
      String message = "Failed to resend OTP";
      Color color = Colors.red;

      if (response.containsKey("status") && response["status_code"] == 200) {
        message = "OTP re-sent Successfully";
        color = Colors.green;
      }

      final snackBar = SnackBar(
        content: Text(message), 
        duration: const Duration(seconds: 2),
        backgroundColor: color,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  showError(Map<String, dynamic> response) {
    String errorMessage = otp_error;
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
    const snackBar = SnackBar(
      content: Text(registration_success),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Dashboard()),
    );
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
                  SizedBox(
                    width: size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  const Text(
                    "Enter Verification Code",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 52),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "We have sent a verification code via SMS",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(141, 141, 141, 1),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 27),
                  OTPTextField(
                    length: 4,
                    width: size.width * 0.8,
                    fieldWidth: 50,
                    outlineBorderRadius: 2,
                    style: const TextStyle(fontSize: 16),
                    textFieldAlignment: MainAxisAlignment.spaceEvenly,
                    fieldStyle: FieldStyle.box,
                    otpFieldStyle: OtpFieldStyle(
                        backgroundColor: Colors.white,
                        borderColor: Colors.white),
                    onCompleted: (pin) {
                      enteredOTP = pin;
                    },
                  ),
                  const SizedBox(height: 58),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn't receive it?",
                          style: TextStyle(
                            color: Color.fromRGBO(141, 141, 141, 1),
                            fontSize: 16,
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Resend",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(height: 90),
                  SizedBox(
                    width: size.width * 0.8,
                    height: 60,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(68, 97, 115, 1),
                        ),
                      ),
                      onPressed: () {
                        verifyOTP();
                      },
                      child: const Text(
                        "VERIFY",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
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
