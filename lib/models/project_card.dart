import 'package:flutter/material.dart';
import 'package:my_portfolio/utility/project_utils.dart';
import 'dart:js' as js;

class ProjectCardWidget extends StatelessWidget {
  final ProjectUtils project;

  const ProjectCardWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 280,
      width: 250,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade600,width: 2),left: BorderSide(color: Colors.grey.shade600,width: 2)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade800,blurRadius: 2,spreadRadius: 2,offset: Offset(5, 5)),BoxShadow()],
        color: Color(0xffE8E8E8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            project.image,
            height: 140,
            width: 250,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              project.title,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.subtitle,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
          Spacer(),
          Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Text(
                  "Available on:",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                Spacer(),
                if (project.iosLink != null)
                  InkWell(
                    onTap: () {
                      js.context.callMethod('open', [project.iosLink]);
                    },
                      child: Image.asset("apple.png", width: 17,color: Colors.white,),
                  ),
                if (project.androidLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod('open', [project.androidLink]);
                      },
                      child: Image.asset("android.png", width: 18,color: Colors.white,),
                    ),
                  ),
                if (project.webLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod('open', [project.webLink]);
                      },
                      child: Image.asset("web.png", width: 17,color: Colors.white,),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
