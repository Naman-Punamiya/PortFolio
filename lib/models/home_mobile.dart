import 'package:flutter/material.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: screenSize.height,
      constraints: BoxConstraints(minHeight: 350),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset("Prog.gif", width: screenWidth / 1.25),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              "Hi,\nI am Naman,\nFlutter Developer",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.only(left: 30),
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
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(25),
                backgroundColor: Color(0xffE8E8E8),
              ),
              onPressed: () {},
              child: Text(
                "SEE MY WORKS  -->",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
