import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  TextOverflow overFlow;

  BigText({
    Key? key,
    required this.text,
    this.color = const Color(0xff332d2b),
    this.overFlow = TextOverflow.ellipsis,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }
}
