final class SignUpModel {
  /// email
  String? email;

  /// 비밀번호
  String? password;

  /// 닉네임
  String? nickName;

  /// 전화번호
  String? phoneNumber;

  /// 성별
  String? gender;

  /// 나이
  int? age;

  /// 이름
  String? name;

  /// 식별 번호
  String? identifier;

  /// 생일
  String? birthYear;

  /// 본인 인증 여부
  bool? phoneAuthenticated;

  SignUpModel({
    this.email,
    this.password,
    this.nickName,
    this.phoneNumber,
    this.gender,
    this.age,
    this.name,
    this.identifier,
    this.birthYear,
    this.phoneAuthenticated,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      email: json['email'],
      password: json['password'],
      nickName: json['nickName'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      age: json['age'],
      name: json['name'],
      identifier: json['identifier'],
      birthYear: json['birthYear'],
      phoneAuthenticated: json['phoneAuthenticated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'nickName': nickName,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'age': age,
      'name': name,
      'identifier': identifier,
      'birthYear': birthYear,
      'phoneAuthenticated': phoneAuthenticated,
    };
  }
}
