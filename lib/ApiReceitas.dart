import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Receita.dart';

class ApiReceitas {
  static Future<List<Receita>> listar() {
    return buscar(Uri.https('dummyjson.com', '/recipes', {'limit': '0'}));
  }

  static Future<List<Receita>> pesquisar(String nome) {
    return buscar(Uri.https('dummyjson.com', '/recipes/search', {'q': nome}));
  }

  static Future<List<Receita>> buscar(Uri url) async {
    http.Response resposta;

    try {
      resposta = await http.get(url).timeout(const Duration(seconds: 10));
    } catch (e) {
      throw Exception('Não foi possível conectar. Verifique sua internet.');
    }

    if (resposta.statusCode != 200) {
      throw Exception('Erro (${resposta.statusCode}).');
    }

    try {
      final dados = jsonDecode(resposta.body);
      final lista = dados['recipes'] as List;
      return lista.map((item) => Receita.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Os dados em formato inesperado.');
    }
  }
}