import 'package:campo_minado/components/campo_wdget.dart';
import 'package:flutter/material.dart';
import '../models/campo.dart';
import '../models/tabuleiro.dart';

class TabuleiroWidget extends StatelessWidget {

  final Tabuleiro tabuleiro;
  final void Function(Campo) onAbriir;
  final void Function(Campo) onAlternarMarcacao;

  TabuleiroWidget ({
    @required this.tabuleiro,
    @required this.onAbriir,
    @required this.onAlternarMarcacao,
  });


@override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos.map((c){
          return CampoWidget(
             campo: c,
             onAbriir:  onAbriir,
             onAlternarMarcacao: onAlternarMarcacao,
          );
      }).toList(),
      ),
    );
  }
}
