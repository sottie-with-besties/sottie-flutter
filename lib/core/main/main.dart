import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sottie_flutter/core/Firebase/firebase_options.dart';
import 'package:sottie_flutter/core/constant/native_key.dart';
import 'package:sottie_flutter/core/router/router.dart';

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
      textTheme: GoogleFonts.juaTextTheme(),
    );

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, __) {
        return MaterialApp.router(
          title: 'Sottie',
          routerConfig: CustomRouter.router,
          theme: customTheme,
        );
      },
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
