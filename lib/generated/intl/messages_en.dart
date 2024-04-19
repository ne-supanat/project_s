// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(level) => "${Intl.select(level, {
            'beginner': 'Beginner',
            'normal': 'Normal',
            'expert': 'Expert',
          })}";

  static String m1(score) => "Score: ${score}";

  static String m2(category) => "${Intl.select(category, {
            'general': 'General',
            'organic': 'Organic',
            'recycle': 'Recyclable',
            'danger': 'Hazardous',
          })}";

  static String m3(type) => "${Intl.select(type, {
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
          })}";

  static String m4(type) => "${Intl.select(type, {
            'general': 'General',
            'organic': 'Organic',
            'paper': 'Paper',
            'plastic': 'Plastic',
            'aluminium': 'Aluminium',
            'glass': 'Glass',
            'hazardous': 'Hazardous',
            'electronic': 'Electronic',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "chalenge_end_dialog_back":
            MessageLookupByLibrary.simpleMessage("Back"),
        "chalenge_end_dialog_high_score_is":
            MessageLookupByLibrary.simpleMessage("Your High Score is "),
        "chalenge_end_dialog_new_high_score":
            MessageLookupByLibrary.simpleMessage("New High Score"),
        "chalenge_end_dialog_play_again":
            MessageLookupByLibrary.simpleMessage("Play Again"),
        "chalenge_end_dialog_score":
            MessageLookupByLibrary.simpleMessage("Score"),
        "chalenge_level": m0,
        "chalenge_level_select_page_title":
            MessageLookupByLibrary.simpleMessage("- Difficulty -"),
        "common_back": MessageLookupByLibrary.simpleMessage("Back"),
        "common_title": MessageLookupByLibrary.simpleMessage("Waste Wise"),
        "game_page_level_not_found":
            MessageLookupByLibrary.simpleMessage("Level not found"),
        "game_page_score": m1,
        "knowledge_dialog_category":
            MessageLookupByLibrary.simpleMessage("Category: "),
        "knowledge_dialog_recommend": MessageLookupByLibrary.simpleMessage(
            "- always try to fix and reuse before thow anything away -"),
        "knowledge_dialog_warning": MessageLookupByLibrary.simpleMessage(
            "- sorting methods might be different between countries -"),
        "learning_end_dialog_back":
            MessageLookupByLibrary.simpleMessage("Back"),
        "learning_end_dialog_play_again":
            MessageLookupByLibrary.simpleMessage("Play Again"),
        "learning_end_dialog_star0":
            MessageLookupByLibrary.simpleMessage("Oops!"),
        "learning_end_dialog_star0_sub":
            MessageLookupByLibrary.simpleMessage("Let\'s learn and try again"),
        "learning_end_dialog_star1":
            MessageLookupByLibrary.simpleMessage("Hmm..."),
        "learning_end_dialog_star1_sub":
            MessageLookupByLibrary.simpleMessage("there\'s still room to grow"),
        "learning_end_dialog_star2":
            MessageLookupByLibrary.simpleMessage("Bravo!"),
        "learning_end_dialog_star2_sub":
            MessageLookupByLibrary.simpleMessage("only a few mistakes"),
        "learning_end_dialog_star3":
            MessageLookupByLibrary.simpleMessage("Ace!"),
        "learning_end_dialog_star3_sub":
            MessageLookupByLibrary.simpleMessage("you did it, perfectly"),
        "main_page_chalenge": MessageLookupByLibrary.simpleMessage("Challenge"),
        "main_page_knowledge":
            MessageLookupByLibrary.simpleMessage("Knowledge"),
        "main_page_learning": MessageLookupByLibrary.simpleMessage("Learning"),
        "main_page_start":
            MessageLookupByLibrary.simpleMessage("- Press Anything to Start -"),
        "main_page_tutorial": MessageLookupByLibrary.simpleMessage("Tutorial"),
        "tutorial_dialog_board_line1": MessageLookupByLibrary.simpleMessage(
            "This game separates items to 8 types (you can learn more in \"Knowledge\")"),
        "tutorial_dialog_board_line2": MessageLookupByLibrary.simpleMessage(
            "Drag and drop card into its type to gain a point"),
        "tutorial_dialog_board_title":
            MessageLookupByLibrary.simpleMessage("Board"),
        "tutorial_dialog_card_line1":
            MessageLookupByLibrary.simpleMessage("1. name of the item"),
        "tutorial_dialog_card_line2":
            MessageLookupByLibrary.simpleMessage("2. image of the item"),
        "tutorial_dialog_card_line3":
            MessageLookupByLibrary.simpleMessage("3. hint (item\'s category)"),
        "tutorial_dialog_card_title":
            MessageLookupByLibrary.simpleMessage("Card"),
        "tutorial_dialog_helper_hint_decs":
            MessageLookupByLibrary.simpleMessage(
                "Switch the visibility of hint on card"),
        "tutorial_dialog_helper_hint_title":
            MessageLookupByLibrary.simpleMessage("Hint"),
        "tutorial_dialog_helper_knowledge_decs":
            MessageLookupByLibrary.simpleMessage(
                "Show data of types, categories and items."),
        "tutorial_dialog_helper_knowledge_title":
            MessageLookupByLibrary.simpleMessage("Knowledge"),
        "tutorial_dialog_helper_title":
            MessageLookupByLibrary.simpleMessage("Helper"),
        "tutorial_dialog_mode_chalenge_desc": MessageLookupByLibrary.simpleMessage(
            "Challenge mode or in another word an Endless mode, you can play it forever and get a higher score. Your only enemy is time, you will have a few seconds (depends on difficulty level) to make a correct move and reset the timer. If the time hit zero, that\'s the end of the challenge."),
        "tutorial_dialog_mode_chalenge_title":
            MessageLookupByLibrary.simpleMessage("2. Challenge"),
        "tutorial_dialog_mode_learning_desc": MessageLookupByLibrary.simpleMessage(
            "Learning mode allow you to practice with several levels, each level has its own set of items and no time limit to play. Remember practice make perfect."),
        "tutorial_dialog_mode_learning_title":
            MessageLookupByLibrary.simpleMessage("1. Learning"),
        "tutorial_dialog_mode_title":
            MessageLookupByLibrary.simpleMessage("Mode"),
        "waste_category_name": m2,
        "waste_type_description": m3,
        "waste_type_name": m4
      };
}
