import 'package:flutter/foundation.dart';
import 'explosao_exception.dart';

class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];

  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  Campo({
    @required this.linha,
    @required this.coluna,
  });
  void addVizinho(Campo vizinho) {
    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();

    if (deltaLinha == 0 && deltaColuna == 0) {
      return;
    }
    if (deltaLinha <= 1 && deltaColuna <= 1) {
      vizinhos.add(vizinho);
    }
  }

  void abrir() {
    if (_aberto) {
      return;
    }

    _aberto = true;

    if (_minado) {
      _explodido = true;
      throw ExplosaoException();
    }
    if (vizinhancaSegura) {
      vizinhos.forEach((v) => v.abrir());
    }
  }

  void revelarBombas() {
    if (_minado) {
      _aberto = true;
    }
  }

  void reiniciiar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }

  void minar() {
    _minado = true;
  }

  void alternarMarcacao() {
    _marcado = !_marcado;
  }

  bool get minado {
    return _minado;
  }

  bool get explodido{
    return _explodido;
  }

  bool get aberto{
    return _aberto;
  }

  bool get marcado{
    return _marcado;
  }

  bool get resolvido {
    bool minadoEmarcado = minado && marcado;
    bool seguroEaberto = !minado && aberto;
    return minadoEmarcado || seguroEaberto;
  }

  bool get vizinhancaSegura {
    return vizinhos.every((v) => !v._minado);
  }

  int get qtdDeMinasNaVizinhanca{
    return vizinhos.where((v)=>v.minado).length;
  }
}
