void main() {
  //! Detalhe sobre a String
  //! A String é composta por 3 campos (Nome|Idade|Sexo)
  final pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Feminino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  //! Baseado na lista acima.
  //! 1 - Remova os pacientes duplicados e apresente a nova lista
  //! 2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas
  //! 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome
  //! 4 - Encontre a pessoa mais velha e apresente o nome dela.

  print('Questão 1 - Remova os pacientes duplicados e apresente a nova lista');
  final lista = pessoas.toSet();
  for (var pessoa in lista) {
    print(pessoa);
  }

  print('');
  print('Questão 2 - Mostre a quantidade de pessoas por sexo e o nome delas');
  final dados = lista.map((pessoa) {
    final partes = pessoa.split('|');
    return {
      'nome': partes[0],
      'idade': partes[1],
      'sexo': partes[2],
    };
  }).toSet();
  final sexos = dados.map((pessoa) => pessoa['sexo']).toSet();
  for (var sexo in sexos) {
    final pessoasDesteSexo = dados.where((pessoa) => pessoa['sexo'] == sexo);
    print('Sexo ${sexo?.toLowerCase()}: ${pessoasDesteSexo.length} pessoas');
    for (var pessoa in pessoasDesteSexo) {
      print('- ${pessoa['nome']}');
    }
  }

  print('');
  print('Questão 3 - Imprima os nomes dos maiores de 18 anos');
  final maiores = dados.where((pessoa) {
    final idade = int.tryParse(pessoa['idade'] ?? '0') ?? 0;
    return idade > 18;
  });
  for (var maior in maiores) {
    print('- ${maior['nome']}');
  }

  print('');
  print('Questão 4 - Encontre a pessoa mais velha e apresente o nome dela');
  final listaOrdenadaPorIdade = dados.toList();
  listaOrdenadaPorIdade.sort(((a, b) {
    final idadeA = int.tryParse(a['idade'] ?? '0') ?? 0;
    final idadeB = int.tryParse(b['idade'] ?? '0') ?? 0;

    return idadeA.compareTo(idadeB);
  }));
  print(listaOrdenadaPorIdade.last);
}
