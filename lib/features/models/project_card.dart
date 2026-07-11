import 'package:flutter/material.dart';
import 'package:my_portfolio/app/theme/app_radius.dart';
import 'package:my_portfolio/app/theme/app_shadows.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';
import 'package:my_portfolio/core/models/tech_chip.dart';
import 'package:my_portfolio/core/utils/project_utils.dart';
import 'dart:js' as js;

import 'package:url_launcher/url_launcher.dart';

class ProjectCardWidget extends StatelessWidget {
  final ProjectUtils project;

  const ProjectCardWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.sm + 2),
        boxShadow: AppShadows.small,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(color: Colors.black12, width: 1),
              ),
              child: Image.asset(project.image, width: screenSize.width * 0.25),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      project.title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      project.subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      project.description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.sm,
                      children: project.techs!
                          .map((tech) => TechChip(text: tech))
                          .toList(),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => openUrl(project.github!),
                          child: Row(
                            children: [
                              Image.asset(
                                "Github_white.png",
                                width: 20,
                                color: Colors.black,
                              ),
                              SizedBox(width: AppSpacing.sm),
                              Text(
                                "Github",
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          width: 1,
                          height: 20,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(width: 20),
                        if (project.iosLink != null)
                          InkWell(
                            onTap: () => openUrl(project.iosLink!),
                            child: Image.asset(
                              "apple.png",
                              width: 20,
                              color: Colors.black,
                            ),
                          ),
                        if (project.androidLink != null)
                          Padding(
                            padding: const EdgeInsets.only(left: AppSpacing.sm),
                            child: InkWell(
                              onTap: () => openUrl(project.androidLink!),
                              child: Image.asset(
                                "android.png",
                                width: 24,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        if (project.webLink != null)
                          Padding(
                            padding: const EdgeInsets.only(left: AppSpacing.sm),
                            child: InkWell(
                              onTap: () => openUrl(project.webLink!),
                              child: Image.asset(
                                "web.png",
                                width: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
