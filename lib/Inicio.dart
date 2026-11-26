import 'package:flutter/material.dart';
import 'Receita.dart';
import 'ApiReceitas.dart';
import 'ListaReceitas.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key, required this.favoritos, required this.aoFavoritar});

  final List<Receita> favoritos;
  final void Function(Receita) aoFavoritar;

  @override
  State<Inicio> createState() => _PesquisaState();
}

class _PesquisaState extends State<Inicio> {
  final nome = TextEditingController();
  String? mensagemErro;

  List<Receita> receitas = [];
  bool carregando = false;
  String? erroApi;
  String? termoBuscado;

  @override
  void initState() {
    super.initState();
    carregar(null);
  }

  Future<void> carregar(String? termo) async {
    if (carregando) return;

    setState(() {
      carregando = true;
      erroApi = null;
    });

    try {
      List<Receita> resultado;
      if (termo == null) {
        resultado = await ApiReceitas.listar();
      } else {
        resultado = await ApiReceitas.pesquisar(termo);
      }

      if (!mounted) return;
      setState(() {
        receitas = resultado;
        termoBuscado = termo;
        carregando = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        erroApi = e.toString().replaceFirst('Exception: ', '');
        termoBuscado = termo;
        carregando = false;
      });
    }
  }

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

    carregar(nome.text.trim());
  }

  void limpar() {
    nome.clear();
    setState(() {
      mensagemErro = null;
    });
    carregar(null);
  }

  @override
  void dispose() {
    nome.dispose();
    super.dispose();
  }

  Widget corpo() {
    if (carregando) {
      return const Center(child: CircularProgressIndicator());
    }

    if (erroApi != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(erroApi!, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => carregar(termoBuscado),
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF778873),
              ),
              child: const Text("Tentar novamente"),
            ),
          ],
        ),
      );
    }

    if (receitas.isEmpty) {
      return Center(
        child: Text(
          termoBuscado == null
              ? "Nenhuma receita disponível."
              : 'Nenhuma receita encontrada para "$termoBuscado".',
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListaReceitas(
      receitas: receitas,
      favoritos: widget.favoritos,
      aoFavoritar: widget.aoFavoritar,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Padding(
        padding: const EdgeInsets.all(18),
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
            const SizedBox(height: 12),
            Row(
              children: [
                FilledButton(
                  onPressed: carregando ? null : pesquisar,
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF778873),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 14,
                    ),
                  ),
                  child: const Text("Pesquisar"),
                ),
                const SizedBox(width: 12),
                if (termoBuscado != null)
                  OutlinedButton(
                    onPressed: carregando ? null : limpar,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF778873),
                      side: const BorderSide(color: Color(0xFF778873)),
                    ),
                    child: const Text("Limpar"),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(child: corpo()),
          ],
        ),
      ),
    );
  }
}