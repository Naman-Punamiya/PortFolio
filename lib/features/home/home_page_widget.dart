import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';
import 'package:my_portfolio/core/repositories/profile_repository.dart';
import 'package:my_portfolio/core/utils/profile_utils.dart';

class HomePageWidget extends StatefulWidget {
  final void Function()? onTapProject;
  final void Function()? onTapResume;
  const HomePageWidget({
    super.key,
    required this.onTapProject,
    required this.onTapResume,
  });

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late final ProfileRepository _repository;
  late final Future<ProfileUtils> _profileFuture;

  @override
  void initState() {
    super.initState();
    _repository = ProfileRepository();
    _profileFuture = _repository.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return FutureBuilder<ProfileUtils>(
      future: _profileFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: screenSize.height,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return SizedBox(
            height: screenSize.height,
            child: Center(child: Text(snapshot.error.toString())),
          );
        }

        if (!snapshot.hasData) {
          return SizedBox(
            height: screenSize.height,
            child: const Center(child: Text("Profile not found.")),
          );
        }

        final profile = snapshot.data!;

        return screenWidth >= minDesktopWidth
            ? buildDesktopHomePage(context, screenSize, profile)
            : buildMobileHomePage(context, screenSize, profile);
      },
    );
  }

  Widget buildMobileHomePage(
    BuildContext context,
    Size screenSize,
    ProfileUtils profile,
  ) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      height: screenSize.height / 1.5,
      constraints: const BoxConstraints(minHeight: 350),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi, I'm ${profile.name.split(' ').first} 👋",
            style: theme.textTheme.headlineMedium?.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            profile.designation,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 12),

          Text(profile.heroSubtitle, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget buildDesktopHomePage(
    BuildContext context,
    Size screenSize,
    ProfileUtils profile,
  ) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      height: screenSize.height / 1.05,
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
                  profile.name,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontSize: 72,
                    fontWeight: FontWeight.w800,
                    color: theme.colorScheme.primary.withAlpha(200),
                    // height: 1.5,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  profile.designation,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                    fontSize: 38,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  // "Building clean, scalable and \nbeautiful digital experiences.",
                  // "Building scalable mobile and web applications\nwith Flutter, Spring Boot and PostgreSQL.",
                  profile.heroSubtitle,
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
                        onPressed: widget.onTapProject,
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
                        onPressed: widget.onTapResume,
                        child: const Text("View Resume"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // SizedBox(width: AppSpacing.xxl),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset("Prog.gif", width: screenSize.width / 2),
          ),
        ],
      ),
    );
  }
}
