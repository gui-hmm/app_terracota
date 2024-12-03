import 'package:flutter/material.dart';
import 'package:terracota/screens/ajuda_screen.dart';
import 'package:terracota/screens/notificacoes_screen.dart';
import 'package:terracota/screens/pagamentos_screen.dart';
import 'package:terracota/screens/perfil_screen.dart';
import 'package:terracota/screens/seguranca_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF802600),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Color(0xFFFFFFFF),
          ),
          onPressed: () {
            // Navega para a página inicial (Home)
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Configurações',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () {
              // Navegar até a tela de Perfil
              Navigator.pushNamed(context, '/perfil');
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Pagamentos'),
            onTap: () {
              // Navegar até a tela de Pagamentos
              Navigator.pushNamed(context, '/pagamentos');
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notificações'),
            onTap: () {
              // Navegar até a tela de Notificações
              Navigator.pushNamed(context, '/notificacoes');
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Segurança'),
            onTap: () {
              // Navegar até a tela de Segurança
              Navigator.pushNamed(context, '/seguranca');
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Ajuda e Suporte'),
            onTap: () {
              // Navegar até a tela de Ajuda
              Navigator.pushNamed(context, '/ajuda');
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: () {
              // Aqui você pode adicionar a lógica para deslogar o usuário
              Navigator.pushReplacementNamed(context, '/login');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Saindo do aplicativo...')),
                
              );
            },
          ),
        ],
      ),
    );
  }
}
