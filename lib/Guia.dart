import 'package:flutter/material.dart';
import 'Receita.dart';
import 'Inicio.dart';
import 'Favoritos.dart';

class Guia extends StatefulWidget {
  const Guia({super.key});

  @override
  State<Guia> createState() => _GuiaState();
}

class _GuiaState extends State<Guia> {
  int indice = 0;
  List<Receita> favoritos = [];

  void alternarFavorito(Receita receita) {
    setState(() {
      final posicao = favoritos.indexWhere((f) => f.id == receita.id);
      if (posicao == -1) {
        favoritos.add(receita);
      } else {
        favoritos.removeAt(posicao);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: indice,
        children: [
          Inicio(favoritos: favoritos, aoFavoritar: alternarFavorito),
          Favoritos(favoritos: favoritos, aoFavoritar: alternarFavorito),
        ],
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