import 'package:flutter/material.dart';
import 'package:my_portfolio/app/theme/app_radius.dart';
import 'package:my_portfolio/app/theme/app_shadows.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';
import 'package:my_portfolio/core/utils/project_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCardWidget extends StatelessWidget {
  final ProjectUtils project;

  const ProjectCardWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 280,
      width: 250,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: theme.colorScheme.outline, width: 2),
          left: BorderSide(color: theme.colorScheme.outline, width: 2),
        ),
        borderRadius: BorderRadius.circular(AppRadius.sm + 2),
        boxShadow: AppShadows.small,
        color: theme.colorScheme.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/${project.image}",
            height: 140,
            width: 250,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.md + AppSpacing.xs,
              AppSpacing.md,
              AppSpacing.md,
            ),
            child: Text(
              project.title,
              style: theme.textTheme.titleLarge?.copyWith(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              0,
              AppSpacing.md,
              AppSpacing.md,
            ),
            child: Text(
              project.subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Spacer(),
          Container(
            color: theme.colorScheme.primary,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm + AppSpacing.xs,
            ),
            child: Row(
              children: [
                Text(
                  "Available on:",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 10,
                  ),
                ),
                Spacer(),
                if (project.iosLink != null)
                  InkWell(
                    onTap: () {
                      _openLink(project.iosLink!);
                    },
                      child: Image.asset(
                        "assets/apple.png",
                        width: 17,
                        color: theme.colorScheme.onPrimary,
                      ),
                  ),
                if (project.androidLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: AppSpacing.sm),
                    child: InkWell(
                      onTap: () {
                        _openLink(project.androidLink!);
                      },
                      child: Image.asset(
                        "assets/android.png",
                        width: 18,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                if (project.webLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: AppSpacing.sm),
                    child: InkWell(
                      onTap: () {
                        _openLink(project.webLink!);
                      },
                      child: Image.asset(
                        "assets/web.png",
                        width: 17,
                        color: theme.colorScheme.onPrimary,
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
  Future<void> _openLink(String url) async {
  final uri = Uri.parse(url);

  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
    webOnlyWindowName: '_blank',
  )) {
    throw Exception("Could not open $url");
  }
}
}
