import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/features/header/appbar.dart';
import 'package:my_portfolio/features/models/drawer_mobile.dart';
import 'package:my_portfolio/features/footer/footer_section.dart';
import 'package:my_portfolio/features/models/project_card.dart';
import 'package:my_portfolio/features/home/home_page.dart';
import 'package:my_portfolio/core/utils/project_utils.dart';
import 'package:my_portfolio/app/theme/app_spacing.dart';

class ProjectsSection extends StatelessWidget {
  final List<GlobalKey> navbarkeys;
  const ProjectsSection({super.key, required this.navbarkeys});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                  activeIndex: 2,
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
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        "Projects",
                        style: theme.textTheme.titleLarge,
                      ),
                      const SizedBox(height: AppSpacing.xxl),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 800),
                        child: Wrap(
                          spacing: 25,
                          runSpacing: 25,
                          children: [
                            for (int i = 0; i < allProjectUtils.length; i++)
                              ProjectCardWidget(project: allProjectUtils[i]),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xxl),
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
