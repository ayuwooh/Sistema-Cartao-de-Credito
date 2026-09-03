import 'dart:io';
import 'modelos/compra.dart';
import 'modelos/cartao_de_credito.dart';
import 'servicos/servico_de_compra.dart';

void main() {
  print('=== Sistema de Controle de Compras ===');
  stdout.write('Informe o limite do cartão: ');
  double limite = double.parse(stdin.readLineSync()!);
  CartaoDeCredito cartao = CartaoDeCredito(limite: limite);
  ServicoDeCompra servico = ServicoDeCompra(cartao);

  while (true) {
    mostrarMenu();
    String opcao = stdin.readLineSync()!;
    switch (opcao) {
      case '1':
        stdout.write('Descricao: ');
        String descricao = stdin.readLineSync()!;

        stdout.write('Valor: ');
        double valor = double.parse(stdin.readLineSync()!);

        try {
          Compra compra = Compra(descricao: descricao, valor: valor);
          bool aprovada = servico.realizarCompra(cartao, compra);
          if (aprovada) {
            print('Compra aprovada!');
          } else {
            print('Compra recusada: saldo insuficiente.');
          }
        } on ArgumentError catch (e) {
          print('Erro: ${e.message}');
        }
        break;
      case '2':
        print('=== Dados do Cartão ===');
        print('Limite: ${cartao.limite}');
        print('Valor utilizado: ${cartao.valorUtilizado}');
        print('Saldo disponível: ${cartao.saldoDisponivel}');
        print('Quantidade de compras: ${cartao.quantidadeCompras}');
        break;
      case '3':
        if (cartao.comprasOrdenadas.isEmpty) {
          print('Nenhuma compra realizada.');
        } else {
          print('=== Compras (por valor) ===');
          for (Compra compra in cartao.comprasOrdenadas) {
            print('${compra.descricao} - R\$ ${compra.valor}');
          }
        }
        break;
      case '4':
        print('Encerrando o sistema.');
        return;
    }
  }
}