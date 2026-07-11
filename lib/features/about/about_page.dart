import 'package:flutter/material.dart';
import 'package:my_portfolio/app/theme/app_colors.dart';
import 'package:my_portfolio/app/theme/app_radius.dart';
import 'package:my_portfolio/core/constants/goal_items.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/core/lists/skill_items.dart';
import 'package:my_portfolio/core/utils/skill_utils.dart';
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
    final List<SkillUtils> skillItems = allSkills
        .where((skill) => skill.type == "technology")
        .toList();

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
                        height: screenSize.height * 1.95,
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
                                    width: screenWidth * 0.125,
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
                                      maxWidth: 680,
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
                                          // "I'm Naman Punamiya, a Computer Engineering student at Dharmsinh Desai University with a passion for building modern, scalable software solutions. I enjoy transforming ideas into intuitive mobile and web applications that combine clean design with efficient engineering.",
                                          // "I'm Naman Punamiya, a Computer Engineering student passionate about building clean, scalable, and user-friendly applications. I specialize in Flutter development and enjoy creating cross-platform experiences while expanding my backend skills with Spring Boot and PostgreSQL.",
                                          "I'm Naman Punamiya, a Computer Engineering student at Dharmsinh Desai University with a passion for building modern, scalable software solutions. I enjoy turning ideas into intuitive mobile and web applications that combine clean design with efficient engineering.",
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                height: 2,
                                                fontSize: 15,
                                              ),
                                        ),
                                        SizedBox(height: AppSpacing.xs),
                                        Text(
                                          // "I'm Naman, a Computer Engineering student who enjoys building products that combine clean design with scalable engineering. My primary focus is Flutter, but I also enjoy backend development with Spring Boot and continuously challenge myself by solving DSA problems and building real-world applications.",
                                          // "My primary expertise is in Flutter, where I develop responsive cross-platform applications, while also expanding my backend knowledge using Spring Boot and PostgreSQL. I believe in writing maintainable code, following best practices, and continuously improving with every project I build.",
                                          "I primarily specialize in Flutter development and continuously expand my backend skills with Spring Boot and PostgreSQL. I believe in writing clean, maintainable code while following best practices to build reliable applications.",
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                height: 2,
                                                fontSize: 15,
                                              ),
                                        ),
                                        SizedBox(height: AppSpacing.xs),
                                        Text(
                                          // "Beyond development, I actively strengthen my Data Structures & Algorithms skills to become a better problem solver. I enjoy exploring new technologies, learning software architecture, and challenging myself through real-world projects that push me to grow as a developer.",
                                          "Beyond development, I enjoy strengthening my Data Structures & Algorithms skills and exploring new technologies through real-world projects. My goal is to become a Full-Stack Software Engineer who creates impactful software and meaningful user experiences.",
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                height: 2,
                                                fontSize: 15,
                                              ),
                                        ),
                                        SizedBox(height: AppSpacing.xs),
                                        Row(
                                          children: [
                                            infoCard(
                                              Icons.work_outline_rounded,
                                              "4+",
                                              "Project Completed",
                                              theme,
                                            ),
                                            infoCard(
                                              Icons.code_outlined,
                                              "15+",
                                              "Technologies Learned",
                                              theme,
                                            ),
                                            infoCard(
                                              Icons.emoji_events_rounded,
                                              "150+",
                                              "DSA Problems Solved",
                                              theme,
                                            ),
                                            infoCard(
                                              Icons.calendar_month_outlined,
                                              "2+",
                                              "Years of Experience",
                                              theme,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: AppSpacing.xxl * 2),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      AppRadius.xl + AppSpacing.sm,
                                    ),
                                    child: Image.asset(
                                      "Naman.jpg",
                                      // "Dart.png",
                                      width: screenWidth * 0.25,
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
                                    width: screenWidth * 0.125,
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                        AppSpacing.sm,
                                      ),
                                      child: Text(
                                        "2. EDUCATION",
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
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                                    width: screenWidth * .75,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 22,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(22),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(.1),
                                          blurRadius: 5,
                                          spreadRadius: 2,
                                          offset: const Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 90,
                                          width: 90,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: theme
                                                .colorScheme
                                                .primaryContainer,
                                          ),
                                          child: Icon(
                                            Icons.school_outlined,
                                            size: 46,
                                            color: theme.colorScheme.primary,
                                          ),
                                        ),
                                        SizedBox(width: AppSpacing.lg),
                                        SizedBox(
                                          width: screenWidth * 0.25,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Bachelor of Engineering in Computer Engineering",
                                                style: theme
                                                    .textTheme
                                                    .titleLarge
                                                    ?.copyWith(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                              const SizedBox(
                                                height: AppSpacing.xs,
                                              ),
                                              Text(
                                                "Dharmsinh Desai University",
                                                style: theme
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      fontSize: 17,
                                                      color: Colors.grey[700],
                                                    ),
                                              ),
                                              const SizedBox(
                                                height: AppSpacing.xs - 4,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .calendar_month_outlined,
                                                    size: 12,
                                                    color: theme
                                                        .colorScheme
                                                        .primary,
                                                  ),
                                                  SizedBox(
                                                    width: AppSpacing.xs,
                                                  ),
                                                  Text(
                                                    "2024 - 2028",
                                                    style: theme
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 90,
                                          child: VerticalDivider(
                                            thickness: 2,
                                            color: theme.dividerColor,
                                            // .withOpacity(.2),
                                            width: 40,
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        SizedBox(
                                          width: screenWidth * 0.3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          top: 6.0,
                                                        ),
                                                    child: Icon(
                                                      Icons.circle,
                                                      size: 12,
                                                      color: theme
                                                          .colorScheme
                                                          .primary,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: AppSpacing.xs,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "Focused on Software Development, Data Structures & Algorithms, and System Designs.",
                                                      style: theme
                                                          .textTheme
                                                          .bodyMedium
                                                          ?.copyWith(
                                                            height: 1.6,
                                                            fontSize: 15,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: AppSpacing.xs,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          top: 6.0,
                                                        ),
                                                    child: Icon(
                                                      Icons.circle,
                                                      size: 12,
                                                      color: theme
                                                          .colorScheme
                                                          .primary,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: AppSpacing.xs,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "Active member of coding communities and participated in multiple hackathons and coding competitions.",
                                                      style: theme
                                                          .textTheme
                                                          .bodyMedium
                                                          ?.copyWith(
                                                            // height: 2,
                                                            fontSize: 15,
                                                          ),
                                                    ),
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
                            Padding(
                              padding: const EdgeInsets.only(
                                left: AppSpacing.lg,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.125,
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                        AppSpacing.sm,
                                      ),
                                      child: Text(
                                        "3. TECHNOLOGY",
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
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Technologies I use",
                                          style: theme.textTheme.titleLarge
                                              ?.copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                              ),
                                        ),
                                        const SizedBox(height: AppSpacing.xs),
                                        Text(
                                          // "I use a number of tools to aid my creative process when bringing things to life. Listed below are the tools and technologies that I have used over the years.",
                                          "A collection of tools and technologies I work with.",
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                fontSize: 15,
                                                height: 2,
                                                letterSpacing: 1.2,
                                              ),
                                        ),
                                        SizedBox(height: AppSpacing.md),
                                        SizedBox(
                                          width: screenWidth * 0.7,
                                          child: GridView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: skillItems.length,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 5,
                                                  crossAxisSpacing: 20,
                                                  mainAxisSpacing: 20,
                                                  childAspectRatio: 3.0,
                                                ),
                                            itemBuilder: (context, index) {
                                              final skill = skillItems[index];

                                              return techCard(
                                                skill.title,
                                                skill.image,
                                                theme,
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(height: AppSpacing.xxl),
                                      ],
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
                                    width: screenWidth * 0.125,
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                        AppSpacing.sm,
                                      ),
                                      child: Text(
                                        "3. GOALS",
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
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "What I'm Currently Working on",
                                          style: theme.textTheme.titleLarge
                                              ?.copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                              ),
                                        ),
                                        const SizedBox(height: AppSpacing.xs),
                                        Text(
                                          "My current focus and future goals.",
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                fontSize: 15,
                                                height: 2,
                                                letterSpacing: 1.2,
                                              ),
                                        ),
                                        SizedBox(height: AppSpacing.md),
                                        SizedBox(
                                          width: screenWidth * 0.7,
                                          child: GridView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: goalItems.length,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 4,
                                                  crossAxisSpacing: 20,
                                                  mainAxisSpacing: 20,
                                                  childAspectRatio: 1.0,
                                                ),
                                            itemBuilder: (context, index) {
                                              return goalCard(
                                                goalItems[index]['icon'],
                                                goalItems[index]['title'],
                                                goalItems[index]['subtitle'],
                                                theme,
                                              );
                                            },
                                          ),
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

  Widget infoCard(IconData? icon, String value, String title, dynamic theme) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 16, 40),
      width: 135,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 58,
            width: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colorScheme.primaryContainer,
            ),
            child: Icon(icon, color: theme.colorScheme.primary, size: 30),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget techCard(String name, String imagePath, dynamic theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 34,
            height: 34,
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget goalCard(IconData icon, String title, String subtitle, dynamic theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            // width: 34,
            // height: 34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colorScheme.primaryContainer,
            ),
            child: Icon(icon, color: theme.colorScheme.primary, size: 40),
          ),
          const SizedBox(height: 14),
          Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            textAlign: TextAlign.center,
            subtitle,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
