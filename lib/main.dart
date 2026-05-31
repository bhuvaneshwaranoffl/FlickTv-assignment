import 'package:flutter/material.dart';

import 'core/theme/app_colors.dart';
import 'features/blinkit_money/presentation/pages/blinkit_money_page.dart';

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
