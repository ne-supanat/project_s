import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_s/helpers/sharedpref.dart';
import 'package:project_s/pages/chalenge_select_page_view.dart';
import 'package:project_s/pages/game_page_view.dart';
import 'package:project_s/pages/level_select_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/chalenge_level.dart';
import 'pages/main_page_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDI();

  runApp(const MyApp());
}

initDI() async {
  final getIt = GetIt.instance;

  SharedPreferences prefs = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPref>(SharedPref(prefs));

  await getIt.get<SharedPref>().init();
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
        // GoogleFonts.comicNeueTextTheme(),
        // GoogleFonts.concertOneTextTheme(),
      ),
      home: const MainPageView(),
      // const ChalengeSelectPageView(),
      // const LevelSelectPageView(),
      // GamePageView(
      //     arguments: GamePageViewArguments(level: 4, chalengeLevel: ChalengeLevel.expert)),
    );
  }
}
