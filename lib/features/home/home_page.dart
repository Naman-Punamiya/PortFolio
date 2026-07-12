import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/core/repositories/contact_repository.dart';
import 'package:my_portfolio/core/repositories/profile_repository.dart';
import 'package:my_portfolio/core/repositories/social_repository.dart';
import 'package:my_portfolio/core/utils/contact_utils.dart';
import 'package:my_portfolio/core/utils/profile_utils.dart';
import 'package:my_portfolio/core/utils/social_utils.dart';
import 'package:my_portfolio/features/header/appbar.dart';
import 'package:my_portfolio/features/footer/contact_section.dart';
import 'package:my_portfolio/features/models/drawer_mobile.dart';
import 'package:my_portfolio/features/footer/footer_section.dart';
import 'package:my_portfolio/features/home/home_page_widget.dart';
import 'package:my_portfolio/features/about/about_page.dart';
import 'package:my_portfolio/features/certificate/certificate_page.dart';
import 'package:my_portfolio/features/experience/experience_page.dart';
import 'package:my_portfolio/features/projects/projects_page.dart';
import 'package:my_portfolio/features/skills/skills_widget.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ProfileRepository _profileRepository;
  late final SocialRepository _socialRepository;
  late final ContactRepository _contactRepository;

  late final Future<ProfileUtils> _profileFuture;
  late final Future<SocialUtils> _socialFuture;
  late final Future<ContactUtils> _contactFuture;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<GlobalKey> navbarkeys = List.generate(6, (index) => GlobalKey());
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _profileRepository = ProfileRepository();
    _socialRepository = SocialRepository();
    _contactRepository = ContactRepository();
    _contactFuture = _contactRepository.getContact();
    _profileFuture = _profileRepository.getProfile();
    _socialFuture = _socialRepository.getSocials();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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
                }, onResumeTap: () {  },
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(key: navbarkeys.first),
                      // SizedBox(height: AppSpacing.lg + AppSpacing.sm),
                      FutureBuilder<List<dynamic>>(
                        future: Future.wait([
                          _profileFuture,
                          _socialFuture,
                          _contactFuture,
                        ]),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          }

                          if (!snapshot.hasData) {
                            return const Center(
                              child: Text("Unable to load portfolio."),
                            );
                          }

                          final profile = snapshot.data![0] as ProfileUtils;
                          final social = snapshot.data![1] as SocialUtils;
                          final contact = snapshot.data![2] as ContactUtils;

                          return Column(
                            children: [
                              HomePageWidget(
                                profile: profile,
                                onTapProject: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (_) => ProjectsSection(
                                        navbarkeys: navbarkeys,
                                      ),
                                    ),
                                  );
                                },
                                onTapResume: () async {
                                  final url = profile.resumeUrl;

                                  if (url.isNotEmpty) {
                                    await launchUrl(
                                      Uri.parse(url),
                                      mode: LaunchMode.externalApplication,
                                    );
                                  }
                                },
                              ),

                              Container(
                                key: navbarkeys[1],
                                height: screenSize.height,
                                width: screenWidth,
                                padding: const EdgeInsets.all(AppSpacing.lg),
                                color: theme.colorScheme.surface,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // const SizedBox(height: AppSpacing.lg),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: AppSpacing.lg,
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 75),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "SKILLS",
                                                style: theme
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                      color: theme
                                                          .colorScheme
                                                          .primary,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: 1.5,
                                                    ),
                                              ),
                                              Text(
                                                "What I can do",
                                                style: theme
                                                    .textTheme
                                                    .headlineMedium
                                                    ?.copyWith(
                                                      fontSize: 45,
                                                      height: 1.5,
                                                    ),
                                              ),
                                              // const SizedBox(height: AppSpacing.lg + AppSpacing.xs),
                                              SizedBox(
                                                width: 470,
                                                child: Text(
                                                  "I built cross-platform applications and scalable solutions using modern technologies.",
                                                  style: theme
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(
                                                        height: 1.8,
                                                        color: theme
                                                            .colorScheme
                                                            .onSurfaceVariant,
                                                        fontSize: 18,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppSpacing.xxl + AppSpacing.sm,
                                    ),
                                    SkillsWidget(),
                                  ],
                                ),
                              ),

                              ContactSection(contact: contact),

                              FooterSection(social: social),
                            ],
                          );
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
  } 
  // else if (navIndex == 5) {
    // openResume();
  // }
}
