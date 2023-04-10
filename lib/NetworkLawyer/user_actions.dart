import 'network_helper.dart';

class UserActions {
  Future<Map<String, dynamic>> userRegistration(Map data) async {
    final response =
        await NetworkHelper().makePostRequest("register", data).catchError((e) {
      return {'exception': e.toString()};
    });
    return response;
  }

  Future<Map<String, dynamic>> userLogin(Map data) async {
    final response =
        await NetworkHelper().makePostRequest("login", data).catchError((e) {
      return {'exception': e.toString()};
    });
    return response;
  }

  Future<Map<String, dynamic>> userFBLogin(Map data) async {
    final response =
        await NetworkHelper().makePostRequest("fb-login", data).catchError((e) {
      return {'exception': e.toString()};
    });
    return response;
  }

  Future<Map<String, dynamic>> userAppleLogin(Map data) async {
    final response = await NetworkHelper()
        .makePostRequest("apple-login", data)
        .catchError((e) {
      return {'exception': e.toString()};
    });
    return response;
  }

  Future<Map<String, dynamic>> userLogout() async {
    final response =
        await NetworkHelper().makeAuthGetRequest("logout").catchError((e) {
      return {'exception': e.toString()};
    });
    return response;
  }

  Future<Map<String, dynamic>> userChangePassword(Map data) async {
    final response = await NetworkHelper()
        .makeAuthPostRequest("change-password", data)
        .catchError((e) {
      return {'exception': e.toString()};
    });
    return response;
  }

  Future<Map<String, dynamic>> userForgotPassword(Map data) async {
    final response = await NetworkHelper()
        .makePostRequest("forgot-password", data)
        .catchError((e) {
      return {'exception': e.toString()};
    });
    return response;
  }

  Future<Map<String, dynamic>> userOTPVerification(Map data) async {
    final response = await NetworkHelper()
        .makePostRequest("verify-otp", data)
        .catchError((e) {
      return {'exception': e.toString()};
    });
    return response;
  }

  Future<Map<String, dynamic>> userResendOTP(Map data) async {
    final response = await NetworkHelper()
        .makePostRequest("resend-otp", data)
        .catchError((e) {
      return {'exception': e.toString()};
    });
    return response;
  }

  Future<Map<String, dynamic>> userUpdatePassword(Map data) async {
    final response = await NetworkHelper()
        .makePostRequest("update-password", data)
        .catchError((e) {
      return {'exception': e.toString()};
    });
    return response;
  }

  Future<Map<String, dynamic>> userUpdateProfile(
      String path, Map<String, String> data) async {
    final response = await NetworkHelper()
        .makeAuthMultipartRequest("update-profile", path, data)
        .catchError((e) {
      return {'exception': e.toString()};
    });
    return response;
  }

  Future<Map<String, dynamic>> userProfileDetails() async {
    final response = await NetworkHelper()
        .makeAuthGetRequest("user-details")
        .catchError((e) {
      return {'exception': e.toString()};
    });
    return response;
  }

  Future<Map<String, dynamic>> sendFCMToken(Map data) async {
    final response = await NetworkHelper()
        .makeAuthPostRequest("firebase-token", data)
        .catchError((e) {
      return {'exception': e.toString()};
    });
    return response;
  }

  Future<Map<String, dynamic>> sendAnonymousFCMToken(Map data) async {
    final response = await NetworkHelper()
        .makePostRequest("anonymous-token", data)
        .catchError((e) {
      return {'exception': e.toString()};
    });
    return response;
  }
}
