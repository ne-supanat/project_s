import 'package:flutter/material.dart';

import 'package:project_s/models/waste_model.dart';

import '../constants/app_text_style.dart';
import '../constants/color_name.dart';

class KnowledgeItem extends StatefulWidget {
  const KnowledgeItem({
    super.key,
    required this.waste,
  });

  final WasteModel waste;

  @override
  State<KnowledgeItem> createState() => _KnowledgeItemState();
}

class _KnowledgeItemState extends State<KnowledgeItem> {
  @override
  Widget build(BuildContext context) {
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
              child: Image.asset(
                widget.waste.imagePath,
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
                    widget.waste.name,
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
