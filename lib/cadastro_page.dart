import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class CadastroPage extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cpfController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Máscaras
  final phoneMask = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final cpfMask = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade900, Colors.blueGrey.shade700],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          image: DecorationImage(
            image: AssetImage("assets/paws_pattern.png"),
            repeat: ImageRepeat.repeat,
            fit: BoxFit.none,
            scale: 1,
            opacity: 0.08,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.pets, size: 45, color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Cadastro",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade800,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 30),

                  // Nome
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.teal),
                      labelText: "Nome",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Email
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.teal),
                      labelText: "E-mail",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Telefone com máscara
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [phoneMask],
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone, color: Colors.teal),
                      labelText: "Telefone",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // CPF com máscara
                  TextField(
                    controller: _cpfController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [cpfMask],
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.badge, color: Colors.teal),
                      labelText: "CPF",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Senha
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.teal),
                      labelText: "Senha",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Confirmar Senha
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline, color: Colors.teal),
                      labelText: "Confirmar Senha",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  // Botão Cadastrar
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Cadastro realizado com sucesso!")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Voltar ao Login
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Já tenho conta",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
