import 'package:envanto/view_model/auth_view_model.dart';
import 'package:envanto/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends GetWidget<AuthViewModel> {
  final String text;
  final IconData icon;
  final String hint;
  final Function onSaved;
  final Function validator;

  const CustomTextFormField({
    this.text,
    this.icon,
    this.hint,
    this.onSaved,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: CustomText(
            title: text,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            alignment: Alignment.topLeft,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          child: TextFormField(
            obscureText: text == 'Password' ? true : false,
            validator: validator,
            onSaved: onSaved,
            style: GoogleFonts.ubuntuCondensed(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              errorStyle: GoogleFonts.ubuntuCondensed(
                color: Colors.red[700],
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              filled: true,
              fillColor: Colors.white10,
              hintText: hint,
              hintStyle:
                  GoogleFonts.oxygenMono(color: Colors.grey, wordSpacing: -4),
            ),
          ),
        ),
      ],
    );
  }
}
