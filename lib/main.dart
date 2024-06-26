import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:project_s/generated/assets.gen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/main_menu/main_menu_view.dart';
import 'generated/l10n.dart';
import 'helpers/bg_audio_helper.dart';
import 'helpers/sharedpref.dart';
import 'helpers/waste_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDI();

  await WasteHelper.init();

  runApp(const MyApp());
}

initDI() async {
  final getIt = GetIt.instance;

  SharedPreferences prefs = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPref>(SharedPref(prefs));
  getIt.registerSingleton<BgAudioHelper>(BgAudioHelper(AudioPlayer()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(Assets.images.bgAnimation.path), context);

    return MaterialApp(
      onGenerateTitle: (context) => S.of(context).common_title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        fontFamily: 'Quicksand',
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const MainMenuView(),
    );
  }
}
