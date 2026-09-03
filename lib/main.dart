import 'dart:io';
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
        String descricao = (stdin.readLineSync()!);

        try {
          bool aprovada = servico.realizarCompra(descricao: descricao, valor: valor);
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
    }
  }
}