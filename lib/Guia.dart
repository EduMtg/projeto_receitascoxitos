import 'package:flutter/material.dart';
import 'Inicio.dart';
import 'Favoritos.dart';

class Guia extends StatefulWidget {
  const Guia({super.key});

  @override
  State<Guia> createState() => _GuiaState();
}

class _GuiaState extends State<Guia> {
  int indice = 0;

  final List<Widget> telas = const [
    Inicio(),
    Favoritos(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: indice,
        children: telas,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: indice,
          onTap: (i) {
            setState(() {
              indice = i;
            });
          },
          backgroundColor: const Color(0xFF778873),
          selectedItemColor: const Color(0xFFFDF6ED),
          unselectedItemColor: Colors.white60,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explorar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoritos',
            ),
          ],
        ),
      ),
    );
  }
}