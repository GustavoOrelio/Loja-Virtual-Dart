import 'dart:io';
import 'dart:math';

void show() {
  var valorTotalComJuros = valorComJuros(valorProduto: 120.00, diasAtraso: 5);
  print("O valor a ser pago junto com juros é $valorTotalComJuros");
  var valorTotalComDesconto = valorComDesconto(120.00, 10);
  print("O valor com desconto é $valorTotalComDesconto");
  var bingo = geradorNumerosBingo();
  print("Os numeros sorteados para o bingo são $bingo");
  var valorFinal = valorFinalCompra(120, 5);
  print("Voce vai gastar um total de $valorFinal");
  var valorFrete = calcularValorFrete(valorCompra: 400);
  print(valorFrete);
  var quantidadeRemovida = removerProdutoCarrinho(quantidadeItenRemover: 5);
  print(quantidadeRemovida);
  var parcelasCartao = calcularParcelasCompra(1200, 5);
  print("O valor de cada parcela é $parcelasCartao reais");
}

void validarValor(double valor) {
  if (valor < 0) {
    throw Exception('Este valor deve ser positivo.');
  }
}

double valorComJuros(
    {required double valorProduto,
    required int diasAtraso,
    double percentualJurosDia = 1}) {
  validarValor(valorProduto);

  double totalJuros = diasAtraso * percentualJurosDia;
  return valorProduto + totalJuros;
}

double valorComDesconto(double valorProduto, double percentualDesconto) {
  validarValor(valorProduto);
  return valorProduto - percentualDesconto;
}

/*A função a seguir foi criado pensando em gerar numeros aleatorios para um bingo na qual os 
clientes que tiverem todos os numeros na cartela terão um desconto maior na proxima compra*/
String geradorNumerosBingo() {
  var gerar = Random();
  var bingo = new List.generate(12, (_) => gerar.nextInt(100));
  return "$bingo";
}

double valorFinalCompra(double valorProduto,
    [int quantidadeProdutoComprada = 1]) {
  validarValor(valorProduto);
  return valorProduto * quantidadeProdutoComprada;
}

String calcularValorFrete({required double valorCompra}) {
  validarValor(valorCompra);
  if (valorCompra > 500) {
    return "o Frete é Gratis";
  } else {
    return "O frete é 80 Reais";
  }
}

String removerProdutoCarrinho(
    {required int quantidadeItenRemover, int quantidadeItenCarrinho = 5}) {
  int remover = quantidadeItenCarrinho - quantidadeItenRemover;
  if (quantidadeItenRemover > quantidadeItenCarrinho) {
    return "Voçê não pode remover mais produtos do que possui no carrinho";
  } else {
    return "Voçê removeu $quantidadeItenRemover itens, agora possui $remover itens no carrinho";
  }
}

double calcularParcelasCompra(double valorTotal, int quantidadeParcelas) {
  double valorParcelas = valorTotal / quantidadeParcelas;
  return valorParcelas;
}

