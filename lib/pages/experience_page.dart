import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/models/appbar_desktop.dart';
import 'package:my_portfolio/models/appbar_mobile.dart';
import 'package:my_portfolio/models/drawer_mobile.dart';
import 'package:my_portfolio/models/footer_section.dart';
import 'package:my_portfolio/models/project_card.dart';
import 'package:my_portfolio/pages/home_page.dart';
import 'package:my_portfolio/utility/project_utils.dart';

class ExperiencePage extends StatelessWidget {
  final List<GlobalKey> navbarkeys;
  const ExperiencePage({super.key, required this.navbarkeys});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final scrollController = ScrollController();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer: (constraints.maxWidth >= MinDesktopWidth)
              ? null
              : DrawerMobile(
                  onNavItemTap: (int navIndex) {
                    scrollToSection(navIndex, navbarkeys, context);
                    scaffoldKey.currentState?.closeEndDrawer();
                  },
                ),
          backgroundColor: CustomColors.scaffoldBg,
          body: Column(
            children: [
              if (constraints.maxWidth >= MinDesktopWidth)
                AppBarPC(
                  onNavMenuTap: (int navIndex) {
                    scrollToSection(navIndex, navbarkeys, context);
                  },
                )
              else
                AppBarMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * .3235,),
                      Text(
                        "Coming Soon",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * .3235,),
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
