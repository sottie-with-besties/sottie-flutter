import 'package:flutter/material.dart';


class FindUserPassword3Page extends StatefulWidget {
  const FindUserPassword3Page({super.key});

  @override
  _FindUserPassword3PageState createState() => _FindUserPassword3PageState();
}

class _FindUserPassword3PageState extends State<FindUserPassword3Page> {
  final formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;

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
              Text(
                'sottie@sottie.com'
              ),
              SizedBox(
                height: 250,
              ),
              ElevatedButton(
                onPressed: () {
                  // if (formKey.currentState!.validate()) {
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => CertificationPage()),
                  //   );
                  // } else {
                  //
                  // }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xff0100FF), // Text Color (Foreground color)
                ),
                child: Text(
                  '로그인',
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