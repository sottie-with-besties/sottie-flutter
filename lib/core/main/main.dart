import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sottie_flutter/core/constant/custom_theme.dart';
import 'package:sottie_flutter/core/router/router.dart';

void main() {
  runApp(const Sottie());
}

class Sottie extends StatelessWidget {
  const Sottie({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
