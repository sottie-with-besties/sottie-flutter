import 'package:flutter/material.dart';

import '../../core/utils/validate.dart';


class AddFriend1Page extends StatefulWidget {
  const AddFriend1Page({super.key});

  @override
  _AddFriend1PageState createState() => _AddFriend1PageState();
}

class _AddFriend1PageState extends State<AddFriend1Page> {

  final formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberInputController = TextEditingController();

  FocusNode _phoneNumberFocus = new FocusNode();

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
                controller: phoneNumberInputController,
                focusNode: _phoneNumberFocus,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(labelText: '핸드폰번호'),
                validator: (value) => CheckValidate().validatePhoneNumber(_phoneNumberFocus, value!),
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
                  '친구 찾기',
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