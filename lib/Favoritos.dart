import 'package:flutter/material.dart';

class Favoritos extends StatelessWidget {
  const Favoritos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6ED),
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: false,
        titleSpacing: 12,
        title: const Text(
          "Coxitos",
          style: TextStyle(
            color: Color(0xFFFDF6ED),
            fontSize: 38,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: const Color(0xFF778873),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset(
              'assets/LogoCoxitos.png',
              height: 80,
            ),
          ),
        ],
      ),
      body: const Center(child: Text("Nenhuma receita favoritada ainda")),
    );
  }
}