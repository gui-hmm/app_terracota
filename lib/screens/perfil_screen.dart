import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  // Controladores para os campos de texto
  final TextEditingController _nomeController = TextEditingController(text: 'João Silva');
  final TextEditingController _emailController = TextEditingController(text: 'joao.silva@email.com');
  final TextEditingController _enderecoController = TextEditingController(text: 'Rua das Flores, 123');
  final TextEditingController _generoController = TextEditingController(text: 'Masculino');
  final TextEditingController _cpfController = TextEditingController(text: '123.456.789-00');
  final TextEditingController _celularController = TextEditingController(text: '(11) 98765-4321');

  bool _isEditing = false; // Flag para saber se estamos editando ou não

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF802600),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Color(0xFFFFFFFF),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Perfil',
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Foto de Perfil
            Center(
              child: Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('assets/images/eu.jpg'), // Imagem carregada dos assets
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Nome
            _buildInfoField(label: 'Nome', controller: _nomeController),
            const SizedBox(height: 15),

            // Email
            _buildInfoField(label: 'Email', controller: _emailController),
            const SizedBox(height: 15),

            // Endereço
            _buildInfoField(label: 'Endereço', controller: _enderecoController),
            const SizedBox(height: 15),

            // Gênero
            _buildInfoField(label: 'Gênero', controller: _generoController),
            const SizedBox(height: 15),

            // CPF
            _buildInfoField(label: 'CPF', controller: _cpfController),
            const SizedBox(height: 15),

            // Celular
            _buildInfoField(label: 'Celular', controller: _celularController),
            const SizedBox(height: 20),

            // Botão Editar/Salvar
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_isEditing) {
                    // Salvar as alterações
                    // Aqui você pode incluir a lógica de salvar, como chamar uma API ou salvar localmente
                    print('Informações salvas');
                  }
                  // Alternar entre modo de edição e visualização
                  _isEditing = !_isEditing;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF802600),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(_isEditing 
                ? 'Salvar' 
                : 'Editar', style: const TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
            ),
          ],
        ),
      ),
    );
  }

  // Função auxiliar para criar os campos de texto
  Widget _buildInfoField({required String label, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      enabled: _isEditing, // Torna o campo editável apenas no modo de edição
      decoration: InputDecoration(
        labelText: label,
        hintText: 'Digite seu $label',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }
}
