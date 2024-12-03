import 'package:flutter/material.dart';
import '../utils/auth_service.dart'; 

class CadastroScreen extends StatelessWidget {
  const CadastroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Positioned.fill(
            child: Image.asset(
              'assets/images/Bemvindo.png', // Caminho da imagem de fundo
              fit: BoxFit.cover, // A imagem irá cobrir toda a tela
            ),
          ),
          // Conteúdo centralizado
          Center(
            child: SingleChildScrollView( // Adicionando o SingleChildScrollView para permitir rolagem
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0), // Espaçamento nas laterais
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Faz a coluna ocupar o mínimo possível de espaço
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Imagem sobreposta (logo)
                    Image.asset(
                      'assets/images/logomarca.png', // Caminho da imagem sobreposta
                      width: 250, // Ajuste o tamanho conforme necessário
                      height: 250,
                    ),

                    // Campo de Email
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Fundo branco
                        borderRadius: BorderRadius.circular(12), // Bordas arredondadas
                        border: Border.all(color: Colors.grey), // Borda normal
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none, // Remove a borda interna
                          contentPadding: EdgeInsets.all(16), // Espaçamento interno
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Espaço entre campos

                    // Campo de Senha
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Fundo branco
                        borderRadius: BorderRadius.circular(12), // Bordas arredondadas
                        border: Border.all(color: Colors.grey), // Borda normal
                      ),
                      child: TextField(
                        obscureText: true, // Torna o campo de senha invisível
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          border: InputBorder.none, // Remove a borda interna
                          contentPadding: EdgeInsets.all(16), // Espaçamento interno
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Espaço entre senha e confirmação de senha

                    // Campo de Confirmação de Senha
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Fundo branco
                        borderRadius: BorderRadius.circular(12), // Bordas arredondadas
                        border: Border.all(color: Colors.grey), // Borda normal
                      ),
                      child: TextField(
                        obscureText: true, // Torna o campo de senha invisível
                        decoration: InputDecoration(
                          hintText: 'Confirmar Senha',
                          border: InputBorder.none, // Remove a borda interna
                          contentPadding: EdgeInsets.all(16), // Espaçamento interno
                        ),
                      ),
                    ),
                    SizedBox(height: 30), // Espaço entre campos e botão

                    // Botão de cadastro
                    ElevatedButton(
                      onPressed: () async {
                        await saveLoginStatus(true);  // Salva o status de login como verdadeiro
                        Navigator.pushReplacementNamed(context, '/home');  // Vai para a tela principal após cadastro
                        print('Cadastro realizado');
                      },
                      child: Text('Cadastrar'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50), // Largura completa
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Bordas arredondadas
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Espaço entre o botão e outras opções

                    // Opção de redirecionamento para a tela de login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Já tem uma conta?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');  // Navega para a tela de login
                            print('Redirecionando para o login');
                          },
                          child: Text('Login'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
