import 'package:flutter/material.dart';
import 'package:project_s/constants/chalenge_level.dart';

class ChalengeItem extends StatefulWidget {
  const ChalengeItem({super.key, required this.level, required this.onTap});

  final ChalengeLevel level;
  final Function() onTap;

  @override
  State<ChalengeItem> createState() => _ChalengeItemState();
}

class _ChalengeItemState extends State<ChalengeItem> {
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
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
          color: isHover ? Colors.blue.shade600 : Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.level.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
