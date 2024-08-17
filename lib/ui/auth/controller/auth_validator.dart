String? validateEmail(String value) {
  if (value.isEmpty) {
    return '이메일을 입력해주세요.';
  } else {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return '잘못된 이메일 형식이에요.';
    } else {
      return null;
    }
  }
}

String? validatePassword(String value) {
  if (value.isEmpty) {
    return '비밀번호를 입력해주세요.';
  } else {
    String pattern =
        r'^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{7,15}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력해주세요.';
    } else {
      return null;
    }
  }
}

String? validatePhoneNumber(String value) {
  if (value.isEmpty) {
    return '핸드폰번호를 입력해주세요.';
  } else {
    String pattern = r'^010-?([0-9]{4})-?([0-9]{4})$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return '핸드폰번호를 한번 더 확인해주세요.';
    } else {
      return null;
    }
  }
}

String? confirmPassword(String password, String confirmPassword) {
  if (password != confirmPassword) {
    return '비밀번호가 일치하지 않아요.';
  } else {
    return null;
  }
}
