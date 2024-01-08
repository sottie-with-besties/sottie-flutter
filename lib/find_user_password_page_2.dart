import 'package:flutter/material.dart';
import 'find_user_password_page_3.dart';

class FindUserPassword2Page extends StatefulWidget {
  const FindUserPassword2Page({super.key});

  @override
  _FindUserPassword2PageState createState() => _FindUserPassword2PageState();
}

class _FindUserPassword2PageState extends State<FindUserPassword2Page> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 40.0,
                    child: TextField(
                      maxLength: 1,
                      style: TextStyle(fontSize: 40.0, height: 1.5, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  const SizedBox(
                    width: 40.0,
                    child: TextField(
                      maxLength: 1,
                      style: TextStyle(fontSize: 40.0, height: 1.5, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  const SizedBox(
                    width: 40.0,
                    child: TextField(
                      maxLength: 1,
                      style: TextStyle(fontSize: 40.0, height: 1.5, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  const SizedBox(
                    width: 40.0,
                    child: TextField(
                      maxLength: 1,
                      style: TextStyle(fontSize: 40.0, height: 1.5, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  const SizedBox(
                    width: 40.0,
                    child: TextField(
                      maxLength: 1,
                      style: TextStyle(fontSize: 40.0, height: 1.5, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  const SizedBox(
                    width: 40.0,
                    child: TextField(
                      maxLength: 1,
                      style: TextStyle(fontSize: 40.0, height: 1.5, color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 250,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FindUserPassword3Page()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xff0100FF), // Text Color (Foreground color)
                ),
                child: Text(
                  '인증번호 확인',
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