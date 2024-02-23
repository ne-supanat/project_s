import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_s/helpers/sharedpref.dart';
import 'package:project_s/resources/resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project S',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      home: const MainPageView(),
    );
  }
}
