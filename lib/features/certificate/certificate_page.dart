import 'package:flutter/material.dart';
import 'package:my_portfolio/core/lists/certificate_items.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/core/models/certificate_card.dart';
import 'package:my_portfolio/features/header/appbar.dart';
import 'package:my_portfolio/features/models/drawer_mobile.dart';
import 'package:my_portfolio/features/footer/footer_section.dart';
import 'package:my_portfolio/features/home/home_page.dart';

class CertificatePage extends StatelessWidget {
  final List<GlobalKey> navbarkeys;
  const CertificatePage({super.key, required this.navbarkeys});

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
                activeIndex: 4,
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
                      const SizedBox(height: 60),

                      Icon(
                        Icons.workspace_premium_rounded,
                        size: 70,
                        color: theme.colorScheme.primary,
                      ),

                      const SizedBox(height: 20),

                      Text(
                        "Certificates",
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      SizedBox(
                        width: 650,
                        child: Text(
                          "Courses, certifications, workshops and achievements that showcase my continuous learning journey.",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(.7),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      Container(
                        width: 120,
                        height: 4,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),

                      const SizedBox(height: 50),

                      if (certificates.isEmpty)
                        Column(
                          children: [
                            const SizedBox(height: 50),

                            Icon(
                              Icons.workspace_premium_outlined,
                              size: 90,
                              color: theme.colorScheme.primary.withOpacity(.7),
                            ),

                            const SizedBox(height: 20),

                            Text(
                              "No Certificates Yet",
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              "I'm continuously learning and earning new certifications.\nThey'll appear here soon!",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge,
                            ),
                          ],
                        )
                      else
                        LayoutBuilder(
                          builder: (context, constraints) {
                            int crossAxisCount = 3;

                            if (constraints.maxWidth < 700) {
                              crossAxisCount = 1;
                            } else if (constraints.maxWidth < 1100) {
                              crossAxisCount = 2;
                            } else {
                              crossAxisCount = 3;
                            }

                            return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                              ),

                              itemCount: certificates.length,

                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    crossAxisSpacing: 30,
                                    mainAxisSpacing: 30,
                                    childAspectRatio: 0.85,
                                  ),

                              itemBuilder: (context, index) {
                                return CertificateCard(
                                  certificate: certificates[index],
                                );
                              },
                            );
                          },
                        ),

                      const SizedBox(height: 80),

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
