class UserModel {
  final String? uid;
  final String? name;
  final String? email;
  final String? mobile;
  final String? password;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.mobile,
    this.password,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? mobile,
    String? password,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
    );
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'] as String?,
        name = json['name'] as String?,
        email = json['email'] as String?,
        mobile = json['mobile'] as String?,
        password = json['password'] as String?;

  Map<String, dynamic> toJson() => {
    'uid' : uid,
    'name' : name,
    'email' : email,
    'mobile' : mobile,
    'password' : password
  };
}