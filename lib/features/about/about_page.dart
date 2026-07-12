import 'package:flutter/material.dart';
import 'package:my_portfolio/app/theme/app_colors.dart';
import 'package:my_portfolio/app/theme/app_radius.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/core/repositories/education_repository.dart';
import 'package:my_portfolio/core/repositories/goal_repository.dart';
import 'package:my_portfolio/core/repositories/profile_repository.dart';
import 'package:my_portfolio/core/repositories/skill_repository.dart';
import 'package:my_portfolio/core/repositories/social_repository.dart';
import 'package:my_portfolio/core/utils/education_utils.dart';
import 'package:my_portfolio/core/utils/goal_utils.dart';
import 'package:my_portfolio/core/utils/profile_utils.dart';
import 'package:my_portfolio/core/utils/skill_utils.dart';
import 'package:my_portfolio/core/utils/social_utils.dart';
import 'package:my_portfolio/features/footer/footer_section.dart';
import 'package:my_portfolio/features/header/appbar.dart';
import 'package:my_portfolio/features/models/drawer_mobile.dart';
import 'package:my_portfolio/features/home/home_page.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';

class AboutPage extends StatefulWidget {
  final List<GlobalKey> navbarkeys;

  const AboutPage({super.key, required this.navbarkeys});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late final ProfileRepository _profileRepository;
  late final SocialRepository _socialRepository;
  late final SkillRepository _skillRepository;
  late final EducationRepository _educationRepository;
  late final GoalRepository _goalRepository;

