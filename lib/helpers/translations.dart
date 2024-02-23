// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/services.dart';

class TranslationKeys {
  TranslationKeys._();

  static Map<String, dynamic> translations = {};

  static Future<void> init() async {
    String jsonString = await rootBundle.loadString('translations/translation.json');
    translations = jsonDecode(jsonString);
  }

  static String get common_back => translations['common']['back'];
  static String get common_title => translations['common']['title'];

  static String get chalenge_level_beginner => translations['chalenge_level']['beginner'];
  static String get chalenge_level_normal => translations['chalenge_level']['normal'];
  static String get chalenge_level_expert => translations['chalenge_level']['expert'];

  static String get waste_category_common => translations['waste_category']['common'];
  static String get waste_category_organic => translations['waste_category']['organic'];
  static String get waste_category_recyclable => translations['waste_category']['recyclable'];
  static String get waste_category_hazardous => translations['waste_category']['hazardous'];

  static String get waste_type_general_name => translations['waste_type']['general']['name'];
  static String get waste_type_general_description =>
      translations['waste_type']['general']['description'];
  static String get waste_type_food_name => translations['waste_type']['food']['name'];
  static String get waste_type_food_description =>
      translations['waste_type']['food']['description'];
  static String get waste_type_paper_name => translations['waste_type']['paper']['name'];
  static String get waste_type_paper_description =>
      translations['waste_type']['paper']['description'];
  static String get waste_type_plastic_name => translations['waste_type']['plastic']['name'];
  static String get waste_type_plastic_description =>
      translations['waste_type']['plastic']['description'];
  static String get waste_type_aluminium_name => translations['waste_type']['aluminium']['name'];
  static String get waste_type_aluminium_description =>
      translations['waste_type']['aluminium']['description'];
  static String get waste_type_glass_name => translations['waste_type']['glass']['name'];
  static String get waste_type_glass_description =>
      translations['waste_type']['glass']['description'];
  static String get waste_type_biohazard_name => translations['waste_type']['biohazard']['name'];
  static String get waste_type_biohazard_description =>
      translations['waste_type']['biohazard']['description'];
  static String get waste_type_electronic_name => translations['waste_type']['electronic']['name'];
  static String get waste_type_electronic_description =>
      translations['waste_type']['electronic']['description'];

  static String get main_page_start => translations['main_page']['start'];
  static String get main_page_learning => translations['main_page']['learning'];
  static String get main_page_chalenge => translations['main_page']['chalenge'];
  static String get main_page_knowledge => translations['main_page']['knowledge'];
  static String get main_page_tutorial => translations['main_page']['tutorial'];

  static String get chalenge_level_select_page_title =>
      translations['chalenge_level_select_page']['title'];

  static String get knowledge_dialog_warning => translations['knowledge_dialog']['warning'];
  static String get knowledge_dialog_recommend => translations['knowledge_dialog']['recommend'];
  static String get knowledge_dialog_category => translations['knowledge_dialog']['category'];

  static String get game_page_level_not_found => translations['game_page']['level_not_found'];
  static String get game_page_score => translations['game_page']['score'];

  static String get chalenge_end_dialog_score => translations['chalenge_end_dialog']['score'];
  static String get chalenge_end_dialog_new_high_score =>
      translations['chalenge_end_dialog']['new_high_score'];
  static String get chalenge_end_dialog_high_score_is =>
      translations['chalenge_end_dialog']['high_score_is'];
  static String get chalenge_end_dialog_play_again =>
      translations['chalenge_end_dialog']['play_again'];
  static String get chalenge_end_dialog_back => translations['chalenge_end_dialog']['back'];

  static String get learning_end_dialog_star3 => translations['learning_end_dialog']['star3'];
  static String get learning_end_dialog_star3_sub =>
      translations['learning_end_dialog']['star3_sub'];
  static String get learning_end_dialog_star2 => translations['learning_end_dialog']['star2'];
  static String get learning_end_dialog_star2_sub =>
      translations['learning_end_dialog']['star2_sub'];
  static String get learning_end_dialog_star1 => translations['learning_end_dialog']['star1'];
  static String get learning_end_dialog_star1_sub =>
      translations['learning_end_dialog']['star1_sub'];
  static String get learning_end_dialog_star0 => translations['learning_end_dialog']['star0'];
  static String get learning_end_dialog_star0_sub =>
      translations['learning_end_dialog']['star0_sub'];
  static String get learning_end_dialog_play_again =>
      translations['learning_end_dialog']['play_again'];
  static String get learning_end_dialog_back => translations['learning_end_dialog']['back'];
}
