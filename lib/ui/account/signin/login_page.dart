import 'package:flutter/material.dart';
import 'package:sottie_with_besties/data/datasource/account_data_source.dart';

import '../../../data/model/login_model.dart';
import '../../friend/friend_list.dart';
import '../find/email/find_user_email_page_1.dart';
import '../find/password/find_user_password_page_1.dart';
import '../signup/signup_email_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();

  FocusNode _emailFocus = new FocusNode();
  FocusNode _passwordFocus = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 200,
                ),
                TextFormField(
                  controller: emailInputController,
                  obscureText: false,
                  focusNode: _emailFocus,
                  decoration: InputDecoration(labelText: '이메일'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '이메일을 입력해주세요.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordInputController,
                  obscureText: true,
                  focusNode: _passwordFocus,
                  decoration: InputDecoration(labelText: '비밀번호'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 입력해주세요.';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (formKey.currentState!.validate()) {
                      // CheckValidate().showToast();
                      AccountDataSource().logIn(LogIn(
                          email: emailInputController.text,
                          password: passwordInputController.text));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FriendListPage()),
                      );
                    } else {}
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        Color(0xff0100FF), // Text Color (Foreground color)
                  ),
                  child: Text(
                    '로그인',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        Color(0xff2F9D27), // Text Color (Foreground color)
                  ),
                  child: Text(
                    'NAVER로 로그인',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '가입은 개인정보 이용을 동의하는 것으로 간주 합니다.',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpEmailPage()),
                        );
                      },
                      child: const Text(
                        '회원가입',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FindUserEmail1Page()),
                              );
                            },
                            child: const Text(
                              'ID찾기',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FindUserPassword1Page()),
                              );
                            },
                            child: const Text(
                              '비밀번호찾기',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
