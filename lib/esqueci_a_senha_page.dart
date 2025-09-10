import 'package:flutter/material.dart';
import 'confirmar_page.dart';

class EsqueciSenhaPage extends StatefulWidget {
  @override
  _EsqueciSenhaPageState createState() => _EsqueciSenhaPageState();
}

class _EsqueciSenhaPageState extends State<EsqueciSenhaPage> {
  String? _selectedOption; // email ou sms
  final _controller = TextEditingController();

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
                  Icon(Icons.lock_reset, size: 60, color: Colors.teal),
                  SizedBox(height: 16),
                  Text(
                    "Esqueci minha senha",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade800,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Escolha do método
                  DropdownButtonFormField<String>(
                    value: _selectedOption,
                    items: [
                      DropdownMenuItem(
                        value: "email",
                        child: Text("Receber por E-mail"),
                      ),
                      DropdownMenuItem(
                        value: "sms",
                        child: Text("Receber por SMS"),
                      ),
                    ],
                    decoration: InputDecoration(
                      labelText: "Escolha uma opção",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value;
                        _controller.clear();
                      });
                    },
                  ),
                  SizedBox(height: 20),

                  if (_selectedOption != null) ...[
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          _selectedOption == "email" ? Icons.email : Icons.phone,
                          color: Colors.teal,
                        ),
                        labelText: _selectedOption == "email"
                            ? "Digite seu E-mail"
                            : "Digite seu Telefone",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ConfirmarPage(
                              metodo: _selectedOption!,
                              valor: _controller.text,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Enviar código"),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
