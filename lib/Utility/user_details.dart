
class UserDetails {
  static String key = "data";

  int id;
  String userName;
  String email;
  String mobile;
  String address;
  String city;
  String state;
  String country;
  String zipCode;
  String profileImage;
  String bio;
  String gender;
  String dob;
  String isVerified;
  String fbId;
  String googlId;
  String appleId;
  String age;
  String toAge;
  String fromAge;
  String language;
  String interest;

  UserDetails(
      {required this.id,
      required this.userName,
      required this.email,
      required this.mobile,
      required this.address,
      required this.zipCode,
      required this.city,
      required this.state,
      required this.country,
      required this.profileImage,
      required this.bio,
      required this.gender,
      required this.dob,
      required this.isVerified,
      required this.fbId,
      required this.googlId,
      required this.appleId,
      required this.age,
      required this.fromAge,
      required this.toAge,
      required this.language,
      required this.interest});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "username": userName,
      "email": email,
      "mobile_no": mobile,
      "address": address,
      "city": city,
      "state": state,
      "country": country,
      "zip": zipCode,
      "profile_pic": profileImage,
      "bio": bio,
      "gender": gender,
      "dob": dob,
      "is_verify": isVerified,
      "fb_id": fbId,
      "google_id": googlId,
      "apple_id": appleId,
      "age_range_from": fromAge,
      "age_range_to": toAge,
      "language": language,
      "interest": interest,
      "age": age,
    };

    return map;
  }

  static UserDetails fromMap(Map<String, dynamic> map) {
    return UserDetails(
        id: map['id'],
        userName: map['username'],
        email: map['email'],
        mobile: map['mobile_no'],
        address: map['address'] ?? "",
        city: map['city'] ?? "",
        state: map['state'] ?? "",
        country: map['country'] ?? "",
        zipCode: map['zip'] == null ? "" : map['zip'].toString(),
        profileImage: map['profile_pic'] ?? "images/user_icon.png",
        bio: map['bio'] ?? "",
        gender: map['gender'] ?? "",
        dob: map['dob'] ?? "",
        isVerified: map['is_verify'] ?? "0",
        fbId: map['fb_id'] ?? "",
        googlId: map['google_id'] ?? "",
        appleId: map['apple_id'] ?? "",
        fromAge: map['age_range_from'] ?? "",
        toAge: map['age_range_to'] ?? "",
        language: map['language'] ?? "",
        interest: map['interest'] ?? "",
        age: map['age'] ?? "");
  }
}

/*
    "data": {
        "id": 163,
        "username": "Rakesh Mishra",
        "email": "gyanendrsmd5sd21@gmail.com",
        "mobile_no": "7983693235",
        "address": null,
        "city": null,
         "country": null,
        "state": null,
        "zip": null,
        "lat": null,
        "lang": null,
        "profile_pic": null,
        "bio": null,
        "gender": "male",
        "dob": "05-03-1994",
        "is_verify": 1,
        "status": 1,
        "fb_id": null,
        "google_id": null,
        "apple_id": null,
        "age_range_from": null,
        "age_range_to": null,
        "language": null,
        "interest": null,
        "range_from": null,
        "range_to": null,
        "age": null,
    },

*/
