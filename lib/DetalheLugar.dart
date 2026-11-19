import 'package:flutter/material.dart';
import 'Lugar.dart';

class Detalhelugar extends StatelessWidget {
  const Detalhelugar({super.key, required this.lugar});
  final Lugar lugar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lugar.nome)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(lugar.descricao),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}