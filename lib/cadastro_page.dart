import 'dart:ui'; // necessário para o BackdropFilter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:google_fonts/google_fonts.dart';

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
            colors: [
              const Color.fromARGB(255, 121, 103, 79),
              const Color.fromARGB(255, 121, 103, 79),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          image: DecorationImage(
            image: AssetImage("assets/paws_pattern.png"),
            repeat: ImageRepeat.repeat,
            fit: BoxFit.none,
            scale: 1,
            opacity: 0.30,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.4),
                      width: 1,
                    ),
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
                        backgroundColor: const Color.fromARGB(255, 105, 90, 47),
                        child: Icon(Icons.pets, size: 45, color: Colors.white),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Cadastro",
                        style: GoogleFonts.quicksand(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 90, 70, 40),
                          letterSpacing: 1.0,
                        ),
                      ),
                      SizedBox(height: 30),

                      // Nome
                      _buildInputField(
                        controller: _nameController,
                        icon: Icons.person,
                        label: "Nome",
                      ),
                      SizedBox(height: 20),

                      // Email
                      _buildInputField(
                        controller: _emailController,
                        icon: Icons.email,
                        label: "E-mail",
                      ),
                      SizedBox(height: 20),

                      // Telefone
                      _buildInputField(
                        controller: _phoneController,
                        icon: Icons.phone,
                        label: "Telefone",
                        inputFormatters: [phoneMask],
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 20),

                      // CPF
                      _buildInputField(
                        controller: _cpfController,
                        icon: Icons.badge,
                        label: "CPF",
                        inputFormatters: [cpfMask],
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20),

                      // Senha
                      _buildInputField(
                        controller: _passwordController,
                        icon: Icons.lock,
                        label: "Senha",
                        obscure: true,
                      ),
                      SizedBox(height: 20),

                      // Confirmar Senha
                      _buildInputField(
                        controller: _confirmPasswordController,
                        icon: Icons.lock_outline,
                        label: "Confirmar Senha",
                        obscure: true,
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
                          backgroundColor: const Color.fromARGB(255, 105, 90, 47),
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          "Cadastrar",
                          style: GoogleFonts.quicksand(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.0,
                          ),
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
                          style: GoogleFonts.quicksand(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 90, 70, 40),
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget helper para não repetir código
  Widget _buildInputField({
    required TextEditingController controller,
    required IconData icon,
    required String label,
    bool obscure = false,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
  }) {
    return TextField(
      style: GoogleFonts.quicksand(
      color: Colors.white,
        ),
      controller: controller,
      obscureText: obscure,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color.fromARGB(255, 90, 70, 40)),
        labelText: label,
        labelStyle: GoogleFonts.quicksand(
          color: const Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.w600,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
