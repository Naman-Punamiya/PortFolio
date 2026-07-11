import 'package:url_launcher/url_launcher.dart';

Future<void> openResume() async {
  final Uri uri = Uri.parse('Naman_Resume.pdf');

  if (!await launchUrl(
    uri,
    mode: LaunchMode.platformDefault,
    webOnlyWindowName: '_blank',
  )) {
    throw Exception("Could not open resume.");
  }
}