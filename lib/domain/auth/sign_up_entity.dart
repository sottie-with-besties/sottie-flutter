class SignUpEntityModel {
  String? name;
  String? email;
  String? nickName;
  String? password;
  String? phoneNumber;
  Gender? gender;
  String? identifier;
  String? birthYear;
  bool? phoneAuthenticated;

  SignUpEntityModel({
    this.name = '',
    this.email = '',
    this.nickName = '',
    this.password = '',
    this.phoneNumber = '',
    this.gender,
    this.identifier = '',
    this.birthYear = '',
    this.phoneAuthenticated = false,
  });

  toJson() {
    return {
      'name': name,
      'email': email,
      'nickName': nickName,
      'password': password,
      'phoneNumber': phoneNumber,
      'identifier': identifier,
      'birthYear': birthYear,
      'phoneAuthenticated': phoneAuthenticated,
    };
  }
}

enum Gender {
  male,
  female,
}

SignUpEntityModel signUpEntity = SignUpEntityModel();
