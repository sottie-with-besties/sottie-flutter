import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/router/router.dart';

void main() {
  runApp(const Sottie());
}

class Sottie extends StatelessWidget {
  const Sottie({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sottie',
      routerConfig: CustomRouter.router,
    );
  }
}
