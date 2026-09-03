class Compra implements Comparable<Compra> {
  final String _descricao;
  final double _valor;

  Compra({required String descricao, required double valor}){
    if (descricao.trim().isEmpty) {
    throw ArgumentError('Descrição não pode ser vazia');
    }
    if (valor <= 0) {
      throw ArgumentError('Valor deve ser maior que zero');
    }
    _descricao = descricao;
    _valor = valor;
  }

  String get descricao => _descricao;
  double get valor => _valor;

  @override
  int compareTo(Compra outra) => _valor.compareTo(outra._valor);
}
