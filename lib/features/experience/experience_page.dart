import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/features/header/appbar.dart';
import 'package:my_portfolio/features/models/drawer_mobile.dart';
import 'package:my_portfolio/features/footer/footer_section.dart';
import 'package:my_portfolio/features/home/home_page.dart';

class ExperiencePage extends StatelessWidget {
  final List<GlobalKey> navbarkeys;
  const ExperiencePage({super.key, required this.navbarkeys});

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
                activeIndex: 3,
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .3235,
                      ),
                      Text(
                        "Coming Soon",
                        style: theme.textTheme.displayLarge?.copyWith(fontSize: 48),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .3235,
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
