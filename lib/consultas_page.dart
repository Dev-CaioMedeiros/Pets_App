import 'package:flutter/material.dart';

class ConsultasPage extends StatelessWidget {
  const ConsultasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Consultas")),
      body: const Center(
        child: Text(
          "Aqui ficarão as consultas marcadas",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
