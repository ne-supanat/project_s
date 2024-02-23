import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/app_text_style.dart';
import '../constants/color_name.dart';
import '../constants/waste_resource.dart';
import '../constants/waste_type.dart';
import '../helpers/asset_path_helper.dart';
import '../helpers/translations.dart';
import '../models/waste_model.dart';
import 'knowledge_item.dart';

class KnowledgeDialog extends StatefulWidget {
  const KnowledgeDialog({super.key});

  @override
  State<KnowledgeDialog> createState() => _KnowledgeDialogState();
}

class _KnowledgeDialogState extends State<KnowledgeDialog> {
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
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(children: [
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    children: [
                      Text(
                        TranslationKeys.knowledge_dialog_warning,
                        style: AppTextStyle.base.copyWith(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        TranslationKeys.knowledge_dialog_recommend,
                        style: AppTextStyle.base.copyWith(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ...WasteType.values
              .map((e) => Theme(
                    data: ThemeData().copyWith(
                      dividerColor: Colors.transparent,
                    ),
                    child: ExpansionTile(
                      maintainState: true,
                      backgroundColor:
                          isHover ? ColorNames.white.withOpacity(0.5) : Colors.transparent,
                      tilePadding: const EdgeInsets.only(left: 16, right: 8),
                      title: Text(e.string, style: AppTextStyle.base.bold.copyWith(fontSize: 20)),
                      leading: ImageIcon(
                        AssetImage(e.icon.platformAsset),
                        color: e.category.color,
                      ),
                      children: [
                        _contentByType(e),
                      ],
                    ),
                  ))
              .toList(),
        ]),
      ),
    );
  }

  _contentByType(WasteType type) {
    final items = WasteResource().all.where((element) => element.type == type).toList();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorNames.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: TranslationKeys.knowledge_dialog_category,
              children: [
                TextSpan(
                  text: type.category.string,
                  style: AppTextStyle.base.bold.copyWith(color: type.category.color),
                ),
              ],
            ),
            style: AppTextStyle.base.bold,
          ),
          const SizedBox(height: 8),
          Text(
            type.description,
            style: AppTextStyle.base,
          ),
          const SizedBox(height: 16),
          Center(
            child: Wrap(
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.start,
              spacing: 8,
              children: items
                  .map((e) => KnowledgeItem(
                        waste: e,
                        isFocus: e == focusedWaste,
                        onTap: () {
                          setState(() {
                            focusedWaste = e;
                          });
                        },
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
