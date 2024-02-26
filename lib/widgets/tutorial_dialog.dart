import 'package:flutter/material.dart';
import 'package:project_s/helpers/translations.dart';

import '../constants/app_text_style.dart';
import '../constants/color_name.dart';
import '../models/waste_model.dart';
import '../resources/resources.dart';

class TutorialDialog extends StatefulWidget {
  const TutorialDialog({super.key});

  @override
  State<TutorialDialog> createState() => _TutorialDialogState();
}

class _TutorialDialogState extends State<TutorialDialog> {
  WasteModel? focusedWaste;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorNames.cream,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 4,
                    color: ColorNames.black,
                  )),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _content(),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 24,
            right: 24,
            child: CloseButton(),
          ),
        ],
      ),
    );
  }

  bool isHover = false;

  _content() {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const SizedBox(height: 16),
          Text(TranslationKeys.tutorial_dialog_mode_title, style: AppTextStyle.base.size24.bold),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TranslationKeys.tutorial_dialog_mode_learning_title,
                  style: AppTextStyle.base.size16.bold),
              Text(TranslationKeys.tutorial_dialog_mode_learning_desc,
                  style: AppTextStyle.base.size16),
              const SizedBox(height: 8),
              Text(TranslationKeys.tutorial_dialog_mode_chalenge_title,
                  style: AppTextStyle.base.size16.bold),
              Text(TranslationKeys.tutorial_dialog_mode_chalenge_desc,
                  style: AppTextStyle.base.size16),
            ],
          ),
          const SizedBox(height: 16),
          _imageFrame(Images.imgTutorialChalengeMode),
          const SizedBox(height: 16),
          Text(TranslationKeys.tutorial_dialog_card_title, style: AppTextStyle.base.size24.bold),
          const SizedBox(height: 8),
          _imageFrame(Images.imgTutorialCard),
          const SizedBox(height: 8),
          Column(
            children: [
              Text(TranslationKeys.tutorial_dialog_card_line1, style: AppTextStyle.base.size16),
              Text(TranslationKeys.tutorial_dialog_card_line2, style: AppTextStyle.base.size16),
              Text(TranslationKeys.tutorial_dialog_card_line3, style: AppTextStyle.base.size16),
            ],
          ),
          const SizedBox(height: 16),
          Text(TranslationKeys.tutorial_dialog_board_title, style: AppTextStyle.base.size24.bold),
          Text(
            TranslationKeys.tutorial_dialog_board_line1,
            style: AppTextStyle.base.size16,
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              _imageFrame(Images.imgTutorialBoard),
              _imageFrame(Images.imgTutorialBoardHover),
            ],
          ),
          const SizedBox(height: 8),
          Text(TranslationKeys.tutorial_dialog_board_line2, style: AppTextStyle.base.size16),
          const SizedBox(height: 16),
          Text(TranslationKeys.tutorial_dialog_helper_title, style: AppTextStyle.base.size24.bold),
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 16,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _helperButton(Icons.menu_book_rounded),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(TranslationKeys.tutorial_dialog_helper_knowledge_title,
                                style: AppTextStyle.base.size16.bold),
                            Text(TranslationKeys.tutorial_dialog_helper_knowledge_decs,
                                style: AppTextStyle.base.size16),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _imageFrame(Images.imgTutorialKnowledge),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _helperButton(Icons.visibility_off_outlined),
                      const SizedBox(width: 8),
                      _helperButton(Icons.visibility_outlined),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(TranslationKeys.tutorial_dialog_helper_hint_title,
                                style: AppTextStyle.base.size16.bold),
                            Text(TranslationKeys.tutorial_dialog_helper_hint_decs,
                                style: AppTextStyle.base.size16),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _imageFrame(Images.imgTutorialHintTrue),
                      _imageFrame(Images.imgTutorialHintFalse),
                    ],
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }

  _imageFrame(String imgPath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(imgPath, fit: BoxFit.cover, width: 300, height: 225),
    );
  }

  _helperButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorNames.cream,
        border: Border.all(width: 2),
      ),
      child: Icon(icon),
    );
  }
}
