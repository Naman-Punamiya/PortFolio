import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/models/custom_textfield.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
      color: Colors.grey[900],
      child: Column(
        children: [
          Text(
            "Get in Touch",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 50),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700, maxHeight: 100),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= MinDesktopWidth) {
                  return buildnameEmailFieldMobile();
                } else {
                  return buildnameEmailFieldDesktop();
                }
              },
            ),
          ),
          SizedBox(height: 15),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: CustomTextfield(
              hintText: "Your Message",
              maxLine: 10,
              controller: null,
            ),
          ),
          SizedBox(height: 15),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: SizedBox(
              height: 50,
              width: double.maxFinite,
              child: ElevatedButton(onPressed: () {}, child: Text("Send")),
            ),
          ),
          SizedBox(height: 30),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: ConstrainedBox(
          //     constraints: BoxConstraints(maxWidth: 700),
          //     child: Divider(),
          //   ),
          // ),
          // SizedBox(height: 15),
          // Wrap(
          //   spacing: 12,
          //   runSpacing: 12,
          //   alignment: WrapAlignment.center,
          //   children: [
          //     InkWell(
          //       onTap: () {
          //         js.context.callMethod("open",[SnsLinks.github]);
          //       },
          //       child: Image.asset("flutter.png", width: 28),
          //     ),
          //     InkWell(
          //       onTap: () {
          //         js.context.callMethod("open",[SnsLinks.linkedin]);
          //       },
          //       child: Image.asset("flutter.png", width: 28),
          //     ),
          //     InkWell(
          //       onTap: () {
          //         js.context.callMethod("open",[SnsLinks.instagram]);
          //       },
          //       child: Image.asset("flutter.png", width: 28),
          //     ),
          //     InkWell(
          //       onTap: () {
          //         js.context.callMethod("open",[SnsLinks.telegram]);
          //       },
          //       child: Image.asset("flutter.png", width: 28),
          //     ),
          //     InkWell(
          //       onTap: () {
          //         js.context.callMethod("open",[SnsLinks.github]);
          //       },
          //       child: Image.asset("flutter.png", width: 28),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

Column buildnameEmailFieldMobile() {
  return Column(
    children: [
      Flexible(
        child: CustomTextfield(
          hintText: "Your Name",
          maxLine: 1,
          controller: null,
        ),
      ),
      SizedBox(height: 15),
      Flexible(
        child: CustomTextfield(
          hintText: "Your Email",
          maxLine: 1,
          controller: null,
        ),
      ),
    ],
  );
}

Row buildnameEmailFieldDesktop() {
  return Row(
    children: [
      Flexible(
        child: CustomTextfield(
          hintText: "Your Name",
          maxLine: 1,
          controller: null,
        ),
      ),
      SizedBox(width: 15),
      Flexible(
        child: CustomTextfield(
          hintText: "Your Email",
          maxLine: 1,
          controller: null,
        ),
      ),
    ],
  );
}
