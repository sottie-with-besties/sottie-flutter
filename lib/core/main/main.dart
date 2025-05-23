import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sottie_flutter/core/Firebase/firebase_options.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/constant/native_key.dart';
import 'package:sottie_flutter/core/local_database/object_box_store.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initApp();

  runApp(const Sottie());
}

class Sottie extends StatelessWidget {
  const Sottie({super.key});

  @override
  Widget build(BuildContext context) {
    /// 단위 길이 초기화
    ScreenSize.initScreenSize(context);

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

Future<void> _initApp() async {
  /// 파이어베이스
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// 카카오
  KakaoSdk.init(
    nativeAppKey: NativeKey.nativeAppKey,
    javaScriptAppKey: NativeKey.javaScriptKey,
  );

  /// 화면 세로 고정
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /// local db 초기화
  await ObjectBoxStore().initObjectBox();
}

final _customTheme = ThemeData(
  textTheme: GoogleFonts.nanumGothicTextTheme(),
  appBarTheme: AppBarTheme(
    color: AppColors.whiteSilverColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor,
      fontSize: 15 * ScreenSize.hu,
      overflow: TextOverflow.ellipsis,
    ),
    scrolledUnderElevation: 0,
  ),
  scaffoldBackgroundColor: AppColors.whiteSilverColor,
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: AppColors.whiteSilverColor,
    indicatorColor: AppColors.blueColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.blueColor,
      foregroundColor: AppColors.whiteSilverColor,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
      minimumSize: const Size(80, 40),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.blackColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.blackColor),
        borderRadius: BorderRadius.circular(8),
      ),
      minimumSize: const Size(60, 40),
    ),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    menuStyle: MenuStyle(
      backgroundColor: WidgetStateProperty.resolveWith((state) {
        return AppColors.whiteSilverColor;
      }),
    ),
  ),
  datePickerTheme: DatePickerThemeData(
    backgroundColor: AppColors.whiteSilverColor,
    dayShape: WidgetStateProperty.resolveWith(
      (_) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
    // 하이라이트된 날짜의 색을 바꾸는 것이나 코드 동작 안됨. 현재 보라색.
    dayOverlayColor: WidgetStateProperty.resolveWith(
      (_) => AppColors.whiteSilverColor,
    ),
  ),
  timePickerTheme: const TimePickerThemeData(
    backgroundColor: AppColors.whiteSilverColor,
  ),
  sliderTheme: const SliderThemeData(
    activeTrackColor: AppColors.blueColor,
    inactiveTrackColor: AppColors.greyColor,
    thumbColor: AppColors.blueColor,
  ),
  dialogTheme: const DialogThemeData(
    backgroundColor: AppColors.whiteSilverColor,
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: AppColors.blueColor,
    contentTextStyle: TextStyle(
      color: AppColors.whiteSilverColor,
      fontWeight: FontWeight.bold,
    ),
  ),
  chipTheme: ChipThemeData(
    selectedColor: AppColors.blueColor,
    backgroundColor: AppColors.whiteSilverColor,
    checkmarkColor: AppColors.whiteSilverColor,
    shape: RoundedRectangleBorder(
      side: const BorderSide(width: 0),
      borderRadius: BorderRadius.circular(32),
    ),
    labelStyle: const TextStyle(color: Colors.black),
  ),
);
