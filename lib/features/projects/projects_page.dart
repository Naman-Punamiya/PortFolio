import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/core/repositories/project_repository.dart';
import 'package:my_portfolio/core/repositories/social_repository.dart';
import 'package:my_portfolio/core/utils/project_utils.dart';
import 'package:my_portfolio/core/utils/social_utils.dart';
import 'package:my_portfolio/features/header/appbar.dart';
import 'package:my_portfolio/features/models/drawer_mobile.dart';
import 'package:my_portfolio/features/footer/footer_section.dart';
import 'package:my_portfolio/features/models/project_card.dart';
import 'package:my_portfolio/features/home/home_page.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';

class ProjectsSection extends StatefulWidget {
  final List<GlobalKey> navbarkeys;
  const ProjectsSection({super.key, required this.navbarkeys});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  late final ProjectRepository _repository;
  late final Future<List<ProjectUtils>> _projectsFuture;
  late final SocialRepository _socialRepository;
  late final Future<SocialUtils> _socialFuture;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _repository = ProjectRepository();
    _projectsFuture = _repository.getProjects();

    _socialRepository = SocialRepository();
    _socialFuture = _socialRepository.getSocials();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer: (constraints.maxWidth >= minDesktopWidth)
              ? null
              : DrawerMobile(
                  onNavItemTap: (int navIndex) {
                    scrollToSection(navIndex, widget.navbarkeys, context);
                    scaffoldKey.currentState?.closeEndDrawer();
                  },
                ),
          backgroundColor: theme.scaffoldBackgroundColor,
          body: Column(
            children: [
              CustomAppBar(
                activeIndex: 2,
                onLogoTap: () {},
                onMenuTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
                onNavMenuTap: (int navIndex) {
                  scrollToSection(navIndex, widget.navbarkeys, context);
                },
                onResumeTap: () {},
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        "PROJECTS",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Featured Projects",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: AppSpacing.md),
                      Text(
                        textAlign: TextAlign.center,
                        "A section of projects I've built with passion and dedication.\nEach project reflects my problem-solving skills and love to code.",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      FutureBuilder<List<ProjectUtils>>(
                        future: _projectsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 80),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }

                          if (snapshot.hasError) {
                            return Padding(
                              padding: const EdgeInsets.all(40),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.error_outline,
                                      size: 60,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      "Unable to load projects",
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Please try again later.",
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }

                          final List<ProjectUtils> projects =
                              snapshot.data ?? [];

                          if (projects.isEmpty) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 80),
                              child: Center(
                                child: Text(
                                  "No projects found.",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            );
                          }

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: projects.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 25,
                                    mainAxisSpacing: 25,
                                    childAspectRatio: 2.1,
                                  ),
                              itemBuilder: (context, index) {
                                return ProjectCardWidget(
                                  project: projects[index],
                                );
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      FutureBuilder<SocialUtils>(
                        future: _socialFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox.shrink();
                          }

                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          }

                          if (!snapshot.hasData) {
                            return const SizedBox.shrink();
                          }

                          return FooterSection(social: snapshot.data!);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
