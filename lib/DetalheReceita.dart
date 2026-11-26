import 'package:flutter/material.dart';
import 'Receita.dart';
import 'ImagemReceita.dart';

class DetalheReceita extends StatefulWidget {
  const DetalheReceita({
    super.key,
    required this.receita,
    required this.favorita,
    required this.aoFavoritar,
  });

  final Receita receita;
  final bool favorita;
  final void Function(Receita) aoFavoritar;

  @override
  State<DetalheReceita> createState() => _DetalheReceitaState();
}

class _DetalheReceitaState extends State<DetalheReceita> {
  late bool favorita;

  @override
  void initState() {
    super.initState();
    favorita = widget.favorita;
  }

  @override
  Widget build(BuildContext context) {
    final receita = widget.receita;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF6ED),
      appBar: AppBar(
        backgroundColor: const Color(0xFF778873),
        foregroundColor: const Color(0xFFFDF6ED),
        title: Text(receita.nome, maxLines: 1, overflow: TextOverflow.ellipsis),
        actions: [
          IconButton(
            icon: Icon(favorita ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              widget.aoFavoritar(receita);
              setState(() {
                favorita = !favorita;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ImagemReceita(
                url: receita.imagem,
                largura: double.infinity,
                altura: 220,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              receita.nome,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF778873),
              ),
            ),
            const SizedBox(height: 8),

            if (receita.mealType.isNotEmpty)
              Text('Refeição: ${receita.mealType.join(', ')}'),
            if (receita.prepTimeMinutes != null)
              Text('Preparo: ${receita.prepTimeMinutes} min'),
            if (receita.cookTimeMinutes != null)
              Text('Cozimento: ${receita.cookTimeMinutes} min'),
            if (receita.servings != null && receita.servings! > 0)
              Text('Porções: ${receita.servings}'),
            if (receita.rating != null) Text('Avaliação: ${receita.rating}'),

            const SizedBox(height: 20),
            const Text(
              'Ingredientes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (receita.ingredientes.isEmpty)
              const Text('Ingredientes não informados.'),
            for (final item in receita.ingredientes) Text('• $item'),

            const SizedBox(height: 20),
            const Text(
              'Modo de preparo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (receita.instrucoes.isEmpty)
              const Text('Instruções não informadas.'),
            for (int i = 0; i < receita.instrucoes.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text('${i + 1}. ${receita.instrucoes[i]}'),
              ),
          ],
        ),
      ),
    );
  }
}