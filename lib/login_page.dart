import 'dart:ui'; // necessário para o ImageFilter
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cadastro_page.dart';
import 'esqueci_a_senha_page.dart';

class LoginPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Fundo com gradiente e padrão de patas
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
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12), // efeito fosco
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 13),
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

                      // Logo
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: const Color.fromARGB(255, 105, 90, 47),
                        child: Icon(Icons.pets, size: 45, color: Colors.white),
                      ),
                      SizedBox(height: 16),

                      // Título
                      Text(
                        "PetFy",
                        style: GoogleFonts.quicksand(
                          fontSize: 70,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 90, 70, 40),
                          letterSpacing: 1.0,
                        ),
                      ),
                      SizedBox(height: 30),

                      // Campo Email
                      TextField(
                        controller: _emailController,
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: const Color.fromARGB(255, 90, 70, 40),
                          ),
                          labelText: "E-mail",
                          labelStyle: GoogleFonts.quicksand(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w600,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Campo Senha
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: const Color.fromARGB(255, 90, 70, 40),
                          ),
                          labelText: "Senha",
                          labelStyle: GoogleFonts.quicksand(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w600,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      // Botão Login
                      ElevatedButton(
                        onPressed: () {
                          // lógica de login aqui
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
                          "Entrar",
                          style: GoogleFonts.quicksand(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Links (Cadastro e Esqueci senha)
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CadastroPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Cadastro de Usuário",
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(255, 90, 70, 40),
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EsqueciSenhaPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Esqueci minha senha",
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
}
