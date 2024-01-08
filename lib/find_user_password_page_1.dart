import 'package:flutter/material.dart';
import 'find_user_password_page_2.dart';

class FindUserPassword1Page extends StatefulWidget {
  const FindUserPassword1Page({super.key});

  @override
  _FindUserPassword1PageState createState() => _FindUserPassword1PageState();
}

class _FindUserPassword1PageState extends State<FindUserPassword1Page> {
  final formKey = GlobalKey<FormState>();

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
                decoration: InputDecoration(labelText: '핸드폰 번호'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '핸드폰 번호를 입력해주세요.';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 250,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FindUserPassword2Page()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xff0100FF), // Text Color (Foreground color)
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
    );
  }



}