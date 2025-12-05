import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/nav_items.dart';
import 'package:my_portfolio/models/portfolio_logo.dart';

class AppBarPC extends StatelessWidget {
  final Function(int) onNavMenuTap;
  const AppBarPC({super.key, required this.onNavMenuTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
      child: Row(
        children: [
          PortfolioLogo(onTap: () {}),
          Spacer(),
          Row(
            children: [
              for (int i = 0; i < navTitles.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: TextButton(
                    onPressed: () {
                      onNavMenuTap(i);
                    },
                    child: Text(
                      navTitles[i],
                      style: TextStyle(color: Colors.grey.shade400,fontSize: 17),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}