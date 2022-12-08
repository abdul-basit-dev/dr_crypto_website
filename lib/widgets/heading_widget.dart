import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  String? textHeading;
  Color? color;
  double? fontsize;
  HeadingWidget({
    this.textHeading,
    this.color,
    this.fontsize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textHeading!,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: "LEMONMILK-Bold",
        fontSize: fontsize,
        color: color,
      ),
    );
  }
}
