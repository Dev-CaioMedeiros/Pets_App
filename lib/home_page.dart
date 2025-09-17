import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // cores reaproveitadas
    const bgBrown = Color(0xFF7A5E3E);
    const brandBrown = Color(0xFF5F432B);
    const accentBeige = Color(0xFFF7E9C7);

    final items = [
      _MenuItem(icon: Icons.pets, label: 'Meus Pets', onTap: () {}),
      _MenuItem(icon: Icons.directions_walk, label: 'Últimos passeios', onTap: () {}),
      _MenuItem(icon: Icons.medical_services, label: 'Consultas', onTap: () {}),
      _MenuItem(icon: Icons.storefront, label: 'Pet Shop', onTap: () {}),
    ];

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
    child: SafeArea(
      child: Column(
            children: [
              // Topo com logo + avatar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                child: Row(
                  children: [
                    Text('PetFy',
                        style: GoogleFonts.quicksand(
                            color: accentBeige,
                            fontSize: 32,
                            fontWeight: FontWeight.w800)),
                    const Spacer(),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: brandBrown),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Saudação
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Seja bem vindo de volta! \nGerencie seus pets com maior facilidade',
                        style: GoogleFonts.quicksand(
                            color: Colors.white.withOpacity(0.95),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 26),

              // Grid centralizado
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: GridView.count(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      crossAxisCount: 2,
                      crossAxisSpacing: 22,
                      mainAxisSpacing: 22,
                      childAspectRatio: 0.95,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: items
                          .map((i) => _ActionCard(
                                icon: i.icon,
                                label: i.label,
                                onTap: i.onTap,
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              // footer
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Text('PetFy • Seu app de cuidados para pets',
                    style: GoogleFonts.quicksand(
                        color: Colors.white70, fontSize: 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  _MenuItem({required this.icon, required this.label, required this.onTap});
}

class _ActionCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionCard(
      {required this.icon, required this.label, required this.onTap});

  @override
  State<_ActionCard> createState() => _ActionCardState();
}

class _ActionCardState extends State<_ActionCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    const brandBrown = Color(0xFF5F432B);

    return AnimatedScale(
      scale: _pressed ? 0.95 : 1.0,
      duration: const Duration(milliseconds: 120),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) {
          setState(() => _pressed = false);
          widget.onTap();
        },
        onTapCancel: () => setState(() => _pressed = false),
        child: Material(
          color: Colors.white,
          elevation: 8,
          borderRadius: BorderRadius.circular(18),
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: widget.onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 84,
                    height: 84,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                          colors: [Colors.white, Color(0xFFF3E6CE)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(widget.icon, size: 36, color: brandBrown),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(widget.label,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: brandBrown)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
