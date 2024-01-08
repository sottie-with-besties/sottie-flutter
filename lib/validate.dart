import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CheckValidate{
  String? validateEmail(FocusNode focusNode, String value){
    if(value.isEmpty){
      focusNode.requestFocus();
      return '이메일을 입력해주세요.';
    }else {
      String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);
      if(!regExp.hasMatch(value)){
        focusNode.requestFocus();	//포커스를 해당 textformfield에 맞춘다.
        return '잘못된 이메일 형식이에요.';
      }else{
        return null;
      }
    }
  }

  String? validatePassword(FocusNode focusNode, String value){
    if(value.isEmpty){
      focusNode.requestFocus();
      return '비밀번호를 입력해주세요.';
    }else {
      String pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$';
      RegExp regExp = new RegExp(pattern);
      if(!regExp.hasMatch(value)){
        focusNode.requestFocus();
        return '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력해주세요.';
      }else{
        return null;
      }
    }
  }

  String? validatePhoneNumber(FocusNode focusNode, String value){
    if(value.isEmpty){
      focusNode.requestFocus();
      return '핸드폰번호를 입력해주세요.';
    }else {
      String pattern = r'^010-?([0-9]{4})-?([0-9]{4})$';
      RegExp regExp = new RegExp(pattern);
      if(!regExp.hasMatch(value)){
        focusNode.requestFocus();
        return '핸드폰번호를 한번 더 확인해주세요.';
      }else{
        return null;
      }
    }
  }

  String? confirmPassword(String password, String confirmPassword, FocusNode focusNode){
    if(password != confirmPassword){
      focusNode.requestFocus();
      return '비밀번호가 일치하지 않아요.';
    } else {
      return null;
    }
  }
}