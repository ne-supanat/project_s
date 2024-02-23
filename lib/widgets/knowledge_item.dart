import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_s/models/waste_model.dart';
import 'package:project_s/widgets/waste_card.dart';

import '../constants/app_text_style.dart';
import '../constants/color_name.dart';

class KnowledgeItem extends StatefulWidget {
  const KnowledgeItem({super.key, required this.waste, required this.isFocus, required this.onTap});

  final WasteModel waste;
  final bool isFocus;
  final Function() onTap;

  @override
  State<KnowledgeItem> createState() => _KnowledgeItemState();
}

class _KnowledgeItemState extends State<KnowledgeItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
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
          ),
          Positioned(
              top: -0,
              left: 0,
              child: Visibility(
                visible: kIsWeb ? isHover : widget.isFocus,
                child: SizedBox(
                    width: 100,
                    child: FittedBox(child: WasteCard(value: widget.waste, showHint: false))),
              )),
        ],
      ),
    );
  }
}
