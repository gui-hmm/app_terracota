import 'package:flutter/material.dart';
import '../utils/auth_service.dart';  // Função para salvar o login

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _isLoading = false;

  // Função de validação
  bool _validarCampos() {
    if (_emailController.text.isEmpty || _senhaController.text.isEmpty) {
      _showSnackBar('Todos os campos precisam ser preenchidos!');
      return false;
    }

    // Validar e-mail
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(_emailController.text)) {
      _showSnackBar('Por favor, insira um e-mail válido!');
      return false;
    }

    // Validar Senha
    if (_senhaController.text.length < 8) {
      _showSnackBar('A senha deve ter pelo menos 8 caracteres!');
      return false;
    }

    return true;
  }

  // Função para exibir mensagem de erro
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Imagem sobreposta (logo)
                    Center(
                      child: Image.asset(
                        'assets/images/logomarca.png', // Caminho da imagem sobreposta
                        width: 250, // Ajuste o tamanho conforme necessário
                        height: 250,
                      ),
                    ),
                    SizedBox(height: 20),  // Espaço entre a logomarca e o formulário

                    // Descrição do Campo de Email
                    Text(
                      'Informe seu endereço de e-mail',
                      style: TextStyle(
                        fontSize: 14,  // Texto menor
                        fontWeight: FontWeight.w400,  // Peso de fonte mais fino
                        color: Colors.black54,  // Cor mais suave
                      ),
                      textAlign: TextAlign.start,  // Alinhado à esquerda
                    ),
                    SizedBox(height: 8),
                    // Campo de Email
                    _buildTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      accessibilityLabel: 'Endereço de email',
                    ),
                    SizedBox(height: 20),  // Espaço entre os campos

                    // Descrição do Campo de Senha
                    Text(
                      'Informe sua senha',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8),
                    // Campo de Senha
                    _buildTextField(
                      controller: _senhaController,
                      hintText: 'Senha',
                      obscureText: true,
                      accessibilityLabel: 'Senha',
                    ),
                    SizedBox(height: 30),  // Espaço entre os campos e o botão

                    // Botão de login
                    ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () async {
                              if (!_validarCampos()) return;

                              setState(() {
                                _isLoading = true;
                              });

                              await saveLoginStatus(true);  // Salva o status de login
                              Navigator.pushReplacementNamed(context, '/home');  // Vai para a tela principal
                              print('Login pressionado');

                              setState(() {
                                _isLoading = false;
                              });
                            },
                      child: _isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text('Entrar'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),  // Largura completa
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),  // Bordas arredondadas
                        ),
                      ),
                    ),
                    
                    // Opção de redirecionamento para a tela de cadastro
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Não tem conta? '),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/cadastro');  // Navega para a tela de cadastro
                            print('Redirecionando para o cadastro');
                          },
                          child: Text(
                            'Cadastre-se',
                            style: TextStyle(
                              color: Color(0xFF802600),  // Altere a cor para o desejado
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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

  // Função para construir os campos de texto com acessibilidade
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    bool obscureText = false,
    required String accessibilityLabel,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Semantics(
        label: accessibilityLabel,  // Usando o Semantics para a acessibilidade
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16),
          ),
        ),
      ),
    );
  }
}
