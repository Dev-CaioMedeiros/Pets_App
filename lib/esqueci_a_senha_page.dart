import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'confirmar_page.dart';

class EsqueciSenhaPage extends StatefulWidget {
  @override
  _EsqueciSenhaPageState createState() => _EsqueciSenhaPageState();
}

class _EsqueciSenhaPageState extends State<EsqueciSenhaPage> {
  String? _selectedOption;
  final _controller = TextEditingController();

  final telefoneMask = MaskTextInputFormatter(
    mask: '(##) #####-####',
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
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: const Color.fromARGB(255, 105, 90, 47),
                        child: Icon(Icons.lock_reset, size: 45, color: Colors.white),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Esqueci minha senha",
                        style: GoogleFonts.quicksand(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 90, 70, 40),
                        ),
                      ),
                      SizedBox(height: 25),

                      DropdownButtonFormField<String>(
  value: _selectedOption,
  dropdownColor: Colors.brown[700], // fundo do menu suspenso
  iconEnabledColor: Colors.white,  // cor da setinha
  style: GoogleFonts.quicksand(
    color: Colors.white, // cor do texto selecionado
    fontSize: 16,
  ),
  items: [
    DropdownMenuItem(
      value: "email",
      child: Text(
        "Receber por E-mail",
        style: GoogleFonts.quicksand(color: Colors.white),
      ),
    ),
    DropdownMenuItem(
      value: "sms",
      child: Text(
        "Receber por SMS",
        style: GoogleFonts.quicksand(color: Colors.white),
      ),
    ),
  ],
  decoration: InputDecoration(
    labelText: "Escolha uma opção",
    labelStyle: GoogleFonts.quicksand(color: Colors.white),
    filled: true,
    fillColor: Colors.white.withOpacity(0.2),
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
  style: GoogleFonts.quicksand(
    color: Colors.white, // cor do texto digitado
  ),
  decoration: InputDecoration(
    prefixIcon: Icon(
      _selectedOption == "email" ? Icons.email : Icons.phone,
      color: Colors.white, // ícone branco também
    ),
    labelText: _selectedOption == "email"
        ? "Digite seu E-mail"
        : "Digite seu Telefone",
    labelStyle: GoogleFonts.quicksand(color: Colors.white),
    hintStyle: GoogleFonts.quicksand(color: Colors.white70),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white70),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
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
                            backgroundColor: const Color.fromARGB(255, 105, 90, 47),
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Enviar código",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
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
