import 'package:flutter/material.dart';

class LevelItem extends StatefulWidget {
  const LevelItem({super.key, required this.level, required this.onTap});

  final int level;
  final Function() onTap;

  @override
  State<LevelItem> createState() => _LevelItemState();
}

class _LevelItemState extends State<LevelItem> {
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
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isHover ? Colors.blue.shade600 : Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.level.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
