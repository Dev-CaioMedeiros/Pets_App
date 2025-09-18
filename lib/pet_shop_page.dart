import 'package:flutter/material.dart';

class PetShopPage extends StatelessWidget {
  const PetShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pet Shop")),
      body: const Center(
        child: Text(
          "Aqui ficará o Pet Shop",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
