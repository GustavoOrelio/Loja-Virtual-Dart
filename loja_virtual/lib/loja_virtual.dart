import 'dart:io';
import 'dart:math';

void show() {
  var valorTotalComJuros = valorComJuros(valorProduto: 120.00, diasAtraso: 5);
  print("O valor a ser pago junto com juros é $valorTotalComJuros");
  var valorTotalComDesconto = valorComDesconto(120.00, 10);
  print("O valor com desconto é $valorTotalComDesconto");
  geradorNumerosBingo();
  var valorFinal = valorFinalCompra(120, 5);
  print("Voce vai gastar um total de $valorFinal");
  var valorFrete = calcularValorFrete(valorCompra: 400);
  print("$valorFrete");
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
void geradorNumerosBingo() {
  var gerar = Random();
  var bingo = new List.generate(12, (_) => gerar.nextInt(100));
  print(
      "Foi gerado os numeros a seguir para preencher a cartela de bingo para obter um desconto maior na proxima compra:  $bingo");
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
