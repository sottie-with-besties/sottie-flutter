import 'package:flutter/material.dart';
import 'package:sottie_with_besties/signup_password_page.dart';
import 'package:sottie_with_besties/validate.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final formKey = GlobalKey<FormState>();

  FocusNode _nickNameFocus = new FocusNode();

  TextEditingController nickNameInputController = TextEditingController();

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
                height: 140,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Image.network(
                  'https://arc-cms-prod.imgix.net/content/2023-08/Tile1_32_Crop_0.png?auto=format%2Ccompress%2Cenhance&fit=crop&crop=focalpoint&q=75&ixlib=react-9.7.0&w=1946amp;w=3038',
                  width: 400,
                  height: 400,
                ),
              ),
              TextFormField(
                controller: nickNameInputController,
                focusNode: _nickNameFocus,
                decoration: InputDecoration(labelText: '닉네임'),
                validator: (value) => CheckValidate().validateEmail(_nickNameFocus, value!),
              ),
              SizedBox(
                height: 150,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPasswordPage(nickNameInputController.text)),);
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