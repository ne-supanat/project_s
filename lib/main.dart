import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_s/app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Project S',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent.shade400),
        useMaterial3: true,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
