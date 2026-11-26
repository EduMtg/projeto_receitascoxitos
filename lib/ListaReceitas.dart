import 'package:flutter/material.dart';
import 'Receita.dart';
import 'ImagemReceita.dart';
import 'DetalheReceita.dart';

class ListaReceitas extends StatelessWidget {
  const ListaReceitas({
    super.key,
    required this.receitas,
    required this.favoritos,
    required this.aoFavoritar,
  });

  final List<Receita> receitas;
  final List<Receita> favoritos;
  final void Function(Receita) aoFavoritar;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: receitas.length,
      itemBuilder: (context, i) {
        final receita = receitas[i];
        final favorita = favoritos.any((f) => f.id == receita.id);

        return Card(
          color: Colors.white,
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImagemReceita(url: receita.imagem, largura: 60, altura: 60),
            ),
            title: Text(
              receita.nome,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF5C4033),
              ),
            ),
            subtitle: receita.mealType.isEmpty
                ? null
                : Text(receita.mealType.join(', ')),
            trailing: favorita
                ? const Icon(Icons.favorite, color: Colors.red)
                : const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetalheReceita(
                    receita: receita,
                    favorita: favorita,
                    aoFavoritar: aoFavoritar,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}