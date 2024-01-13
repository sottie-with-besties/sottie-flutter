import 'package:flutter/material.dart';

class RouterUtil{
  void navigateWithoutData({required BuildContext context, required Widget pageTo}){
    Navigator.push(context, MaterialPageRoute(builder: (context) => pageTo));
  }

  void navigateWithoutDataByReplacing({required BuildContext context, required Widget pageTo}){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => pageTo));
  }

  // TODO: 데이터 반환에 대한 라우터 정의
}