import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pet_page.dart';

class MeusPetsPage extends StatelessWidget {
  final List<Map<String, String>> pets = [
  {
    "nome": "Nico",
    "foto": "assets/nico.jpg",
    "tipo": "Cachorro",
    "idade": "1 ano",
    "cor": "Caramelo",
    "vacinas": "OK",
    "sexo": "Macho"
  },
  {
    "nome": "Preta",
    "foto": "assets/preta.jpg",
    "tipo": "Gato",
    "idade": "2 anos",
    "cor": "Preto",
    "vacinas": "Em dia",
    "sexo": "Fêmea"
  },
  {
    "nome": "Raulf",
    "foto": "assets/raulf.jpg",
    "tipo": "Cachorro",
    "idade": "3 anos",
    "cor": "Marrom",
    "vacinas": "OK",
    "sexo": "Macho"
  },
];

  @override
  Widget build(BuildContext context) {
    const brandBrown = Color(0xFF5F432B);
    const accentBeige = Color(0xFFF7E9C7);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 121, 103, 79),
              Color.fromARGB(255, 121, 103, 79),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          image: const DecorationImage(
            image: AssetImage("assets/paws_pattern.png"),
            repeat: ImageRepeat.repeat,
            fit: BoxFit.none,
            scale: 1,
            opacity: 0.25,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                child: Row(
                  children: [
                    // Botão voltar
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: accentBeige),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),

                    // Título
                    Text(
                      'Meus Pets',
                      style: GoogleFonts.quicksand(
                        color: accentBeige,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const Spacer(),

                    // Avatar usuário
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: brandBrown),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Lista de pets
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: pets.length + 1,
                  itemBuilder: (context, index) {
                    if (index == pets.length) {
                      // Card para cadastrar novo pet (centralizado)
                      return Center(
                        child: _PetCard(
                          isNew: true,
                          brandBrown: brandBrown,
                          accentBeige: accentBeige,
                          onTap: () {},
                        ),
                      );
                    }

                    final pet = pets[index];
                    return _PetCard(
                      nome: pet["nome"]!,
                      foto: pet["foto"]!,
                      tipo: pet["tipo"]!,
                      brandBrown: brandBrown,
                      accentBeige: accentBeige,
 onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PetPage(
        nome: pet["nome"]!,
        foto: pet["foto"]!,
        tipo: pet["tipo"]!,
        idade: pet["idade"]!,
        cor: pet["cor"]!,
        vacinas: pet["vacinas"]!, 
        sexo: pet["sexo"]!,
      ),
    ),
  );
},
                    );
                  },
                ),
              ),  

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class _PetCard extends StatelessWidget {
  final String? nome;
  final String? foto;
  final String? tipo;
  final VoidCallback onTap;
  final Color brandBrown;
  final Color accentBeige;
  final bool isNew;

  const _PetCard({
    this.nome,
    this.foto,
    this.tipo,
    required this.onTap,
    required this.brandBrown,
    required this.accentBeige,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isNew) {
      // Apenas o botão circular de adicionar
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: accentBeige,
            child: Icon(
              Icons.add,
              size: 36,
              color: brandBrown.withOpacity(0.8),
            ),
          ),
        ),
      );
    }

    // Card normal de pet
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 38,
                  backgroundColor: accentBeige,
                  backgroundImage: AssetImage(foto ?? "assets/pet.png"),
                ),
                const SizedBox(width: 18),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nome ?? "",
                        style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: brandBrown,
                        ),
                      ),
                      Text(
                        tipo ?? "",
                        style: GoogleFonts.quicksand(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: brandBrown.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),

                Icon(Icons.pets, color: brandBrown, size: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
