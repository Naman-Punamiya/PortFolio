import 'package:flutter/material.dart';
import 'package:my_portfolio/app/theme/app_layout.dart';
import 'package:my_portfolio/app/theme/app_shadows.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/app/theme/app_radius.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';
import 'package:my_portfolio/core/repositories/skill_repository.dart';
import 'package:my_portfolio/core/utils/skill_utils.dart';

class SkillsWidget extends StatefulWidget {
  const SkillsWidget({super.key});

  @override
  State<SkillsWidget> createState() => _SkillsWidgetState();
}

class _SkillsWidgetState extends State<SkillsWidget> {
  late final SkillRepository _repository;
  late final Future<List<SkillUtils>> _skillsFuture;

  @override
  void initState() {
    super.initState();

    _repository = SkillRepository();
    _skillsFuture = _repository.getSkills();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder<List<SkillUtils>>(
      future: _skillsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(60),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text("No skills found."),
          );
        }

        final allSkills = snapshot.data!;

        final platformItems = allSkills
            .where((skill) => skill.type == "platform")
            .toList();

        final skillItems = allSkills
            .where((skill) => skill.type == "technology")
            .toList();

        return screenWidth >= minDesktopWidth
            ? buildDesktopSkillPage(
                context,
                platformItems,
                skillItems,
              )
            : buildMobileSkillPage(
                context,
                platformItems,
                skillItems,
              );
      },
    );
  }

  Widget buildMobileSkillPage(BuildContext context, List<SkillUtils> platformItems, List<SkillUtils> skillItems) {
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: AppLayout.sectionMaxWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final platform in platformItems)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: _SkillFeatureCard(
                iconPath: "assets/${platform.image}",
                title: platform.title,
                subtitle: platform.subtitle ?? "",
                theme: theme,
                iconSize: AppLayout.mobileSkillCardIconSize,
              ),
            ),
          const SizedBox(height: AppSpacing.lg),
          const _SectionLabel(icon: Icons.layers_outlined, title: 'Tech Stack'),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.md,
            alignment: WrapAlignment.start,
            children: [
              for (final skill in skillItems)
                _SkillPill(
                  title: skill.title,
                  iconPath: skill.image,
                  theme: theme,
                  iconSize: AppLayout.skillIconSize,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDesktopSkillPage(BuildContext context, List<SkillUtils> platformItems, List<SkillUtils> skillItems) {
    final theme = Theme.of(context);
    final dividerColor = theme.colorScheme.outline.withValues(alpha: 0.28);
    return Expanded(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppLayout.sectionMaxWidth,
          ),
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
                      itemBuilder: (context, index) {
                        final platform = platformItems[index];
                        return _SkillFeatureCard(
                          iconPath: platform.image,
                          title: platform.title,
                          subtitle: platform.subtitle ?? "",
                          theme: theme,
                          iconSize: 24,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppLayout.sectionColumnGap,
                ),
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
                        for (final skill in skillItems)
                          _SkillPill(
                            title: skill.title,
                            iconPath: skill.image,
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
  const _SectionLabel({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: theme.colorScheme.primary, size: 22),
        const SizedBox(width: AppSpacing.sm),
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.onSurface,
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
              child: Image.asset("assets/$iconPath", width: iconSize, height: iconSize),
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
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: 16,
                      color: theme.colorScheme.onSurfaceVariant,
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
          Image.asset("assets/$iconPath", width: iconSize, height: iconSize),
          const SizedBox(width: AppSpacing.sm),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
