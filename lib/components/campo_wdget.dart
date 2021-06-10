import '../models/campo.dart';
import 'package:flutter/material.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final void Function(Campo) onAbriir;
  final void Function(Campo) onAlternarMarcacao;

  CampoWidget({
    @required this.campo,
    @required this.onAbriir,
    @required this.onAlternarMarcacao,
  });

  _getImage() {
    int qtdMinas = campo.qtdDeMinasNaVizinhanca;
    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset("assets/images/bomba_0.jpeg");
    } else if (campo.aberto && campo.minado) {
      return Image.asset("assets/images/bomba_1.jpeg");
    } else if (campo.aberto) {
      return Image.asset("assets/images/aberto_$qtdMinas.jpeg");
    } else if (campo.marcado) {
      return Image.asset("assets/images/bandeira.jpeg");
    } else {
      return Image.asset("assets/images/fechado.jpeg");
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbriir(campo),
      onLongPress: () => onAlternarMarcacao(campo),
      child: _getImage(),
    );
  }
}
