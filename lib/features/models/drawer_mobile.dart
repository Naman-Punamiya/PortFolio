import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/nav_items.dart';
import 'package:my_portfolio/features/models/portfolio_logo.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';

class DrawerMobile extends StatelessWidget {
  final Function(int) onNavItemTap;
  const DrawerMobile({super.key, required this.onNavItemTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      backgroundColor: theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PortfolioLogo(onTap: () {}),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close_rounded),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < navTitles.length - 1; i++)
                  Padding(
                    padding: const EdgeInsets.only(left: AppSpacing.sm),
                    child: ListTile(
                      onTap: () => onNavItemTap(i),
                      title: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Icon(navIcons[i]),
                            Text(
                              navTitles[i],
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontSize: 30,
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
