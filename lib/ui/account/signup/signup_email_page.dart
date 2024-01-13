import 'package:flutter/material.dart';
import 'package:sottie_with_besties/ui/account/signup/signup_password_page.dart';

import '../../../core/utils/validate.dart';

class SignUpEmailPage extends StatefulWidget {
  const SignUpEmailPage({super.key});

  @override
  _SignUpEmailPageState createState() => _SignUpEmailPageState();
}

class _SignUpEmailPageState extends State<SignUpEmailPage> {
  final formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;

  FocusNode _emailFocus = new FocusNode();

  TextEditingController emailInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이메일 회원가입'),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                  controller: emailInputController,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _emailFocus,
                  decoration: InputDecoration(labelText: '이메일'),
                  validator: (value) =>
                      CheckValidate().validateEmail(_emailFocus, value!),
                  onSaved: (value) => _email = value!,
                ),
                SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SignUpPasswordPage(emailInputController.text)),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        Color(0xff0100FF), // Text Color (Foreground color)
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
      ),
    );
  }
}
