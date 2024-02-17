import 'package:flutter/material.dart';
import 'package:project_s/pages/game_page_view.dart';

import 'pages/main_page_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project S',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent.shade400),
        useMaterial3: true,
      ),
      home:
          //const MainPageView(),
          GamePageView(arguments: GamePageViewArguments(level: 4)),
    );
  }
}
