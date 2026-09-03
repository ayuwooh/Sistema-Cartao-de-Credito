import 'modelos/compra.dart';

class CartaoDeCredito {
  final double _limite;
  double _saldoDisponivel;
  final List<Compra> _compras = [];

  CartaoDeCredito({required double limite}) {
    if (limite <= 0) {
      throw ArgumentError('Limite deve ser maior que zero');
    }
    _limite = limite;
    _saldoDisponivel = limite;
  }

  double get limite => _limite;
  double get saldoDisponivel => _saldoDisponivel;

  double get valorUtilizado => _limite - _saldoDisponivel;
  int get quantidadeCompras => _compras.length;

  bool comprar(Compra compra) {
    if (compra.valor > _saldoDisponivel) {
      return false;
    }
    _saldoDisponivel -= compra.valor;
    _compras.add(compra);
    return true;
  }

  List<Compra> get comprasOrdenadas {
    final lista = [..._compras];
    lista.sort();
    return lista;
  }
}