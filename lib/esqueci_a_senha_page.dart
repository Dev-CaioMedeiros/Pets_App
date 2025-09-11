import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'confirmar_page.dart';
import 'utils/masks.dart';

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
                    child: Icon(Icons.lock_reset, size: 45, color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Esqueci minha senha",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade800,
                    ),
                  ),
                  SizedBox(height: 25),

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
                      filled: true,
                      fillColor: Colors.grey.shade100,
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
                      keyboardType: _selectedOption == "email"
                          ? TextInputType.emailAddress
                          : TextInputType.phone,
                      inputFormatters: _selectedOption == "sms"
                          ? [telefoneMask] // 👈 aqui aplica a máscara que vc já tem
                          : [],
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          _selectedOption == "email" ? Icons.email : Icons.phone,
                          color: Colors.teal,
                        ),
                        labelText: _selectedOption == "email"
                            ? "Digite seu E-mail"
                            : "Digite seu Telefone",
                        filled: true,
                        fillColor: Colors.grey.shade100,
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
                        elevation: 5,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Enviar código",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
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
