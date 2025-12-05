import 'package:flutter/material.dart';
import 'package:my_portfolio/models/portfolio_logo.dart';

class AppBarMobile extends StatelessWidget {
  final VoidCallback onLogoTap;
  final VoidCallback onMenuTap;
  const AppBarMobile({super.key, required this.onLogoTap, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Row(
        children: [
          PortfolioLogo(onTap: onLogoTap),
          Spacer(),
          IconButton(
            onPressed: onMenuTap,
            icon: Icon(Icons.menu_rounded, size: 30),
          ),
        ],
      ),
    );
  }
}
