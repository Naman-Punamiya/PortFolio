import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/models/appbar_desktop.dart';
import 'package:my_portfolio/models/appbar_mobile.dart';
import 'package:my_portfolio/models/contact_section.dart';
import 'package:my_portfolio/models/drawer_mobile.dart';
import 'package:my_portfolio/models/footer_section.dart';
import 'package:my_portfolio/models/home_desktop.dart';
import 'package:my_portfolio/models/home_mobile.dart';
import 'package:my_portfolio/pages/about_page.dart';
import 'package:my_portfolio/pages/certificate_page.dart';
import 'package:my_portfolio/pages/experience_page.dart';
import 'package:my_portfolio/pages/projects_page.dart';
import 'package:my_portfolio/models/skills_desktop.dart';
import 'package:my_portfolio/models/skills_mobile.dart';

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
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

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
                      SizedBox(key: navbarkeys.first),
                      if (constraints.maxWidth >= MinDesktopWidth)
                        MainPC(navbarkeys: navbarkeys)
                      else
                        MainMobile(),
                      Container(
                        key: navbarkeys[1],
                        height: screenSize.height,
                        width: screenWidth,
                        padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                        color: CustomColors.bgLight1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Row(
                                children: [
                                  SizedBox(width: 75),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "What I can do",
                                        style: TextStyle(
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 25),
                                      Text(
                                        "The type of development I do and Skills I have",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(height: 30),
                            if (constraints.maxWidth >= MedDesktopWidth)
                              SkillsDesktop()
                            else
                              SkillsMobile(),
                          ],
                        ),
                      ),

                      SizedBox(height: 30),

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
      MaterialPageRoute(builder: (context) => ExperiencePage(navbarkeys: navbarkeys)),
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
