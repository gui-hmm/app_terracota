import 'package:flutter/material.dart';
import '../utils/auth_service.dart';  // Função para limpar o login

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Faz logout e vai para a tela de login
            await saveLoginStatus(false);  // Define o login como falso
            Navigator.pushReplacementNamed(context, '/login');  // Vai para a tela de login
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
