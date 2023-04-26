import 'package:chatgpt_flutter_case/core/constants/constants_shelf.dart';
import 'package:chatgpt_flutter_case/core/services/locale_services/navigation_service.dart';
import 'package:chatgpt_flutter_case/env/env.dart';
import 'package:chatgpt_flutter_case/views/splash_screen.dart';
import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'core/core_shelf.dart' as core;
import 'core/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocators();
  OpenAI.apiKey = Env.openAIApiKey;
  await GVariables.spService.init();
  var themeProvider = core.ThemeProvider.instance;
  await themeProvider.fetchLocale();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(MultiProvider(
    providers: [...?core.ApplicationProvider.instance?.dependItems],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<core.ThemeProvider>(builder: (context, themeProvider, child) {
      return MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          theme: themeProvider.theme,
          debugShowCheckedModeBanner: false,
          title: 'ChatGPT Client',
          navigatorKey: NavigationService.instance.navigatorKey,
          home: const SplashScreen(),
        ),
      );
    });
  }
}
