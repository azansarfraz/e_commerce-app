class UserSignupModel {
  String? uid;
  String? fullname;
  String? email;
  String? phoneno;
  String? password;
  String? imageulr;

  UserSignupModel(
      {this.uid,
      this.email,
      this.password,
      this.fullname,
      this.phoneno,
      this.imageulr});
  factory UserSignupModel.fromMap(map) {
    return UserSignupModel(
      uid: map["uid"],
      email: map["email"],
      password: map["password"],
      fullname: map["fullname"],
      phoneno: map["phoneno"],
      imageulr: map["imageulr"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'fullname': fullname,
      'phoneno': phoneno,
      'imageulr': imageulr,
    };
  }
}
