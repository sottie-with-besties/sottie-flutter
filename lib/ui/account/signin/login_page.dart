import 'package:flutter/material.dart';
import 'package:sottie_with_besties/core/utils/router_util.dart';
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
  final RouterUtil _routerUtil = RouterUtil();
  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController passwordInputController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
          },
        ),
        title: Text("title"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
            },
          ),
          SizedBox(width: 6),
          IconButton(
            icon: const Icon(Icons.person_add_alt),
            onPressed: () {
            },
          ),
          SizedBox(width: 6),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      controller: emailInputController,
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
                    SizedBox(height: size.height * 0.05),
                    loginButtonWidget('로그인', Color(0xff0100FF), () {
                      if (formKey.currentState!.validate()) {
                        AccountDataSource().logIn(LogIn(
                            email: emailInputController.text,
                            password: passwordInputController.text));
                        _routerUtil.navigateWithoutData(
                            context: context, pageTo: FriendListPage());
                      } else {}
                    }),
                    SizedBox(height: size.height * 0.002),
                    loginButtonWidget('NAVER로 로그인', Color(0xff2F9D27), () {}),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      '가입은 개인정보 이용을 동의하는 것으로 간주 합니다.',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      children: [
                        bottomButtonWidget('회원가입', SignUpEmailPage()),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              bottomButtonWidget('ID찾기', FindUserEmail1Page()),
                              SizedBox(width: size.width * 0.015),
                              bottomButtonWidget(
                                  '비밀번호찾기', FindUserPassword1Page())
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginButtonWidget(
      String title, Color backgroundColor, void Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: backgroundColor),
      child: Text(title, style: TextStyle(fontSize: 16)),
    );
  }

  Widget bottomButtonWidget(String title, Widget pageTo) {
    return InkWell(
        onTap: () =>
            _routerUtil.navigateWithoutData(context: context, pageTo: pageTo),
        child: Text(title,
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                decoration: TextDecoration.underline)));
  }
}
