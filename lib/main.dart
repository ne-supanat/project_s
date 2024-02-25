import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_s/helpers/sharedpref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/bg_audio_helper.dart';
import 'helpers/translations.dart';
import 'pages/main_page_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDI();

  await TranslationKeys.init();

  runApp(const MyApp());
}

initDI() async {
  final getIt = GetIt.instance;

  SharedPreferences prefs = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPref>(SharedPref(prefs));
  getIt.registerSingleton<BgAudioHelper>(BgAudioHelper());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TranslationKeys.common_title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      home: const MainPageView(),
    );
  }
}
