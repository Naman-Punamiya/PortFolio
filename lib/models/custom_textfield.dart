import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class CustomTextfield extends StatelessWidget {
    final TextEditingController? controller;
    final int maxLine;
    final String hintText;
  const CustomTextfield({super.key, this.controller,required this.maxLine, required this.hintText});

  @override
  Widget build(BuildContext context){
    return TextField(
      controller: controller,
      maxLines: maxLine,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16),
        filled: true,
        fillColor: CustomColors.scaffoldBg,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
      ),
    );
  }
}
