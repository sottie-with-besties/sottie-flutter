final class SignUpModel {
  /// email
  final String email;

  /// 전화번호
  final String phoneNumber;

  /// 성별
  final String gender;

  /// 나이
  final int age;

  /// 이름
  final String name;

  SignUpModel({
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.age,
    required this.name,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      age: json['age'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'age': age,
      'name': name,
    };
  }
}
