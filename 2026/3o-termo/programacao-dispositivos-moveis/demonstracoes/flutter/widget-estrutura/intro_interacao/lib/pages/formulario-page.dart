// Tela com elementos de formulário para interação

// textField -> Entrada de Dados
// checkbox -> Seleção de Opções
// radio button -> Uma única opção
// slider -> Barra de Seleção
// switch -> Botão de Alternância
// dropdown

// Usar elemento form para validação de campos


// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage ({super.key});

  @override
  State<FormularioPage> createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  // Atributos (nome, email, senha, validação de senha, termos de uso (switch), sexo(radio), idade(slider), interesses(checkbox), cidade(dropdown) )
  String _nome = "";
  String _email = "";
  String _senha = "";
  String _confirmarSenha = "";
  bool _aceitarTermos = false;
  String _sexo = "";
  double _idade = 18;
  List<String> _interesses = [];
  String _cidade = "Americana";

  bool _senhaOculta = true;

  // Chave global de validação do formulário
  final formKey = GlobalKey<FormState>(); // Formulário somente será enviado se a chave do formulário for validada

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulário de Cadastro"),),
      body: Padding(
        // Espaçamento geral de 8px em toda a tela
        padding: EdgeInsets.all(8),
        child: Form(
          key: formKey, // Chave de validação
          child: SingleChildScrollView( // Permite scroll na tela
            child: Column(
              children: [
                // Campo do nome
                TextFormField(
                  //validacao do campo com ternário
                  validator: (value) => value!.isEmpty ? "Campo Obrigatório" : null,
                  onChanged: (value) => setState(() {_nome = value;}),
                  //labeltext => placeholder do campo
                  decoration: InputDecoration(labelText: "Digite seu nome...", border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) => value!.contains("@") ? null : "Email Inválido!",
                  onChanged: (value) => setState(() {_email = value;}),
                  decoration: InputDecoration(labelText: "Digite seu email...", border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                // Campo senha
                TextFormField(
                  validator: (value) => value!.length >= 6 ? null : "A senha deve conter no mínimo 6 caracteres",
                  onChanged: (value) => setState(() => _senha = value),
                  decoration: InputDecoration(
                    labelText: "Digite sua senha...", 
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => _senhaOculta = !_senhaOculta), 
                      icon: Icon(_senhaOculta ? Icons.visibility : Icons.visibility_off)
                    )
                  ),
                  obscureText: true,
                  // Mecanismo para mostrar senha oculta
                ),
                TextFormField(
                  validator: (value) => value == _senha ? null : "Repita a senha corretamente.",
                  onChanged: (value) => setState(() => _senha = value),
                  decoration: InputDecoration(
                    labelText: "Digite sua senha...", 
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true, 
                ),
                SizedBox(height: 10),
                //Forma antiga de fazer Radio Button
                // Row(
                  // children: [
                    // Radio(
                      // value: "Feminino",
                      // groupValue: _sexo,
                      // onChanged: (value) => setState(() { _sexo = value!;}),
                    // ),
                    // Text("Feminino"),
                    // SizedBox(width: 10,),
                    // Radio(
                    //  value: "Masculino",
                    //  groupValue: _sexo,
                    //  onChanged: (value) => setState(() { _sexo = value!;}),
                    // ),
                    // Text("Masculino"),
                    // SizedBox(width: 10,),
                    // Radio(
                    // value: "Outro",
                    // groupValue: _sexo,
                    // onChanged: (value) => setState(() { _sexo = value!;}),
                  // ),
                  // Text("Outro"),
                  // ],
                // ),
                RadioGroup<String>(
                  groupValue: _sexo,
                  onChanged: (String? value) => setState(() {
                    _sexo = value!;
                  }),
                  child: Row(
                    children: [
                      Text("Sexo"),
                      SizedBox(width: 5),
                      Radio(value: "Feminino"),
                      Text("Feminino"),
                      SizedBox(width: 5),
                      Radio(value: "Masculino"),
                      Text("Feminino"),
                      SizedBox(width: 5),
                      Radio(value: "Outro"),
                      Text("Outro")
                    ],
                  ),
                ),
                // Slider para selecionar a idade
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Idade: ${_idade.toInt()}"), // Exibir a idade selecionada
                    Expanded(
                      child: Slider(
                        value: _idade, 
                        onChanged: (value) => setState(() {
                          _idade = value;
                        }),
                        min: 0,
                        max: 100,
                        divisions: 100,
                        label: _idade.toInt().toString(),
                      )
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(children: [
                  Text("Interesses Pessoais: "),
                  Row(
                    children: [
                      Checkbox(
                        value: _interesses.contains("Cinema"), 
                        onChanged: (bool? value) => setState(() {
                          value! ? _interesses.add("Cinema") : _interesses.remove("Cinema");
                        })),
                        Text("Cinema"),
                      SizedBox(width: 5),
                      Checkbox(
                        value: _interesses.contains("Teatro"), 
                        onChanged: (bool? value) => setState(() {
                          value! ? _interesses.add("Teatro") : _interesses.remove("Teatro");
                      })),
                      Text("Teatro"),
                      SizedBox(width: 5),
                      Checkbox(
                        value: _interesses.contains("RPG"), 
                        onChanged: (bool? value) => setState(() {
                          value! ? _interesses.add("RPG") : _interesses.remove("RPG");
                      })),
                      Text("RPG"),
                      SizedBox(width: 5),
                      Checkbox(
                        value: _interesses.contains("Esportes"), 
                        onChanged: (bool? value) => setState(() {
                          value! ? _interesses.add("Esportes") : _interesses.remove("Esportes");
                      })),
                      Text("Esportes"),
                      SizedBox(width: 5),
                      Checkbox(
                        value: _interesses.contains("Música"), 
                        onChanged: (bool? value) => setState(() {
                          value! ? _interesses.add("Música") : _interesses.remove("Música");
                      })),
                      Text("Música"),
                      SizedBox(width: 5)
                    ],
                  ),
                ],
                ),
                // Dropdown para selecionar a Cidade
                SizedBox(height: 20),
                Text("Cidade: "),
                DropdownButtonFormField(
                  items: [
                    DropdownMenuItem(value: "Americana", child: Text("Americana")),
                    DropdownMenuItem(value: "Nova Odessa", child: Text("Nova Odessa")),
                    DropdownMenuItem(value: "Sumaré", child: Text("Sumaré")),
                    DropdownMenuItem(value: "Campinas", child: Text("Campinas")),
                    DropdownMenuItem(value: "Santa Bárbara D'Oeste", child: Text("Santa Bárbara D'Oeste")),
                    DropdownMenuItem(value: "Santa Bárbara D'Oeste", child: Text("Outra"))
                  ], 
                  onChanged: (String? value) => setState(() {
                    _cidade = value!;
                  })
                ),
                SizedBox(height: 20),
                // Switch para aceitar os termos de uso 
                Row(children: [
                  Switch(
                    value: _aceitarTermos, 
                    onChanged: (bool value) => setState(() {
                      _aceitarTermos = !true;
                    })),
                    Text("Aceitar os Termos de Uso")
                ],
                ),
                SizedBox(height: 20),
                // Botão de envio do formulário
                ElevatedButton(
                  onPressed: () => _enviarFormulario(), 
                  child: Text("Enviar Formulário"),
                )
              ],
            ),
          )
        ),
      ),
    );
  }

  void _enviarFormulario() {
    // Verificação de formulário
    // Mostrar os dados em dialog
    if(formKey.currentState!.validate()){
      if (_aceitarTermos) {
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text("Dados do Formulário"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Nome: $_nome"),
                Text("Email: $_email"),
                Text("Senha: $_senha"),
                Text("Sexo: $_sexo"),
                Text("Idade: ${_idade.toInt()}"),
                Text("Interesses: ${_interesses.join(", ")}"),
                Text("Cidade: $_cidade"),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                //limpar formulário
                setState(() {
                  _nome = "";
                  _email = "";
                  _senha = "";
                  _confirmarSenha = "";
                  _sexo = "Feminino";
                  _idade = 18;
                  _interesses = [];
                  _cidade = "Americana";
                  _aceitarTermos = false;
                  formKey.currentState!.reset(); //reseta a validação do formulário
                });
              },//volta para a tela anterior(home) 
              child: Text("Ok")),
          ],
        )
        );
      }
    }
  }
}