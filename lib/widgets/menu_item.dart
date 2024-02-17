import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({super.key, required this.text, required this.onTap});

  final String text;
  final Function() onTap;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
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
          widget.text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
