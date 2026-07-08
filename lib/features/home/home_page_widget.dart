import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';

class HomePageWidget extends StatelessWidget {
  final void Function()? onTap;
  const HomePageWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return screenWidth >= minDesktopWidth
        ? buildDesktopHomePage(context, screenSize)
        : buildMobileHomePage(context, screenSize);
  }

  Widget buildMobileHomePage(BuildContext context, Size screenSize) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      height: screenSize.height/1.5,
      constraints: const BoxConstraints(minHeight: 350),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset("Prog.gif", width: screenSize.width / 1.25),
          ),
          Container(
            padding: const EdgeInsets.only(left: AppSpacing.sm),
            child: Text(
              "Hi, I'm Naman 👋\nFlutter Developer &\n Software Engineer\nBuilding clean, scalable and \nbeautiful digital experiences.",
              style: theme.textTheme.headlineMedium?.copyWith(
                fontSize: 30,
                height: 1.5,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
            padding: const EdgeInsets.only(left: AppSpacing.xl),
            width: 350,
            child: Text(
              "Mobile Developer / Flutter Developer / Software Engineering",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppSpacing.lg),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.surface,
                foregroundColor: theme.colorScheme.onSurface,
              ),
              onPressed: onTap,
              child: const Text("SEE MY WORKS  -->"),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDesktopHomePage(BuildContext context, Size screenSize) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      height: screenSize.height/1.05,
      // constraints: const BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: screenSize.width / 2.5,
            padding: const EdgeInsets.only(left: AppSpacing.xxl * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: AppSpacing.xxl * 2.5),
                Text(
                  "Hello, I'm",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    // height: 1.5,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  "Naman",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontSize: 72,
                    fontWeight: FontWeight.w800,
                    color: theme.colorScheme.primary.withAlpha(200),
                    // height: 1.5,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  "Flutter Developer &\nSoftware Engineer",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                    fontSize: 38,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  // "Building clean, scalable and \nbeautiful digital experiences.",
                  "Building scalable mobile and web applications\nwith Flutter, Spring Boot and PostgreSQL.",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg + AppSpacing.xs),
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.secondary
                              .withValues(alpha: 0.35),
                          foregroundColor: theme.colorScheme.onSurface,
                        ),
                        onPressed: onTap,
                        child: const Text("View Projects"),
                      ),
                    ),
                    SizedBox(width: AppSpacing.lg),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.secondary
                              .withValues(alpha: 0.35),
                          foregroundColor: theme.colorScheme.onSurface,
                        ),
                        onPressed: onTap,
                        child: const Text("View Resume"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // SizedBox(width: AppSpacing.xxl),
          Align(alignment: Alignment.centerRight, child: Image.asset("Prog.gif", width: screenSize.width / 2)),
        ],
      ),
    );
  }
}
