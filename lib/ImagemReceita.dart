import 'package:flutter/material.dart';

class ImagemReceita extends StatelessWidget {
  const ImagemReceita({
    super.key,
    required this.url,
    required this.largura,
    required this.altura,
  });

  final String? url;
  final double largura;
  final double altura;

  Widget semImagem() {
    return Container(
      width: largura,
      height: altura,
      color: const Color(0xFFDCCFC0),
      child: const Icon(Icons.restaurant, color: Color(0xFF778873)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return semImagem();
    }

    return Image.network(
      url!,
      width: largura,
      height: altura,
      fit: BoxFit.cover,
      errorBuilder: (context, erro, pilha) => semImagem(),
    );
  }
}