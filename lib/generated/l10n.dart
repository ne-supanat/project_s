// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Waste Wise`
  String get common_title {
    return Intl.message(
      'Waste Wise',
      name: 'common_title',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get common_back {
    return Intl.message(
      'Back',
      name: 'common_back',
      desc: '',
      args: [],
    );
  }

  /// `{level, select, beginner{Beginner} normal{Normal} expert{Expert}}`
  String chalenge_level(Object level) {
    return Intl.select(
      level,
      {
        'beginner': 'Beginner',
        'normal': 'Normal',
        'expert': 'Expert',
      },
      name: 'chalenge_level',
      desc: '',
      args: [level],
    );
  }

  /// `{category, select, general{General} organic{Organic} recycle{Recyclable} danger{Hazardous}}`
  String waste_category_name(Object category) {
    return Intl.select(
      category,
      {
        'general': 'General',
        'organic': 'Organic',
        'recycle': 'Recyclable',
        'danger': 'Hazardous',
      },
      name: 'waste_category_name',
      desc: '',
      args: [category],
    );
  }

  /// `{type, select, general{General} organic{Organic} paper{Paper} plastic{Plastic} aluminium{Aluminium} glass{Glass} hazardous{Hazardous} electronic{Electronic}}`
  String waste_type_name(Object type) {
    return Intl.select(
      type,
      {
        'general': 'General',
        'organic': 'Organic',
        'paper': 'Paper',
        'plastic': 'Plastic',
        'aluminium': 'Aluminium',
        'glass': 'Glass',
        'hazardous': 'Hazardous',
        'electronic': 'Electronic',
      },
      name: 'waste_type_name',
      desc: '',
      args: [type],
    );
  }

  /// `{type, select, general{Everyday household waste that cannot be recycled, including items like used tissues, straw, and plastic bag.}  organic{Organic waste is biodegradable waste from kitchen scraps and yard trimmings, such as fruit peels, vegetable scraps, and grass clippings.}  paper{Paper-based materials that can be recycled, such as newspapers, magazines, cardboard boxes, and office paper.}  plastic{There are various types of plastic containers, bottles, and packaging that can be recycled, containing a symbol of PET (polyethylene terephthalate), HDPE (high-density polyethylene), and PVC (polyvinyl chloride).} aluminium{Aluminum objects like cans, foil, and other aluminum packaging.}  glass{Glass containers and bottles that can be recycled, including clear, green, and brown glass.} hazardous{Materials that might be dangerous to human health or the environment, such as batteries, pesticides, and certain household chemicals.}  electronic{Discarded electronic devices like computers, cell phones, and televisions, which contain hazardous materials and should be recycled responsibly.}}`
  String waste_type_description(Object type) {
    return Intl.select(
      type,
      {
        'general':
            'Everyday household waste that cannot be recycled, including items like used tissues, straw, and plastic bag.',
        'organic':
            'Organic waste is biodegradable waste from kitchen scraps and yard trimmings, such as fruit peels, vegetable scraps, and grass clippings.',
        'paper':
            'Paper-based materials that can be recycled, such as newspapers, magazines, cardboard boxes, and office paper.',
        'plastic':
            'There are various types of plastic containers, bottles, and packaging that can be recycled, containing a symbol of PET (polyethylene terephthalate), HDPE (high-density polyethylene), and PVC (polyvinyl chloride).',
        'aluminium':
            'Aluminum objects like cans, foil, and other aluminum packaging.',
        'glass':
            'Glass containers and bottles that can be recycled, including clear, green, and brown glass.',
        'hazardous':
            'Materials that might be dangerous to human health or the environment, such as batteries, pesticides, and certain household chemicals.',
        'electronic':
            'Discarded electronic devices like computers, cell phones, and televisions, which contain hazardous materials and should be recycled responsibly.',
      },
      name: 'waste_type_description',
      desc: '',
      args: [type],
    );
  }

  /// `- Press Anything to Start -`
  String get main_page_start {
    return Intl.message(
      '- Press Anything to Start -',
      name: 'main_page_start',
      desc: '',
      args: [],
    );
  }

  /// `Learning`
  String get main_page_learning {
    return Intl.message(
      'Learning',
      name: 'main_page_learning',
      desc: '',
      args: [],
    );
  }

  /// `Challenge`
  String get main_page_chalenge {
    return Intl.message(
      'Challenge',
      name: 'main_page_chalenge',
      desc: '',
      args: [],
    );
  }

  /// `Knowledge`
  String get main_page_knowledge {
    return Intl.message(
      'Knowledge',
      name: 'main_page_knowledge',
      desc: '',
      args: [],
    );
  }

  /// `Tutorial`
  String get main_page_tutorial {
    return Intl.message(
      'Tutorial',
      name: 'main_page_tutorial',
      desc: '',
      args: [],
    );
  }

  /// `- Difficulty -`
  String get chalenge_level_select_page_title {
    return Intl.message(
      '- Difficulty -',
      name: 'chalenge_level_select_page_title',
      desc: '',
      args: [],
    );
  }

  /// `- sorting methods might be different between countries -`
  String get knowledge_dialog_warning {
    return Intl.message(
      '- sorting methods might be different between countries -',
      name: 'knowledge_dialog_warning',
      desc: '',
      args: [],
    );
  }

  /// `- always try to fix and reuse before thow anything away -`
  String get knowledge_dialog_recommend {
    return Intl.message(
      '- always try to fix and reuse before thow anything away -',
      name: 'knowledge_dialog_recommend',
      desc: '',
      args: [],
    );
  }

  /// `Category: `
  String get knowledge_dialog_category {
    return Intl.message(
      'Category: ',
      name: 'knowledge_dialog_category',
      desc: '',
      args: [],
    );
  }

  /// `Mode`
  String get tutorial_dialog_mode_title {
    return Intl.message(
      'Mode',
      name: 'tutorial_dialog_mode_title',
      desc: '',
      args: [],
    );
  }

  /// `1. Learning`
  String get tutorial_dialog_mode_learning_title {
    return Intl.message(
      '1. Learning',
      name: 'tutorial_dialog_mode_learning_title',
      desc: '',
      args: [],
    );
  }

  /// `Learning mode allow you to practice with several levels, each level has its own set of items and no time limit to play. Remember practice make perfect.`
  String get tutorial_dialog_mode_learning_desc {
    return Intl.message(
      'Learning mode allow you to practice with several levels, each level has its own set of items and no time limit to play. Remember practice make perfect.',
      name: 'tutorial_dialog_mode_learning_desc',
      desc: '',
      args: [],
    );
  }

  /// `2. Challenge`
  String get tutorial_dialog_mode_chalenge_title {
    return Intl.message(
      '2. Challenge',
      name: 'tutorial_dialog_mode_chalenge_title',
      desc: '',
      args: [],
    );
  }

  /// `Challenge mode or in another word an Endless mode, you can play it forever and get a higher score. Your only enemy is time, you will have a few seconds (depends on difficulty level) to make a correct move and reset the timer. If the time hit zero, that's the end of the challenge.`
  String get tutorial_dialog_mode_chalenge_desc {
    return Intl.message(
      'Challenge mode or in another word an Endless mode, you can play it forever and get a higher score. Your only enemy is time, you will have a few seconds (depends on difficulty level) to make a correct move and reset the timer. If the time hit zero, that\'s the end of the challenge.',
      name: 'tutorial_dialog_mode_chalenge_desc',
      desc: '',
      args: [],
    );
  }

  /// `Card`
  String get tutorial_dialog_card_title {
    return Intl.message(
      'Card',
      name: 'tutorial_dialog_card_title',
      desc: '',
      args: [],
    );
  }

  /// `1. name of the item`
  String get tutorial_dialog_card_line1 {
    return Intl.message(
      '1. name of the item',
      name: 'tutorial_dialog_card_line1',
      desc: '',
      args: [],
    );
  }

  /// `2. image of the item`
  String get tutorial_dialog_card_line2 {
    return Intl.message(
      '2. image of the item',
      name: 'tutorial_dialog_card_line2',
      desc: '',
      args: [],
    );
  }

  /// `3. hint (item's category)`
  String get tutorial_dialog_card_line3 {
    return Intl.message(
      '3. hint (item\'s category)',
      name: 'tutorial_dialog_card_line3',
      desc: '',
      args: [],
    );
  }

  /// `Board`
  String get tutorial_dialog_board_title {
    return Intl.message(
      'Board',
      name: 'tutorial_dialog_board_title',
      desc: '',
      args: [],
    );
  }

  /// `This game separates items to 8 types (you can learn more in "Knowledge")`
  String get tutorial_dialog_board_line1 {
    return Intl.message(
      'This game separates items to 8 types (you can learn more in "Knowledge")',
      name: 'tutorial_dialog_board_line1',
      desc: '',
      args: [],
    );
  }

  /// `Drag and drop card into its type to gain a point`
  String get tutorial_dialog_board_line2 {
    return Intl.message(
      'Drag and drop card into its type to gain a point',
      name: 'tutorial_dialog_board_line2',
      desc: '',
      args: [],
    );
  }

  /// `Helper`
  String get tutorial_dialog_helper_title {
    return Intl.message(
      'Helper',
      name: 'tutorial_dialog_helper_title',
      desc: '',
      args: [],
    );
  }

  /// `Knowledge`
  String get tutorial_dialog_helper_knowledge_title {
    return Intl.message(
      'Knowledge',
      name: 'tutorial_dialog_helper_knowledge_title',
      desc: '',
      args: [],
    );
  }

  /// `Show data of types, categories and items.`
  String get tutorial_dialog_helper_knowledge_decs {
    return Intl.message(
      'Show data of types, categories and items.',
      name: 'tutorial_dialog_helper_knowledge_decs',
      desc: '',
      args: [],
    );
  }

  /// `Hint`
  String get tutorial_dialog_helper_hint_title {
    return Intl.message(
      'Hint',
      name: 'tutorial_dialog_helper_hint_title',
      desc: '',
      args: [],
    );
  }

  /// `Switch the visibility of hint on card`
  String get tutorial_dialog_helper_hint_decs {
    return Intl.message(
      'Switch the visibility of hint on card',
      name: 'tutorial_dialog_helper_hint_decs',
      desc: '',
      args: [],
    );
  }

  /// `Level not found`
  String get game_page_level_not_found {
    return Intl.message(
      'Level not found',
      name: 'game_page_level_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Score: {score}`
  String game_page_score(Object score) {
    return Intl.message(
      'Score: $score',
      name: 'game_page_score',
      desc: '',
      args: [score],
    );
  }

  /// `Score`
  String get chalenge_end_dialog_score {
    return Intl.message(
      'Score',
      name: 'chalenge_end_dialog_score',
      desc: '',
      args: [],
    );
  }

  /// `New High Score`
  String get chalenge_end_dialog_new_high_score {
    return Intl.message(
      'New High Score',
      name: 'chalenge_end_dialog_new_high_score',
      desc: '',
      args: [],
    );
  }

  /// `Your High Score is `
  String get chalenge_end_dialog_high_score_is {
    return Intl.message(
      'Your High Score is ',
      name: 'chalenge_end_dialog_high_score_is',
      desc: '',
      args: [],
    );
  }

  /// `Play Again`
  String get chalenge_end_dialog_play_again {
    return Intl.message(
      'Play Again',
      name: 'chalenge_end_dialog_play_again',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get chalenge_end_dialog_back {
    return Intl.message(
      'Back',
      name: 'chalenge_end_dialog_back',
      desc: '',
      args: [],
    );
  }

  /// `Ace!`
  String get learning_end_dialog_star3 {
    return Intl.message(
      'Ace!',
      name: 'learning_end_dialog_star3',
      desc: '',
      args: [],
    );
  }

  /// `you did it, perfectly`
  String get learning_end_dialog_star3_sub {
    return Intl.message(
      'you did it, perfectly',
      name: 'learning_end_dialog_star3_sub',
      desc: '',
      args: [],
    );
  }

  /// `Bravo!`
  String get learning_end_dialog_star2 {
    return Intl.message(
      'Bravo!',
      name: 'learning_end_dialog_star2',
      desc: '',
      args: [],
    );
  }

  /// `only a few mistakes`
  String get learning_end_dialog_star2_sub {
    return Intl.message(
      'only a few mistakes',
      name: 'learning_end_dialog_star2_sub',
      desc: '',
      args: [],
    );
  }

  /// `Hmm...`
  String get learning_end_dialog_star1 {
    return Intl.message(
      'Hmm...',
      name: 'learning_end_dialog_star1',
      desc: '',
      args: [],
    );
  }

  /// `there's still room to grow`
  String get learning_end_dialog_star1_sub {
    return Intl.message(
      'there\'s still room to grow',
      name: 'learning_end_dialog_star1_sub',
      desc: '',
      args: [],
    );
  }

  /// `Oops!`
  String get learning_end_dialog_star0 {
    return Intl.message(
      'Oops!',
      name: 'learning_end_dialog_star0',
      desc: '',
      args: [],
    );
  }

  /// `Let's learn and try again`
  String get learning_end_dialog_star0_sub {
    return Intl.message(
      'Let\'s learn and try again',
      name: 'learning_end_dialog_star0_sub',
      desc: '',
      args: [],
    );
  }

  /// `Play Again`
  String get learning_end_dialog_play_again {
    return Intl.message(
      'Play Again',
      name: 'learning_end_dialog_play_again',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get learning_end_dialog_back {
    return Intl.message(
      'Back',
      name: 'learning_end_dialog_back',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
