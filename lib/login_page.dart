import 'package:flutter/material.dart';
import 'cadastro_page.dart';
import 'esqueci_a_senha_page.dart'; // <-- importa a tela de esqueci senha

class LoginPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                    "Pets",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade800,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 30),

                  // Campo Email
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

                  // Campo Senha
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
                  SizedBox(height: 30),

                  // Botão Login
                  ElevatedButton(
                    onPressed: () {
                      // lógica de login aqui
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
                      "Entrar",
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Links
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
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.teal.shade800,
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
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.teal.shade800,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
