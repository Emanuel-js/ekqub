import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String label;
  Color color;
  double size;
  FontWeight? ftw;
  TextAlign txa;
  double? lts;
  Color? colors;
  TextWidget(
      {this.color = const Color(0xFFFFFFFF),
      this.size = 18,
      this.colors,
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
          fontWeight: ftw,
          fontSize: size,
          color: colors,
          fontFamily: 'Poppins'),
    );
  }
}
