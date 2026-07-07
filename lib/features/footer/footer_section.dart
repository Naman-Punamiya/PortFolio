import 'package:flutter/material.dart';
import 'dart:js' as js;
import 'package:my_portfolio/features/models/sns_links.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.surfaceVariant,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: Column(
        children: [
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod("open",[SnsLinks.github]);
                },
                child: Image.asset("Github_white.png", width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open",[SnsLinks.linkedin]);
                },
                child: Image.asset("linkedin_white.png", width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open",[SnsLinks.instagram]);
                },
                child: Image.asset("Instagram_white.png", width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open",[SnsLinks.leetcode]);
                },
                child: Image.asset("LeetCode_white.png", width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open",[SnsLinks.discord]);
                },
                child: Image.asset("Discord_white.png", width: 28),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            "Made By Naman Punamiya with Flutter",
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
