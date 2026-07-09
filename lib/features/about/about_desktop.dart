import 'package:flutter/material.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';

class AboutDesktopPart extends StatelessWidget {
  const AboutDesktopPart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      color: theme.scaffoldBackgroundColor,
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      height: screenSize.height / 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I am Student of BTech in Computer Engineering. I am very curious about new technologies.",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 26,
                    height: 1.2,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  "I thrive in team-oriented environments and enjoy working on projects that require collaboration and strategic input.",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 26,
                    height: 1.5,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  "I like to work on project in order to strengthen my skills. ",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 26,
                    height: 1.5,
                    color: theme.colorScheme.onSurface,
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
