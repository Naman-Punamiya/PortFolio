import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/core/constants/skill_items.dart';
import 'package:my_portfolio/app/theme/app_radius.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return screenWidth >= minDesktopWidth
        ? buildDesktopSkillPage(context)
        : buildMobileSkillPage(context);
  }

  Widget buildMobileSkillPage(BuildContext context) {
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: Column(
        children: [
          for (int i = 0; i < platformItems.length; i++)
            Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.xs),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(AppRadius.sm / 2),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.sm + AppSpacing.xs,
                  horizontal: AppSpacing.lg,
                ),
                leading: Image.asset(platformItems[i]["img"], width: 26),
                title: Text(platformItems[i]['title']),
              ),
            ),
          const SizedBox(height: AppSpacing.xxl),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < skillItems.length; i++)
                Chip(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.xl),
                  ),
                    backgroundColor: theme.colorScheme.surface,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.md,
                      horizontal: AppSpacing.lg,
                    ),
                  label: Text(skillItems[i]['title']),
                  avatar: Image.asset(skillItems[i]["img"]),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDesktopSkillPage(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 450),
            child: Wrap(
              spacing: 5.0,
              runSpacing: 5.0,
              children: [
                for (int i = 0; i < platformItems.length; i++)
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(AppRadius.sm + 2),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                        vertical: AppSpacing.sm + AppSpacing.xs,
                      ),
                      leading: Image.asset(platformItems[i]["img"], width: 26),
                      title: Text(platformItems[i]["title"]),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.xl + AppSpacing.lg),
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (int i = 0; i < skillItems.length; i++)
                    Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.xl),
                      ),
                      backgroundColor: theme.colorScheme.surface,
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.md,
                        horizontal: AppSpacing.lg,
                      ),
                      label: Text(skillItems[i]['title']),
                      avatar: Image.asset(skillItems[i]["img"]),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
