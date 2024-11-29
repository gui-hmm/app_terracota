import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';  // Importa a Splash Screen
import 'screens/login_screen.dart';   // Importa a Login Screen
import 'screens/home_screen.dart';    // Importa a Home Screen

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',  // Tela inicial
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
