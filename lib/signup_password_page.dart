import 'package:flutter/material.dart';
import 'package:sottie_with_besties/login_page.dart';
import 'package:sottie_with_besties/signup_model.dart';
import 'package:sottie_with_besties/signup_service.dart';
import 'package:sottie_with_besties/validate.dart';


class SignUpPasswordPage extends StatefulWidget {

  final String email;

  const SignUpPasswordPage(this.email, {Key? key}) : super(key: key);

  @override
  _SignUpPasswordPageState createState() => _SignUpPasswordPageState();
}

class _SignUpPasswordPageState extends State<SignUpPasswordPage> {

  final formKey = GlobalKey<FormState>();

  TextEditingController passwordInputController = TextEditingController();
  TextEditingController confirmPasswordInputController = TextEditingController();

  FocusNode _passwordFocus = new FocusNode();
  FocusNode _passwordConfirmFocus = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              TextFormField(
                controller: passwordInputController,
                obscureText: true,
                focusNode: _passwordFocus,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(labelText: '비밀번호'),
                validator: (value) => CheckValidate().validatePassword(_passwordFocus, value!),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: confirmPasswordInputController,
                obscureText: true,
                focusNode: _passwordConfirmFocus,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(labelText: '비밀번호 확인'),
                validator: (value) => CheckValidate().confirmPassword(passwordInputController.text, confirmPasswordInputController.text, _passwordConfirmFocus),
              ),
              SizedBox(
                height: 250,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // CheckValidate().showToast();
                    signUp(SignUp(email: '${widget.email}', password: confirmPasswordInputController.text));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()),);
                  } else {
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xff0100FF), // Text Color (Foreground color)
                ),
                child: Text(
                  '다음',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



}