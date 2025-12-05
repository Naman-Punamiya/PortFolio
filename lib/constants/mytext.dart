import 'package:flutter/material.dart';

class Mytext extends StatelessWidget {
  final String text;
  const Mytext({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 12, 0),
      child: Text(text, textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w500),),
    );
  }
}
