import 'package:flutter/material.dart';

import '../constants/app_text_style.dart';
import '../constants/color_name.dart';
import '../helpers/asset_path_helper.dart';
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
          Text('Mode', style: AppTextStyle.base.size24.bold),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('1. Learning', style: AppTextStyle.base.size16.bold),
              Text(
                  'Learning mode allow you to practice with several levels, each level has its own set of items and no time limit to play. Remember practice make perfect.',
                  style: AppTextStyle.base.size16),
              const SizedBox(height: 8),
              Text('2. Chalenge', style: AppTextStyle.base.size16.bold),
              Text(
                  'Chalenge mode or in another word an Endless mode, you can play it forever and get a higher score. Your only enemy is time, you will have a few seconds (depends on difficulty level) to make a correct move and reset the timer. If the time hit zero, that\'s the end of the chalenge.',
                  style: AppTextStyle.base.size16),
            ],
          ),
          const SizedBox(height: 16),
          _imageFrame(Images.imgTutorialChalengeMode.platformAsset),
          const SizedBox(height: 16),
          Text('Card', style: AppTextStyle.base.size24.bold),
          const SizedBox(height: 8),
          _imageFrame(Images.imgTutorialCard.platformAsset),
          const SizedBox(height: 8),
          Column(
            children: [
              Text('1. name of the item', style: AppTextStyle.base.size16),
              Text('2. image of the item', style: AppTextStyle.base.size16),
              Text('3. hint (item\'s category)', style: AppTextStyle.base.size16),
            ],
          ),
          const SizedBox(height: 16),
          Text('Board', style: AppTextStyle.base.size24.bold),
          Text(
            'This game separates items to 8 types (you can learn more in "Knowledge")',
            style: AppTextStyle.base.size16,
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              _imageFrame(Images.imgTutorialBoard.platformAsset),
              _imageFrame(Images.imgTutorialBoardHover.platformAsset),
            ],
          ),
          const SizedBox(height: 8),
          Text('Drag and drop card into its type to gain a point', style: AppTextStyle.base.size16),
          const SizedBox(height: 16),
          Text('Helper', style: AppTextStyle.base.size24.bold),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Knowledge', style: AppTextStyle.base.size16.bold),
                          Text('Show data of types, categories and items.',
                              style: AppTextStyle.base.size16),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _imageFrame(Images.imgTutorialKnowledge.platformAsset),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _helperButton(Icons.visibility_outlined),
                      const SizedBox(width: 8),
                      _helperButton(Icons.visibility_off_outlined),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hint', style: AppTextStyle.base.size16.bold),
                          Text('Switch the visibility of hint on card',
                              style: AppTextStyle.base.size16),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _imageFrame(Images.imgTutorialHintTrue.platformAsset),
                      const SizedBox(width: 8),
                      _imageFrame(Images.imgTutorialHintFalse.platformAsset),
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
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorNames.white,
      ),
      child: Icon(icon),
    );
  }
}
