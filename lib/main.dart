import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importar o provider
import 'package:terracota/screens/ajuda_screen.dart';
import 'package:terracota/screens/cadastro_screen.dart';
import 'package:terracota/screens/cart_screen.dart';
import 'package:terracota/screens/notificacoes_screen.dart';
import 'package:terracota/screens/pagamentos_screen.dart';
import 'package:terracota/screens/perfil_screen.dart';
import 'package:terracota/screens/seguranca_screen.dart';
import 'package:terracota/screens/settings_screen.dart';
import 'package:terracota/utils/card_provider.dart';
import 'screens/splash_screen.dart';  // Importa a Splash Screen
import 'screens/login_screen.dart';   // Importa a Login Screen
import 'screens/home_screen.dart';    // Importa a Home Screen

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(), // Provedor para gerenciar o carrinho
      child: const MainApp(),
    ),
  );
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
        '/cadastro': (context) => const CadastroScreen(),
        '/home': (context) => HomeScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/perfil': (context) => const PerfilScreen(),
        '/pagamentos': (context) => const PagamentosScreen(),
        '/notificacoes': (context) => const NotificacoesScreen(),
        '/seguranca': (context) => const SegurancaScreen(),
        '/ajuda': (context) => const AjudaScreen(),
        '/cart': (context) => const CartScreen(),  // Adicionando a rota do carrinho
      },
    );
  }
}
