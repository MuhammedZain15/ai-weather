class UserData {
  static const collectionName = "users";
  String fullName;
  String email;
  String uid;

  UserData({
    required this.fullName,
    required this.email,
    required this.uid,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      fullName: json['fullName'],
      email: json['email'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'uid': uid,
    };
  }
}
