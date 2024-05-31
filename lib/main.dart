import 'package:cryptovisor/DI/injection_dependencies.dart';
import 'package:cryptovisor/routes/route_generate.dart';
import 'package:cryptovisor/screens/helper/crypto_visor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DI.setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp.router(
      theme: ThemeData(
          fontFamily: 'Inter',
          useMaterial3: false,
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: CryptoVisorColors.scaffoldColor,
            cursorColor: CryptoVisorColors.scaffoldColor,
          )),
      debugShowCheckedModeBanner: false,
      routerConfig: RouteGenerate.router,
    );
  }
}
