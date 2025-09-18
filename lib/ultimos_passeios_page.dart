import 'package:flutter/material.dart';

class UltimosPasseiosPage extends StatelessWidget {
  const UltimosPasseiosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Últimos Passeios")),
      body: const Center(
        child: Text(
          "Aqui ficarão os últimos passeios",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
