import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/mytext.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/models/about_desktop.dart';
import 'package:my_portfolio/models/appbar_desktop.dart';
import 'package:my_portfolio/models/appbar_mobile.dart';
import 'package:my_portfolio/models/drawer_mobile.dart';
import 'package:my_portfolio/models/footer_section.dart';
import 'package:my_portfolio/models/home_mobile.dart';
import 'package:my_portfolio/pages/home_page.dart';

class AboutPage extends StatelessWidget {
  final List<GlobalKey> navbarkeys;
  const AboutPage({super.key, required this.navbarkeys});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
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
                      SizedBox(key: navbarkeys.first),
                      if (constraints.maxWidth >= MinDesktopWidth)
                        AboutDesktopPart()
                      else
                        MainMobile(),
                      Container(
                        key: navbarkeys[1],
                        height: screenSize.height * 1.35,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: screenWidth / 3.5,
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: Text(
                                                "1. STORY",
                                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900),
                                              ),
                                            ),
                                          ),

                                          ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: 700,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "A Little Bit About Myself",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  "I am a passionate Computer Engineering student at Dharmsinh Desai University (DDU), with a strong interest in full-stack development. I enjoy building both web and mobile applications, and I am constantly learning about new technologies and data structures & algorithms (DSA).\nThough I am still pursuing my degree, I have already gained hands-on experience with frontend and backend development, and I am enthusiastic about applying my skills to solve real-world problems. In my free time, I love working on personal projects.\nI am always eager to take on new challenges and push myself outside my comfort zone. I thrive on problem-solving and enjoy experimenting with new technologies to see how they can improve my projects. Whether it's building a complex feature or optimizing performance, I'm always excited to learn and grow through hands-on experience.",
                                                  style: TextStyle(
                                                    height: 2,
                                                    fontSize: 16,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 25),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: screenWidth / 3.5,
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: Text(
                                                "2. TECHNOLOGY",
                                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900),
                                              ),
                                            ),
                                          ),

                                          ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: 700,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "What I use",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  "I use a number of tools to aid my creative process when bringing things to life. Listed below are the tools and technologies that I have used over the years.",
                                                  style: TextStyle(
                                                    height: 2,
                                                    fontSize: 16,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                Text(
                                                  "Technologies",
                                                  style: TextStyle(
                                                    height: 2,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Mytext(text: 'Flutter'),
                                                        Mytext(text: 'HTML 5'),
                                                        Mytext(text: 'CSS 3'),
                                                        Mytext(
                                                          text: 'JavaScript',
                                                        ),
                                                        Mytext(text: 'Git'),
                                                      ],
                                                    ),
                                                    SizedBox(width: 30),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Mytext(
                                                          text: "FireBase",
                                                        ),
                                                        Mytext(
                                                          text:
                                                              "Adobe Illustrator",
                                                        ),
                                                        Mytext(
                                                          text:
                                                              "Adobe PhotoShop",
                                                        ),
                                                        Mytext(
                                                          text: "AppWrite",
                                                        ),
                                                        Mytext(
                                                          text: "Hive DataBase",
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 30),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Mytext(text: "C++"),
                                                        Mytext(text: "C"),
                                                        Mytext(text: "Python"),
                                                        Mytext(text: "SQL"),
                                                        Mytext(text: "Dart"),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
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
