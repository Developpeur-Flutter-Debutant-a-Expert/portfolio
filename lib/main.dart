import 'package:flutter/material.dart';
import 'utils/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/about_screen.dart';
import 'screens/skills_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio Flutter',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (_) => const HomeScreen(),
        '/projects': (_) => const ProjectsScreen(),
        '/about': (_) => const AboutScreen(),
        '/skills': (_) => const SkillsScreen(),
        '/contact': (_) => const ContactScreen(),
      },
    );
  }
}
