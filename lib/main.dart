import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:junco_app/theme.dart';
import 'package:junco_app/screens/home_screen.dart';
import 'package:junco_app/screens/welcome_screen.dart';
import 'package:junco_app/screens/diagnosis_start_screen.dart';
import 'package:junco_app/screens/symptom_screen.dart';
import 'package:junco_app/screens/result_screen.dart';
import 'package:junco_app/screens/library_screen.dart';
import 'package:junco_app/screens/setting_screen.dart';
import 'package:junco_app/screens/about_screen.dart';
import 'package:junco_app/screens/privacy_screen.dart';
import 'package:junco_app/screens/history_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const JunCoApp());
}

class DiagnosisState extends ChangeNotifier {
  List<String> selectedSymptoms = [];

  void addSymptom(String id) {
    if (!selectedSymptoms.contains(id)) {
      selectedSymptoms.add(id);
      notifyListeners();
    }
  }

  void removeSymptom(String id) {
    selectedSymptoms.remove(id);
    notifyListeners();
  }

  void clearSymptoms() {
    selectedSymptoms.clear();
    notifyListeners();
  }

  bool isSelected(String id) => selectedSymptoms.contains(id);
}

class ThemeState extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class JunCoApp extends StatelessWidget {
  const JunCoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiagnosisState()),
        ChangeNotifierProvider(create: (_) => ThemeState()),
      ],
      child: Consumer<ThemeState>(
        builder: (context, themeState, child) {
          return MaterialApp.router(
            title: 'JunCo - Diagnosis Tanaman Kakao',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeState.themeMode,
            routerConfig: _router,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/diagnosis-start',
      builder: (context, state) => const DiagnosisStartScreen(),
    ),
    GoRoute(
      path: '/diagnosis-leaf',
      builder: (context, state) => const SymptomScreen(type: 'leaf', nextRoute: '/diagnosis-fruit'),
    ),
    GoRoute(
      path: '/diagnosis-fruit',
      builder: (context, state) => const SymptomScreen(type: 'fruit', nextRoute: '/diagnosis-stem'),
    ),
    GoRoute(
      path: '/diagnosis-stem',
      builder: (context, state) => const SymptomScreen(type: 'stem', nextRoute: '/diagnosis-result'),
    ),
    GoRoute(
      path: '/diagnosis-result',
      builder: (context, state) => const ResultScreen(),
    ),
    GoRoute(
      path: '/library',
      builder: (context, state) => const LibraryScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: '/privacy',
      builder: (context, state) => const PrivacyScreen(),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => const HistoryScreen(),
    ),
  ],
);
