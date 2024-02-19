import 'package:flutter/material.dart';

class StarRow extends StatelessWidget {
  const StarRow({super.key, required this.score, required this.size});

  final num score;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Icon(
          Icons.star_rounded,
          color: index < score ? Colors.amber : Colors.grey.withOpacity(0.2),
          size: size,
        ),
      ),
    );
  }
}
