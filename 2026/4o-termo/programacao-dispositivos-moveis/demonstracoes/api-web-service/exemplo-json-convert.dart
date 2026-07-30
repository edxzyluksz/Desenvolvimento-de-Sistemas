// Exemplo de uso do convert JSON

// Importar a biblioteca

import 'dart:convert'; // Biblioteca nativa do dart (sem pub add)

void main(List<String> args) {
  String jsonUsuario = '''{
    "id": 1,
    "nome": "João",
    "login": "joao_user",
    "status": true,
    "senha": "1234",
    "endereço": {"rua": "A", "numero":"234"},
    "emails": ["joao@email.com", "joao2@email.com"]
  }''';

  // Converter o Texto
  Map<String, dynamic> usuario = json.decode(jsonUsuario);

  print(usuario["nome"]); // Printando a informação da chave nome
  print(usuario["login"]); // Printando a informação da chave login

  // Mudando um valor
  usuario["senha"] = "1111";

  // Converter o map em texto json usando encode
  String jsonUsuarioNovo = json.encode(usuario);

  // Printando o texto json
  print (jsonUsuarioNovo);

  // =================
  // Extra (por Edxzy): Como acessar através de um array de objetos
  // =================

  String dbJson = '''[
  {
    "id": 1,
    "nome": "Pedro",
    "login": "pedro123",
    "status": false,
    "senha": "12345",
    "endereço": {"rua": "B", "numero": "567"},
    "emails": ["pedro@email.com", "pedro@email.com"]
  },
  {
    "teste": "Edxzy está aprendendo!"
  }
]''';

  // Converter o Texto
  List<dynamic> usuarios = json.decode(dbJson);

  print(usuarios[0]["nome"]); // Acessa o valor de 'nome' do objeto na posição 0
  print(usuarios[1]["teste"]); // Acessa 'teste' do index 1

  String jsonDatabase = json.decode(dbJson);
  print(jsonDatabase);
}