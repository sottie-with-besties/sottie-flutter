

class SignUp {
  final String? email;
  final String? password;

  SignUp({required this.email, required this.password});

  factory SignUp.fromJson(Map<String, dynamic> json) {
    return SignUp(
        email: json['email'],
        password: json['password']);
  }
  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}
