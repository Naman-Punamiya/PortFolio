import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/nav_items.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/features/header/nav_button.dart';
import 'package:my_portfolio/features/models/portfolio_logo.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';

class CustomAppBar extends StatelessWidget {
  final int activeIndex;
  final VoidCallback onLogoTap;
  final VoidCallback onMenuTap;
  final Function(int) onNavMenuTap;
  final VoidCallback onResumeTap;
  const CustomAppBar({
    super.key,
    required this.activeIndex,
    required this.onLogoTap,
    required this.onMenuTap,
    required this.onNavMenuTap,
    required this.onResumeTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= minDesktopWidth
        ? buildAppBarDesktop(context)
        : buildAppBarMobile(context);
  }

  Widget buildAppBarMobile(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor.withValues(alpha: 0.75),
        border: Border(bottom: BorderSide(color: theme.dividerColor, width: 1)),
      ),
      child: Row(
        children: [
          PortfolioLogo(onTap: onLogoTap),
          const Spacer(),
          IconButton(
            onPressed: onMenuTap,
            icon: const Icon(Icons.menu_rounded),
          ),
        ],
      ),
    );
  }

  Widget buildAppBarDesktop(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: 72,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor.withValues(alpha: 0.75),
            border: Border(
              bottom: BorderSide(color: theme.dividerColor, width: 1),
            ),
          ),
          child: Row(
            children: [
              PortfolioLogo(onTap: onLogoTap),

              const Spacer(),

              Row(
                children: List.generate(
                  navTitles.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: AppSpacing.md),
                    child: NavButton(
                      title: navTitles[index],
                      isActive: index == activeIndex,
                      onTap: () {
                        if (index == 5) {
                          onResumeTap();
                        } else {
                          onNavMenuTap(index);
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
