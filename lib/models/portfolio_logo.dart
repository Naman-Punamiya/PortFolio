import 'package:flutter/material.dart';

class PortfolioLogo extends StatelessWidget {
  final VoidCallback onTap;
  const PortfolioLogo({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'Portfolio',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
