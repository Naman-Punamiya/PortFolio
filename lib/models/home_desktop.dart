import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/projects_page.dart';

class MainPC extends StatelessWidget {
  final List<GlobalKey> navbarkeys;
  const MainPC({super.key, required this.navbarkeys});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: screenSize.height,
      constraints: BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hi,\nI am Naman,\nFlutter Developer",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.only(left: 60),
                width: 350,
                child: Text(
                  "Mobile Developer / Flutter Developer / Software Engineering",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffE8E8E8),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                            ProjectsSection(navbarkeys: navbarkeys),
                      ),
                    );
                  },
                  child: Text(
                    "SEE MY WORKS  -->",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      height: 1.75,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Image.asset("Prog.gif", width: screenWidth / 2),
        ],
      ),
    );
  }
}
