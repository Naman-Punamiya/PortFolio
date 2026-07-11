import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/features/home/home_page.dart';
import 'package:my_portfolio/app/theme/app_theme.dart';
import 'package:my_portfolio/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: HomePage(),
    );
  }
}

// Background      #FAF8F5
// Card            #FFFFFF
// Primary         #4F46E5 (Indigo)
// Secondary       #14B8A6 (Teal)
// Text            #111827
// Muted Text      #6B7280
// Border          #E5E7EB

// | Element    | Color     |
// | ---------- | --------- |
// | Background | `#F8FAF7` |
// | Card       | `#FFFFFF` |
// | Primary    | `#3F7D58` |
// | Secondary  | `#6A9C89` |
// | Accent     | `#A7C1A8` |
// | Text       | `#1F2937` |
// | Subtitle   | `#6B7280` |
// | Border     | `#E5E7EB` |

// | Element    | Color     |
// | ---------- | --------- |
// | Background | `#FAFCFB` |
// | Card       | `#FFFFFF` |
// | Primary    | `#2DD4BF` |
// | Secondary  | `#14B8A6` |
// | Accent     | `#99F6E4` |
// | Text       | `#111827` |
// | Subtitle   | `#6B7280` |
