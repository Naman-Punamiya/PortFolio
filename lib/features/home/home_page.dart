import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/features/header/appbar.dart';
import 'package:my_portfolio/features/footer/contact_section.dart';
import 'package:my_portfolio/features/models/drawer_mobile.dart';
import 'package:my_portfolio/features/footer/footer_section.dart';
import 'package:my_portfolio/features/home/home_page_widget.dart';
import 'package:my_portfolio/features/about/about_page.dart';
import 'package:my_portfolio/features/certificate/certificate_page.dart';
import 'package:my_portfolio/features/experience/experience_page.dart';
import 'package:my_portfolio/features/projects/projects_page.dart';
import 'package:my_portfolio/features/skills/skills_mobile.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<GlobalKey> navbarkeys = List.generate(6, (index) => GlobalKey());
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer: (constraints.maxWidth >= minDesktopWidth)
              ? null
              : DrawerMobile(
                  onNavItemTap: (int navIndex) {
                    scrollToSection(navIndex, navbarkeys, context);
                    scaffoldKey.currentState?.closeEndDrawer();
                  },
                ),
          backgroundColor: theme.scaffoldBackgroundColor,
          body: Column(
            children: [
              CustomAppBar(
                activeIndex: 0,
                onLogoTap: () {},
                onMenuTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
                onNavMenuTap: (int navIndex) {
                  scrollToSection(navIndex, navbarkeys, context);
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(key: navbarkeys.first),
                      HomePageWidget(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProjectsSection(navbarkeys: navbarkeys),
                            ),
                          );
                        },
                      ),
                      Container(
                        key: navbarkeys[1],
                        height: screenSize.height,
                        width: screenWidth,
                        padding: const EdgeInsets.fromLTRB(
                          AppSpacing.lg,
                          AppSpacing.lg,
                          AppSpacing.lg,
                          AppSpacing.lg,
                        ),
                        color: theme.colorScheme.surface,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: AppSpacing.lg),
                            Padding(
                              padding: const EdgeInsets.only(left: AppSpacing.lg),
                              child: Row(
                                children: [
                                  const SizedBox(width: 75),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "What I can do",
                                        style: theme.textTheme.headlineMedium,
                                      ),
                                      const SizedBox(height: AppSpacing.lg + AppSpacing.xs),
                                      Text(
                                        "The type of development I do and Skills I have",
                                        textAlign: TextAlign.start,
                                        style: theme.textTheme.bodyMedium?.copyWith(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(height: 30),
                            SkillsWidget(),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppSpacing.lg + AppSpacing.sm),

                      ContactSection(),

                      FooterSection(),
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

void scrollToSection(
  int navIndex,
  List<GlobalKey> navbarkeys,
  BuildContext context,
) {
  // final key = navbarkeys[navIndex];
  if (navIndex == 0) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  } else if (navIndex == 1) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => AboutPage(navbarkeys: navbarkeys),
      ),
    );
  } else if (navIndex == 2) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ProjectsSection(navbarkeys: navbarkeys),
      ),
    );
  } else if (navIndex == 3) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ExperiencePage(navbarkeys: navbarkeys),
      ),
    );
  } else if (navIndex == 4) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => CertificatePage(navbarkeys: navbarkeys),
      ),
    );
  } else if (navIndex == 5) {
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (context) => ),
    // );
  }
}
