import 'package:flutter/material.dart';
import 'package:my_portfolio/app/theme/app_colors.dart';
import 'package:my_portfolio/app/theme/app_layout.dart';
import 'package:my_portfolio/app/theme/app_shadows.dart';
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
      constraints: const BoxConstraints(maxWidth: AppLayout.sectionMaxWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < platformItems.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: _SkillFeatureCard(
                iconPath: platformItems[i]["img"],
                title: platformItems[i]['title'],
                subtitle: platformItems[i]['subtitle'],
                theme: theme,
                iconSize: AppLayout.mobileSkillCardIconSize,
              ),
            ),
          const SizedBox(height: AppSpacing.lg),
          const _SectionLabel(
            icon: Icons.layers_outlined,
            title: 'Tech Stack',
          ),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.md,
            alignment: WrapAlignment.start,
            children: [
              for (int i = 0; i < skillItems.length; i++)
                _SkillPill(
                  title: skillItems[i]['title'],
                  iconPath: skillItems[i]["img"],
                  theme: theme,
                  iconSize: AppLayout.skillIconSize,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDesktopSkillPage(BuildContext context) {
    final theme = Theme.of(context);
    final dividerColor = theme.colorScheme.outline.withValues(alpha: 0.28);
    return Expanded(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppLayout.sectionMaxWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 11,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _SectionLabel(
                      icon: Icons.laptop_mac_rounded,
                      title: 'Development',
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: platformItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: AppSpacing.md,
                        crossAxisSpacing: AppSpacing.md,
                        mainAxisExtent: AppLayout.skillFeatureCardMinHeight,
                      ),
                      itemBuilder: (context, i) {
                        return _SkillFeatureCard(
                          iconPath: platformItems[i]["img"],
                          title: platformItems[i]['title'],
                          subtitle: platformItems[i]['subtitle'],
                          theme: theme,
                          iconSize: 24,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppLayout.sectionColumnGap),
                child: SizedBox(
                  height: AppLayout.sectionDividerHeight,
                  child: VerticalDivider(
                    width: 1,
                    thickness: 1,
                    color: dividerColor,
                    indent: AppSpacing.md,
                    endIndent: AppSpacing.xl,
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _SectionLabel(
                      icon: Icons.layers_outlined,
                      title: 'Tech Stack',
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Wrap(
                      spacing: AppSpacing.md,
                      runSpacing: AppSpacing.md,
                      children: [
                        for (int i = 0; i < skillItems.length; i++)
                          _SkillPill(
                            title: skillItems[i]['title'],
                            iconPath: skillItems[i]["img"],
                            theme: theme,
                            iconSize: AppLayout.skillIconSize,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: theme.colorScheme.primary,
          size: 22,
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _SkillFeatureCard extends StatelessWidget {
  const _SkillFeatureCard({
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.theme,
    required this.iconSize,
  });

  final String iconPath;
  final String title;
  final String subtitle;
  final ThemeData theme;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.12),
        ),
        boxShadow: AppShadows.small,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.10),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Image.asset(
                iconPath,
                width: iconSize,
                height: iconSize,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillPill extends StatelessWidget {
  const _SkillPill({
    required this.title,
    required this.iconPath,
    required this.theme,
    required this.iconSize,
  });

  final String title;
  final String iconPath;
  final ThemeData theme;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.16),
        ),
        boxShadow: AppShadows.small,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: iconSize,
            height: iconSize,
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
