import 'package:flutter/material.dart';

import 'package:flicktv_bhuvaneshwaran/core/theme/app_colors.dart';
import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/presentation/pages/blinkit_money_page.dart';

void main() {
  runApp(const BhuvaneshwaranApp());
}

/// Root application widget.
class BhuvaneshwaranApp extends StatelessWidget {
  const BhuvaneshwaranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bhuvaneshwaran',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
      ),
      home: const BlinkitMoneyPage(),
    );
  }
}
