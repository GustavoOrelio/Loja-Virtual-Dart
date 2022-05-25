import 'dart:math';

void show() {
  var valorTotalComJuros = valorComJuros(valorProduto: 120.00, diasAtraso: 5);
  print("O valor a ser pago junto com juros é $valorTotalComJuros");
  var valorTotalComDesconto = valorComDesconto(120.00, 10);
  print("O valor com desconto é $valorTotalComDesconto");
  var valorFinal = valorFinalCompra(120, 5);
  print("Voce vai gastar um total de $valorFinal");
  var valorFrete = calcularValorFrete(valorCompra: 400);
  print(valorFrete);
  var quantidadeRemovida = removerProdutoCarrinho(quantidadeItenRemover: 5);
  print(quantidadeRemovida);
  var parcelasCartao = calcularValorParcelaCompra(
      valorTotal: 1200,
      quantidadeParcelas: 5,
      diasAtraso: 10,
      jurosAtrasoPorDia: 0.10);
  print("O valor de cada parcela é $parcelasCartao reais\n");

  //Funções para os admistradores da loja calcular o lucro de vendas
  print("***Esses dados aparecerá apenas para os admistradores***");
  var lucroBruto = margemLucroBrutoMensal(
      valorTotalProdutosVendidos: 20000, valorTotalGastosComProdutos: 14000);
  print("A margem de lucro bruto do mes é $lucroBruto%");
  var lucroPorProduto = margemLucroBrutoMensal(
      valorTotalProdutosVendidos: 300, valorTotalGastosComProdutos: 150);
  print("A margem de lucro do produto é $lucroPorProduto%");
  var precoVenda = calcularPrecoVendaProduto(150);
  print("O valor para venda é $precoVenda reais");
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

  var totalJuros = diasAtraso * percentualJurosDia;
  return valorProduto + totalJuros;
}

double valorComDesconto(double valorProduto, double percentualDesconto) {
  validarValor(valorProduto);
  return valorProduto - percentualDesconto;
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

double calcularValorParcelaCompra(
    {required double valorTotal,
    required int quantidadeParcelas,
    int diasAtraso = 0,
    double jurosAtrasoPorDia = 0}) {
  var valorParcelas = valorTotal / quantidadeParcelas;

  if (diasAtraso <= 0) {
    return valorParcelas;
  } else {
    var valorJuros = diasAtraso * jurosAtrasoPorDia;
    var valorTotalComJuros = valorParcelas + valorJuros;
    return valorTotalComJuros;
  }
}

double margemLucroBrutoMensal(
    {required double valorTotalProdutosVendidos,
    required double valorTotalGastosComProdutos}) {
  var lucroBruto = valorTotalProdutosVendidos - valorTotalGastosComProdutos;
  var margemLucro = (lucroBruto / valorTotalProdutosVendidos) * 100;
  return margemLucro;
}

double margemLucroProdutoUnitario(
    {required double valorDeVendaProduto,
    required double valorDeCompraProduto}) {
  var lucroProduto = valorDeVendaProduto - valorDeCompraProduto;
  var margemLucroProduto = (lucroProduto / valorDeVendaProduto) * 100;
  return margemLucroProduto;
}

double calcularPrecoVendaProduto(double valorPagoProduto,
    [double percentualAcrescimo = 0.5]) {
  var calculoPrecoVenda = valorPagoProduto * percentualAcrescimo;
  var precoVenda = valorPagoProduto + calculoPrecoVenda;
  return precoVenda;
}
