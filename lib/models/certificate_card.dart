// // import 'package:flutter/material.dart';
// // import 'package:my_portfolio/models/certificate_viewer.dart';

// // class CertificateCard extends StatelessWidget {
// //   final String title;
// //   final String assetPath;

// //   const CertificateCard({
// //     super.key,
// //     required this.title,
// //     required this.assetPath,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 4,
// //       margin: const EdgeInsets.all(12),
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //       child: ListTile(
// //         leading: const Icon(Icons.picture_as_pdf),
// //         title: Text(title),
// //         trailing: const Icon(Icons.arrow_forward),
// //         onTap: () {
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //               builder: (context) => CertificateViewer(
// //                 assetPath: assetPath,
// //                 title: title,
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:my_portfolio/models/certificate_viewer.dart';

// class CertificateCard extends StatelessWidget {
//   final String title;
//   final String assetPath;

//   const CertificateCard({
//     super.key,
//     required this.title,
//     required this.assetPath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       margin: const EdgeInsets.all(12),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: ListTile(
//         leading: const Icon(Icons.picture_as_pdf),
//         title: Text(title),
//         trailing: const Icon(Icons.arrow_forward),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => CertificateViewer(
//                 assetPath: assetPath,
//                 title: title,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
