import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login_page.dart';
import 'screens/home.dart';
import 'screens/onboarding.dart';
import 'screens/admin_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool onboardingComplete = prefs.getBool('onboardingComplete') ?? false;
  bool loggedIn = prefs.getBool('loggedIn') ?? false;
  String role = prefs.getString('role') ?? 'User';

  runApp(MyApp(
      onboardingComplete: onboardingComplete, loggedIn: loggedIn, role: role));
}

class MyApp extends StatelessWidget {
  final bool onboardingComplete;
  final bool loggedIn;
  final String role;

  MyApp(
      {required this.onboardingComplete,
      required this.loggedIn,
      required this.role});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Blog',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: onboardingComplete
          ? (loggedIn
              ? (role == 'Admin' ? AdminDashboard() : HomePage())
              : LoginPage())
          : OnboardingPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/admin_dashboard': (context) => AdminDashboard(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
