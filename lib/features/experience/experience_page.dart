import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/size.dart';
import 'package:my_portfolio/core/repositories/social_repository.dart';
import 'package:my_portfolio/core/utils/social_utils.dart';
import 'package:my_portfolio/features/header/appbar.dart';
import 'package:my_portfolio/features/models/drawer_mobile.dart';
import 'package:my_portfolio/features/footer/footer_section.dart';
import 'package:my_portfolio/features/home/home_page.dart';

class ExperiencePage extends StatefulWidget {
  final List<GlobalKey> navbarkeys;
  const ExperiencePage({super.key, required this.navbarkeys});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  late final SocialRepository _socialRepository;
  late final Future<SocialUtils> _socialFuture;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _socialRepository = SocialRepository();
    _socialFuture = _socialRepository.getSocials();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                activeIndex: 3,
                onLogoTap: () {},
                onMenuTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
                onNavMenuTap: (int navIndex) {
                  scrollToSection(navIndex, widget.navbarkeys, context);
                }, onResumeTap: () {  },
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .3235,
                      ),
                      Text(
                        "Coming Soon",
                        style: theme.textTheme.displayLarge?.copyWith(
                          fontSize: 48,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .3235,
                      ),
                      FutureBuilder<SocialUtils>(
                        future: _socialFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox.shrink();
                          }

                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          }

                          if (!snapshot.hasData) {
                            return const SizedBox.shrink();
                          }

                          return FooterSection(social: snapshot.data!);
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