  late final Future<ProfileUtils> _profileFuture;
  late final Future<SocialUtils> _socialFuture;
  late final Future<List<SkillUtils>> _skillsFuture;
  late final Future<EducationUtils> _educationFuture;
  late final Future<List<GoalUtils>> _goalsFuture;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _profileRepository = ProfileRepository();
    _socialRepository = SocialRepository();
    _skillRepository = SkillRepository();
    _educationRepository = EducationRepository();
    _goalRepository = GoalRepository();
    _profileFuture = _profileRepository.getProfile();
    _socialFuture = _socialRepository.getSocials();
    _skillsFuture = _skillRepository.getSkills();
    _educationFuture = _educationRepository.getEducation();
    _goalsFuture = _goalRepository.getGoals();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
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
                activeIndex: 1,
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
                child: FutureBuilder<List<dynamic>>(
                  future: Future.wait([
                    _profileFuture,
                    _socialFuture,
                    _skillsFuture,
                    _educationFuture,
                    _goalsFuture,
                  ]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    }

                    if (!snapshot.hasData) {
                      return const Center(child: Text("No data found."));
                    }

                    final profile = snapshot.data![0] as ProfileUtils;
                    final social = snapshot.data![1] as SocialUtils;
                    final skills = snapshot.data![2] as List<SkillUtils>;
                    final education = snapshot.data![3] as EducationUtils;
                    final goals = snapshot.data![4] as List<GoalUtils>;
                    final technologySkills = skills
                        .where(
                          (skill) => skill.type.toLowerCase() == "technology",
                        )
                        .toList();

                    return SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(key: widget.navbarkeys.first),
                          Container(
                            key: widget.navbarkeys[1],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  color: theme
                                                      .colorScheme
                                                      .onSurface,
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
                                              height:
                                                  AppSpacing.sm + AppSpacing.xs,
                                            ),
                                            Text(
                                              // "I'm Naman Punamiya, a Computer Engineering student at Dharmsinh Desai University with a passion for building modern, scalable software solutions. I enjoy transforming ideas into intuitive mobile and web applications that combine clean design with efficient engineering.",
                                              // "I'm Naman Punamiya, a Computer Engineering student passionate about building clean, scalable, and user-friendly applications. I specialize in Flutter development and enjoy creating cross-platform experiences while expanding my backend skills with Spring Boot and PostgreSQL.",
                                              // "I'm Naman Punamiya, a Computer Engineering student at Dharmsinh Desai University with a passion for building modern, scalable software solutions. I enjoy turning ideas into intuitive mobile and web applications that combine clean design with efficient engineering.",
                                              profile.about,
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
                                          AppRadius.xl,
                                        ),
                                        child: Image.network(
                                          profile.profileImageUrl,
                                          width: screenWidth * 0.25,
                                          fit: BoxFit.cover,
                                          loadingBuilder:
                                              (
                                                context,
                                                child,
                                                loadingProgress,
                                              ) {
                                                if (loadingProgress == null)
                                                  return child;

                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              },
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return const Icon(
                                                  Icons.person,
                                                  size: 120,
                                                );
                                              },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  color: theme
                                                      .colorScheme
                                                      .onSurface,
                                                ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: AppSpacing.lg),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          40,
                                        ),
                                        width: screenWidth * .75,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 30,
                                          vertical: 22,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            22,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                .1,
                                              ),
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
                                                color:
                                                    theme.colorScheme.primary,
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
                                                    education.degree,
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
                                                    education.university,
                                                    style: theme
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                          fontSize: 17,
                                                          color:
                                                              Colors.grey[700],
                                                        ),
                                                  ),
                                                  const SizedBox(
                                                    height: AppSpacing.xs - 4,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .location_on_outlined,
                                                        size: 14,
                                                        color: theme
                                                            .colorScheme
                                                            .primary,
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        education.location,
                                                        style: theme
                                                            .textTheme
                                                            .bodyMedium
                                                            ?.copyWith(
                                                              fontSize: 15,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: AppSpacing.xs - 4,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.grade_outlined,
                                                        size: 14,
                                                        color: theme
                                                            .colorScheme
                                                            .primary,
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        "CGPA: ${education.cgpa}",
                                                        style: theme
                                                            .textTheme
                                                            .bodyMedium
                                                            ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ],
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
                                                        "${education.startYear} - ${education.endYear}",
                                                        style: theme
                                                            .textTheme
                                                            .bodyMedium
                                                            ?.copyWith(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                                children: education.points.map((
                                                  point,
                                                ) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          bottom: 8,
                                                        ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text("• "),
                                                        Expanded(
                                                          child: Text(point),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  color: theme
                                                      .colorScheme
                                                      .onSurface,
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
                                            const SizedBox(
                                              height: AppSpacing.xs,
                                            ),
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
                                                itemCount:
                                                    technologySkills.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 5,
                                                      crossAxisSpacing: 20,
                                                      mainAxisSpacing: 20,
                                                      childAspectRatio: 3.0,
                                                    ),
                                                itemBuilder: (context, index) {
                                                  final skill =
                                                      technologySkills[index];

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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.125,
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                            AppSpacing.sm,
                                          ),
                                          child: Text(
                                            "4. GOALS",
                                            style: theme.textTheme.bodySmall
                                                ?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w900,
                                                  color: theme
                                                      .colorScheme
                                                      .onSurface,
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
                                            const SizedBox(
                                              height: AppSpacing.xs,
                                            ),
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
                                                itemCount: goals.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 4,
                                                      crossAxisSpacing: 20,
                                                      mainAxisSpacing: 20,
                                                      childAspectRatio: 1.0,
                                                    ),
                                                itemBuilder: (context, index) {
                                                  return goalCard(
                                                    goals[index].icon,
                                                    goals[index].title,
                                                    goals[index].subtitle,
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
                          FooterSection(social: social),
                        ],
                      ),
                    );
                  },
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

  Widget goalCard(String icon, String title, String subtitle, dynamic theme) {
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
            child: Icon(
              getGoalIcon(icon),
              color: theme.colorScheme.primary,
              size: 40,
            ),
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

  IconData getGoalIcon(String icon) {
    switch (icon) {
      case "developer_mode":
        return Icons.developer_mode;
      case "school":
        return Icons.school;
      case "code":
        return Icons.code;
      case "psychology":
        return Icons.psychology;
      default:
        return Icons.flag;
    }
  }
}
