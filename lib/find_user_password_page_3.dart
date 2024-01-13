import 'package:flutter/material.dart';

class FindUserPassword3Page extends StatefulWidget {
  const FindUserPassword3Page({super.key});

  @override
  _FindUserPassword3PageState createState() => _FindUserPassword3PageState();
}

class _FindUserPassword3PageState extends State<FindUserPassword3Page> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비밀번호 찾기'),
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
                  decoration: InputDecoration(labelText: '비밀번호'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 입력해주세요.';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '비밀번호 확인'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 확인해주세요.';
                    }
                    return null;
                  },
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
                    foregroundColor: Colors.white,
                    backgroundColor:
                        Color(0xff0100FF), // Text Color (Foreground color)
                  ),
                  child: Text(
                    '비밀번호 재설정',
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
