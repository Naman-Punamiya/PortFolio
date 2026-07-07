import 'package:flutter/material.dart';
import 'package:my_portfolio/app/theme/app_radius.dart';
import 'package:my_portfolio/core/constants/mytext.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/features/footer/footer_section.dart';
import 'package:my_portfolio/features/header/appbar.dart';
import 'package:my_portfolio/features/models/drawer_mobile.dart';
import 'package:my_portfolio/features/home/home_page.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';

class AboutPage extends StatelessWidget {
  final List<GlobalKey> navbarkeys;

  const AboutPage({super.key, required this.navbarkeys});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final scrollController = ScrollController();

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
                activeIndex: 1,
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
                      Container(
                        key: navbarkeys[1],
                        height: screenSize.height * 1.35,
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
                              padding: const EdgeInsets.only(
                                left: AppSpacing.lg,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                        AppSpacing.sm,
                                      ),
                                      child: Text(
                                        "1. STORY",
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900,
                                              color:
                                                  theme.colorScheme.onSurface,
                                            ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: AppSpacing.lg),
                                  ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      maxWidth: 620,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "A Little Bit About Myself",
                                          style: theme.textTheme.titleLarge,
                                        ),
                                        const SizedBox(
                                          height: AppSpacing.sm + AppSpacing.xs,
                                        ),
                                        Text(
                                          // "I am a passionate Computer Engineering student at Dharmsinh Desai University (DDU), with a strong interest in full-stack development. I enjoy building both web and mobile applications, and I am constantly learning about new technologies and data structures & algorithms (DSA).\nThough I am still pursuing my degree, I have already gained hands-on experience with frontend and backend development, and I am enthusiastic about applying my skills to solve real-world problems. In my free time, I love working on personal projects.\nI am always eager to take on new challenges and push myself outside my comfort zone. I thrive on problem-solving and enjoy experimenting with new technologies to see how they can improve my projects. Whether it's building a complex feature or optimizing performance, I'm always excited to learn and grow through hands-on experience.",
                                          "I'm Naman, a Computer Engineering student who enjoys building products that combine clean design with scalable engineering. My primary focus is Flutter, but I also enjoy backend development with Spring Boot and continuously challenge myself by solving DSA problems and building real-world applications.",
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                height: 2,
                                                letterSpacing: 1.2,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: AppSpacing.xxl*2.5),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      AppRadius.xl + AppSpacing.sm,
                                    ),
                                    child: 
                                    Image.asset(
                                      "Naman.jpg",
                                      // "Dart.png",
                                      width: screenWidth * 0.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: AppSpacing.lg,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                        AppSpacing.sm,
                                      ),
                                      child: Text(
                                        "2. TECHNOLOGY",
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900,
                                              color:
                                                  theme.colorScheme.onSurface,
                                            ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: AppSpacing.lg),
                                  ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      maxWidth: 620,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "What I use",
                                          style: theme.textTheme.titleLarge,
                                        ),
                                        const SizedBox(
                                          height: AppSpacing.sm + AppSpacing.xs,
                                        ),
                                        Text(
                                          "I use a number of tools to aid my creative process when bringing things to life. Listed below are the tools and technologies that I have used over the years.",
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                height: 2,
                                                letterSpacing: 1.2,
                                              ),
                                        ),
                                        const SizedBox(height: AppSpacing.lg),
                                        Text(
                                          "Technologies",
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                height: 2,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.2,
                                              ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Mytext(text: 'Flutter'),
                                                Mytext(text: 'HTML 5'),
                                                Mytext(text: 'CSS 3'),
                                                Mytext(text: 'JavaScript'),
                                                Mytext(text: 'Git'),
                                              ],
                                            ),
                                            const SizedBox(
                                              width:
                                                  AppSpacing.lg + AppSpacing.sm,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Mytext(text: 'FireBase'),
                                                Mytext(
                                                  text: 'Adobe Illustrator',
                                                ),
                                                Mytext(text: 'Adobe PhotoShop'),
                                                Mytext(text: 'AppWrite'),
                                                Mytext(text: 'Hive DataBase'),
                                              ],
                                            ),
                                            const SizedBox(
                                              width:
                                                  AppSpacing.lg + AppSpacing.sm,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Mytext(text: 'C++'),
                                                Mytext(text: 'C'),
                                                Mytext(text: 'Python'),
                                                Mytext(text: 'SQL'),
                                                Mytext(text: 'Dart'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
