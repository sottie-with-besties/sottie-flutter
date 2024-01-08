import 'package:flutter/material.dart';
import 'package:sottie_with_besties/validate.dart';


class FindFriendPage extends StatefulWidget {
  const FindFriendPage({super.key});

  @override
  _FindFriendPageState createState() => _FindFriendPageState();
}

class _FindFriendPageState extends State<FindFriendPage> {

  final formKey = GlobalKey<FormState>();

  TextEditingController nickNameInputController = TextEditingController();

  FocusNode _nickNameFocus = new FocusNode();

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
                controller: nickNameInputController,
                focusNode: _nickNameFocus,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(labelText: '닉네임'),
              ),
              SizedBox(
                height: 250,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                  } else {
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xff0100FF), // Text Color (Foreground color)
                ),
                child: Text(
                  '친구 검색',
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