import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/skill_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 450),
            child: Wrap(
              spacing: 5.0,
              runSpacing: 5.0,
              children: [
                for (int i = 0; i < platformItems.length; i++)
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Color(0xffE8E8E8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      leading: Image.asset(
                        platformItems[i]["img"],
                        width: 26,
                      ),
                      title: Text(platformItems[i]["title"]),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: 50),
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (int i = 0; i < skillItems.length; i++)
                    Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      backgroundColor: Color(0xffE8E8E8),
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      label: Text(skillItems[i]['title']),
                      avatar: Image.asset(skillItems[i]["img"]),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
