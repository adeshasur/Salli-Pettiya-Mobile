import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const SalliPettiyaApp());
}

class SalliPettiyaApp extends StatelessWidget {
  const SalliPettiyaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salli Pettiya',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.pureBlack,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DashboardScreen(),
    );
  }
}