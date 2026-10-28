import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6ED),
      appBar: AppBar(
        title: const Text(
          "Coxitos",
          style: TextStyle(
            color: Color(0xFFFDF6ED),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: const Color(0xFF778873),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Receitas',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF778873),
                ),
              ),
              SizedBox(height: 12),
              const Text(
                "Pesquise uma receita pelo nome:",
                style: TextStyle(fontSize: 16, color: Color(0xFF5C4033)),
              ),
              const SizedBox(height: 12),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDCCFC0)),
                ),
                child: Text(
                  'Buscar pelo nome',
                  style: TextStyle(fontSize: 14, color: Color(0xFF5C4033)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
