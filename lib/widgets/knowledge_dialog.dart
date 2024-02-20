import 'package:flutter/material.dart';

import '../constants/app_text_style.dart';
import '../constants/color_name.dart';
import '../constants/waste_resource.dart';
import '../constants/waste_type.dart';
import '../helpers/translations.dart';
import '../models/waste_model.dart';

class KnowledgeDialog extends StatefulWidget {
  const KnowledgeDialog({super.key});

  @override
  State<KnowledgeDialog> createState() => _KnowledgeDialogState();
}

class _KnowledgeDialogState extends State<KnowledgeDialog> {
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
          )
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
                  child: Text(
                    TranslationKeys.knowledge_dialog_warning,
                    style: AppTextStyle.base.copyWith(fontSize: 14),
                    textAlign: TextAlign.center,
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
    final r = WasteResource().all.where((element) => element.type == type).toList();
    final rl = r.length;

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
              children: List.generate(18, (int index) => _item(r[index % rl])).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(WasteModel wasteModel) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorNames.white,
              border: Border.all(color: ColorNames.black, width: 3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                wasteModel.imagePath,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    wasteModel.name,
                    style: AppTextStyle.base.size18.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
