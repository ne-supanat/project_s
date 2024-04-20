import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:project_s/generated/l10n.dart';
import 'package:project_s/helpers/bg_audio_helper.dart';
import 'package:project_s/helpers/sharedpref.dart';

@GenerateNiceMocks([MockSpec<SharedPref>()])
@GenerateNiceMocks([MockSpec<BgAudioHelper>()])
//
extension WasteCategoryExtension on WidgetTester {
  Future<void> wrapAndPump(Widget widget) async {
    await pumpWidget(
      MaterialApp(
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
        home: widget,
      ),
    );
    await pumpAndSettle();
  }
}
