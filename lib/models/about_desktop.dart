import 'package:flutter/material.dart';

class AboutDesktopPart extends StatelessWidget {
  const AboutDesktopPart({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      color: Color(0xffF9F9F9),
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: screenSize.height/1.5,
      // constraints: BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I am Student of BTech in Computer Engineering. I am very curious about new technologies.",
                  style: TextStyle(fontSize: 26, height: 1.5),
                ),
                SizedBox(height: 20),
                Text(
                  "I thrive in team-oriented environments and enjoy working on projects that require collaboration and strategic input.",
                  style: TextStyle(fontSize: 26, height: 1.5),
                ),
                SizedBox(height: 20),
                Text(
                  "I like to work on project in order to strengthen my skills. ",
                  style: TextStyle(fontSize: 26, height: 1.5),
                ),
              ],
            ),
          ),
          SizedBox(width: 150,),
          ClipRRect(borderRadius: BorderRadius.circular(40),child: Image.asset("Naman.jpg", width: screenWidth / 4,)),
        ],
      ),
    );
  }
}
