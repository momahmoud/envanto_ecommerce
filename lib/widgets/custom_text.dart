import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final double lineHeight;

  const CustomText({
    this.title,
    this.fontWeight = FontWeight.w500,
    this.fontSize = 16,
    this.color,
    this.alignment,
    this.lineHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        title,
        style: GoogleFonts.ubuntu(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            wordSpacing: 2,
            height: lineHeight),
      ),
    );
  }
}
