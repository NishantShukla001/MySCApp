
import 'dart:ui';

const String urlPrefix = 'http://52.53.223.184:3010/api/users/';
var deviceCount = 0;

const String emailRegex =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const String mobileRegex = r"^[6-9][0-9]{9}$";
const String numberRegex = r"^[0-9]";
const String pinCodeRegex = r"^[1-9][0-9]{5}$";
const String registration_error = "Failed to register user!";
const String registration_success = "User Registered Successfully!";
const String login_error = "Failed to login user!";
const String logout_error = "Failed to logout user!";
const String forgot_password_error = "Failed to send OTP!";
const String otp_error = "Failed to verify OTP!";
const String update_password_error = "Failed to set new password!";

enum CallTypes { incoming, outgoing, missed }
enum Gender { male, female, both }
enum Language { hindi, english }

/// Colors to be used in app
const Color themeColor = Color.fromARGB(255, 221, 232, 239);
