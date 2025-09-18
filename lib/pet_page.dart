import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PetPage extends StatefulWidget {
  final String nome;
  final String foto;
  final String tipo;
  final String idade;
  final String cor;
  final String vacinas;
  final String sexo;

  const PetPage({
    super.key,
    required this.nome,
    required this.foto,
    required this.tipo,
    required this.idade,
    required this.cor,
    required this.vacinas,
    required this.sexo,
  });

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  // cores
  static const brandBrown = Color(0xFF5F432B);
  static const accentBeige = Color(0xFFF7E9C7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brandBrown,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, color: accentBeige),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Dados do Pet',
                          style: GoogleFonts.quicksand(
                            color: accentBeige,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              // foto
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: accentBeige, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(widget.foto),
                ),
              ),
              const SizedBox(height: 12),

              Text(
                widget.nome,
                style: GoogleFonts.quicksand(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: accentBeige,
                ),
              ),
              const SizedBox(height: 20),

              // Card com infos
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    _rowInfo('Idade', widget.idade),
                    _rowInfo('Cor', widget.cor),
                    _rowInfo('Raça', widget.tipo),
                    _rowInfo('Vacinas', widget.vacinas),
                    _rowInfo('Sexo', widget.sexo),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentBeige,
                  foregroundColor: brandBrown,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 4,
                ),
                onPressed: () {
                  // TODO: implementar edição
                },
                child: Text(
                  'Editar Dados',
                  style: GoogleFonts.quicksand(fontWeight: FontWeight.w700),
                ),
              ),

              const SizedBox(height: 28),

              Text(
                'Mais Informações',
                style: GoogleFonts.quicksand(
                  color: accentBeige,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),

              Wrap(
                spacing: 14,
                runSpacing: 14,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: accentBeige),
                      foregroundColor: accentBeige,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    onPressed: () {
                      // TODO: abrir tela de vacinas
                    },
                    child: Text('VACINAS',
                        style: GoogleFonts.quicksand(fontWeight: FontWeight.w700)),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: accentBeige),
                      foregroundColor: accentBeige,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    onPressed: () {
                      // TODO: abrir tela de pet shop
                    },
                    child: Text('PET SHOP',
                        style: GoogleFonts.quicksand(fontWeight: FontWeight.w700)),
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: GoogleFonts.quicksand(
                color: brandBrown,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              )),
          Text(value,
              style: GoogleFonts.quicksand(
                color: brandBrown,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }
}
