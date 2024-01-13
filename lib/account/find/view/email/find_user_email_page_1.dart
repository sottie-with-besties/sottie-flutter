import 'package:flutter/material.dart';
import 'package:sottie_with_besties/account/signup/view/signup_password_page.dart';

import 'find_user_email_page_2.dart';

class FindUserEmail1Page extends StatefulWidget {
  const FindUserEmail1Page({super.key});

  @override
  _FindUserEmail1PageState createState() => _FindUserEmail1PageState();
}

class _FindUserEmail1PageState extends State<FindUserEmail1Page> {
  final formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ID 찾기'),
        centerTitle: true,
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
                  decoration: InputDecoration(labelText: '핸드폰 번호'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '핸드폰 번호를 입력해주세요.';
                    }
                    return null;
                  },
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
                            builder: (context) => const FindUserEmail2Page()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        Color(0xff0100FF), // Text Color (Foreground color)
                  ),
                  child: Text(
                    '인증번호 발송',
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
