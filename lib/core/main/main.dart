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
    final customTheme = ThemeData(
      textTheme: GoogleFonts.nanumGothicTextTheme(),
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        // type: BottomNavigationBarType.fixed,
        backgroundColor: mainSilverColor,
        selectedItemColor: mainBrownColor,
        unselectedItemColor: Colors.black45,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        showUnselectedLabels: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: mainBrownColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: const Size(10, 55),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: const Size(10, 50),
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.resolveWith((state) {
            return mainSilverColor;
          }),
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: mainSilverColor,
        dayShape: WidgetStateProperty.resolveWith((_) =>
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        // 하이라이트된 날짜의 색을 바꾸는 것이나 코드 동작 안됨. 현재 보라색.
        dayOverlayColor: WidgetStateProperty.resolveWith((_) => mainBrownColor),
      ),
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: mainSilverColor,
      ),
      sliderTheme: const SliderThemeData(
        activeTrackColor: Colors.grey,
        inactiveTrackColor: Colors.grey,
        thumbColor: mainBrownColor,
      ),
      dialogBackgroundColor: mainSilverColor,
    );

    ScreenSize.initSize(context);

    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Sottie',
        routerConfig: CustomRouter.router,
        theme: customTheme,
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
