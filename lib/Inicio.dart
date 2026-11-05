import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _PesquisaState();
}

class _PesquisaState extends State<Inicio> {
  final nome = TextEditingController();
  String? mensagemErro;

  void validarPesquisa(String pesquisa) {
    setState(() {
      if (pesquisa.trim().isEmpty) {
        mensagemErro = "Informe a receita!";
      } else if (pesquisa.trim().length < 3) {
        mensagemErro = "Informe ao menos 3 caracteres!";
      } else {
        mensagemErro = null;
      }
    });
  }

  void pesquisar() {
    validarPesquisa(nome.text);
    if (mensagemErro != null) return;

    final texto = nome.text.trim();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Pesquisa: $texto")));
    nome.clear();
  }

  @override
  void dispose() {
    nome.dispose();
    super.dispose();
  }

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
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDCCFC0)),
                ),
                child: TextField(
                  controller: nome,
                  decoration: InputDecoration(
                    labelText: "Buscar receita pelo nome:",
                    errorText: mensagemErro,
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: validarPesquisa,
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: pesquisar,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF778873),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                ),
                child: Text("Pesquisar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
