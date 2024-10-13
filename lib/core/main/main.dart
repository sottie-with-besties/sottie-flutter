import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sottie_flutter/core/Firebase/firebase_options.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/constant/native_key.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initSdks();

  runApp(const Sottie());
}

class Sottie extends StatelessWidget {
  const Sottie({super.key});

  @override
  Widget build(BuildContext context) {
    // 단위 길이 초기화
    wu = MediaQuery.of(context).size.width / 320;
    hu = MediaQuery.of(context).size.height / 690;

    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Sottie',
        routerConfig: CustomRouter.router,
        theme: _customTheme,
      ),
    );
  }
}

Future<void> _initSdks() async {
  // 파이어베이스
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 카카오
  KakaoSdk.init(
    nativeAppKey: nativeAppKey,
    javaScriptAppKey: javaScriptKey,
  );
}

final _customTheme = ThemeData(
  textTheme: GoogleFonts.nanumGothicTextTheme(),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: mainBlackColor,
      fontSize: 15 * hu,
      overflow: TextOverflow.ellipsis,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: mainWhiteSilverColor,
    indicatorColor: mainBlueColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: mainBlueColor,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
      minimumSize: const Size(100, 50),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
      minimumSize: const Size(10, 50),
    ),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    menuStyle: MenuStyle(
      backgroundColor: WidgetStateProperty.resolveWith((state) {
        return mainWhiteSilverColor;
      }),
    ),
  ),
  datePickerTheme: DatePickerThemeData(
    backgroundColor: mainWhiteSilverColor,
    dayShape: WidgetStateProperty.resolveWith(
        (_) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
    // 하이라이트된 날짜의 색을 바꾸는 것이나 코드 동작 안됨. 현재 보라색.
    dayOverlayColor:
        WidgetStateProperty.resolveWith((_) => mainWhiteSilverColor),
  ),
  timePickerTheme: const TimePickerThemeData(
    backgroundColor: mainWhiteSilverColor,
  ),
  sliderTheme: const SliderThemeData(
    activeTrackColor: mainBlueColor,
    inactiveTrackColor: Colors.grey,
    thumbColor: mainBlueColor,
  ),
  dialogBackgroundColor: mainWhiteSilverColor,
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: mainBlueColor,
    contentTextStyle: TextStyle(
      color: mainWhiteSilverColor,
      fontWeight: FontWeight.bold,
    ),
  ),
  chipTheme: ChipThemeData(
    selectedColor: mainBlueColor,
    backgroundColor: mainWhiteSilverColor,
    checkmarkColor: mainWhiteSilverColor,
    shape: RoundedRectangleBorder(
      side: const BorderSide(width: 0),
      borderRadius: BorderRadius.circular(32),
    ),
    labelStyle: const TextStyle(
      color: Colors.black,
    ),
  ),
);
