import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String label;
  Color color;
  double size;
  FontWeight? ftw;
  TextAlign txa;
  double? lts;
  TextWidget(
      {this.color = const Color(0xFFFFFFFF),
      this.size = 18,
      required this.label,
      this.ftw,
      this.txa = TextAlign.center,
      this.lts,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: txa,
      style: TextStyle(
          letterSpacing: lts,
          color: color,
          fontWeight: ftw,
          fontSize: size,
          fontFamily: 'Poppins'),
    );
  }
}
