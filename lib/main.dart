import 'package:cryptovisor/DI/injection_dependencies.dart';
import 'package:cryptovisor/routes/route_generate.dart';
import 'package:cryptovisor/screens/helper/crypto_visor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsFlutterBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsFlutterBinding);
  DI.setupDependencies();

  runApp(const MyApp());
  FlutterNativeSplash.remove();
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
