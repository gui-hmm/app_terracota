import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../utils/auth_service.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _contatoController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();

  bool _isLoading = false;  // Variável para controlar o estado de carregamento
  String _tipoSelecionado = 'cliente';  // Variável para armazenar o tipo selecionado

  // Máscaras
  final _cpfFormatter = MaskTextInputFormatter(mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});
  final _contatoFormatter = MaskTextInputFormatter(mask: '(##) #####-####', filter: {'#': RegExp(r'[0-9]')});

  // Função de validação
  bool _validarCampos() {
    if (_nomeController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _tipoSelecionado.isEmpty ||
        _cpfController.text.isEmpty ||
        _contatoController.text.isEmpty ||
        _senhaController.text.isEmpty ||
        _confirmarSenhaController.text.isEmpty) {
      _showSnackBar('Todos os campos precisam ser preenchidos!');
      return false;
    }

    // Validar e-mail
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(_emailController.text)) {
      _showSnackBar('Por favor, insira um e-mail válido!');
      return false;
    }

    // Validar CPF
    if (_cpfController.text.length != 14) {  // Formato do CPF é 000.000.000-00
      _showSnackBar('Por favor, insira um CPF válido!');
      return false;
    }

    // Validar Contato
    if (_contatoController.text.length != 15) {  // Formato do telefone é (00) 00000-0000
      _showSnackBar('Por favor, insira um número de telefone válido!');
      return false;
    }

    // Validar Senha
    if (_senhaController.text != _confirmarSenhaController.text) {
      _showSnackBar('As senhas não coincidem!');
      return false;
    }
    
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
              'assets/images/Bemvindo.png',
              fit: BoxFit.cover,
            ),
          ),
          // Conteúdo centralizado
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,  // Alinha as descrições à esquerda
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Imagem sobreposta (logo) centralizada
                    Center(  // Adicionando o widget Center para centralizar a logomarca
                      child: Image.asset(
                        'assets/images/logomarca.png',
                        width: 250,
                        height: 250,
                      ),
                    ),
                    SizedBox(height: 20),  // Reduzindo o espaço após a logomarca

                    // Descrição do Campo de Nome
                    Text(
                      'Informe seu nome completo',
                      style: TextStyle(
                        fontSize: 14,  // Texto menor
                        fontWeight: FontWeight.w400,  // Peso de fonte mais fino
                        color: Colors.black54,  // Cor mais suave
                      ),
                      textAlign: TextAlign.start,  // Alinhado à esquerda
                    ),
                    SizedBox(height: 8),
                    // Campo de Nome
                    _buildTextField(
                      controller: _nomeController,
                      hintText: 'Nome',
                      accessibilityLabel: 'Nome completo',
                    ),
                    SizedBox(height: 20),

                    // Descrição do Campo de Email
                    Text(
                      'Informe seu endereço de e-mail',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8),
                    // Campo de Email
                    _buildTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      accessibilityLabel: 'Endereço de email',
                    ),
                    SizedBox(height: 20),

                    // Descrição do Campo de Tipo (Dropdown)
                    Text(
                      'Selecione o tipo de conta',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8),
                    // Campo de Tipo (Dropdown)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButton<String>(
                          value: _tipoSelecionado,
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down),
                          onChanged: (String? newValue) {
                            setState(() {
                              _tipoSelecionado = newValue!;
                            });
                          },
                          items: <String>['cliente', 'empresa', 'artesão']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Descrição do Campo de CPF
                    Text(
                      'Informe seu CPF',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8),
                    // Campo de CPF com máscara
                    _buildTextField(
                      controller: _cpfController,
                      hintText: 'CPF',
                      keyboardType: TextInputType.number,
                      inputFormatters: [_cpfFormatter],  // Aplicando a máscara
                      accessibilityLabel: 'Número do CPF',
                    ),
                    SizedBox(height: 20),

                    // Descrição do Campo de Contato
                    Text(
                      'Informe seu número de telefone',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8),
                    // Campo de Contato com máscara
                    _buildTextField(
                      controller: _contatoController,
                      hintText: 'Contato',
                      keyboardType: TextInputType.phone,
                      inputFormatters: [_contatoFormatter],  // Aplicando a máscara para telefone
                      accessibilityLabel: 'Número de contato',
                    ),
                    SizedBox(height: 20),

                    // Descrição do Campo de Senha
                    Text(
                      'Crie uma senha para sua conta',
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
                    SizedBox(height: 20),

                    // Descrição do Campo de Confirmação de Senha
                    Text(
                      'Confirme sua senha',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8),
                    // Campo de Confirmação de Senha
                    _buildTextField(
                      controller: _confirmarSenhaController,
                      hintText: 'Confirmar Senha',
                      obscureText: true,
                      accessibilityLabel: 'Confirmar senha',
                    ),
                    SizedBox(height: 30),

                    // Botão de cadastro
                    ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () async {
                              if (!_validarCampos()) return;

                              setState(() {
                                _isLoading = true;
                              });

                              await saveLoginStatus(true);
                              Navigator.pushReplacementNamed(context, '/home');
                              print('Cadastro realizado');

                              setState(() {
                                _isLoading = false;
                              });
                            },
                      child: _isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text('Cadastrar'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Opção de redirecionamento para o login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Já tem uma conta?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
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

  // Função para construir os campos de texto com acessibilidade
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    bool obscureText = false,
    required String accessibilityLabel,
    List<TextInputFormatter>? inputFormatters,
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
          inputFormatters: inputFormatters,  // Permitindo formatação
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
