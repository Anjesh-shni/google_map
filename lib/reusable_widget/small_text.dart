import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  double height;

  SmallText({
    Key? key,
    required this.text,
    this.color = const Color(0xff332d2b),
    this.size = 12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
