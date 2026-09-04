# Programação para Dispositivos Móveis

## Widgets

Os widgets são os blocos de construção da interface do usuário em aplicativos móveis. Eles representam elementos visuais que podem ser interativos ou informativos, como botões, textos, imagens, listas e muito mais. Em frameworks como Flutter, os widgets são fundamentais para criar layouts e definir a aparência e o comportamento dos aplicativos.

### Tipos de Widgets

1. **Stateless Widgets**: São widgets que não mantêm estado interno. Eles são imutáveis e são reconstruídos sempre que há uma mudança de estado no aplicativo. Exemplos incluem `Text`, `Icon`, e `Image`.
2. **Stateful Widgets**: São widgets que mantêm estado interno e podem ser atualizados dinamicamente. Eles são usados quando o widget precisa reagir a mudanças de dados ou interações do usuário. Exemplos incluem `Checkbox`, `TextField`, e `Slider`.

### Layouts

Os layouts são usados para organizar os widgets na tela. Em Flutter, existem vários tipos de layouts, como:
- **Column**: Organiza os widgets em uma coluna vertical.
- **Row**: Organiza os widgets em uma linha horizontal.
- **Stack**: Permite sobrepor widgets uns sobre os outros.

### Gerenciamento de Estado

O gerenciamento de estado é crucial para aplicativos móveis, pois permite que os widgets respondam a mudanças de dados e interações do usuário. Existem várias abordagens para gerenciar o estado em Flutter, incluindo:
- **setState**: Método simples para atualizar o estado de um widget.
- **Provider**: Uma abordagem mais avançada que permite compartilhar estado entre diferentes partes do aplicativo.

### State<T> e StatefulWidget

O `State<T>` é uma classe que representa o estado de um `StatefulWidget`. Ele contém os dados que podem mudar ao longo do tempo e métodos para atualizar a interface do usuário quando esses dados mudam. O `StatefulWidget` é a classe que cria o widget que pode ter estado, enquanto o `State<T>` é onde o estado real é mantido.

#### Definição de State<T>

```dart
class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState(); // Cria o estado associado ao widget
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _counter = 0; // Estado interno do widget

  void _incrementCounter() {
    setState(() { // Atualiza o estado e reconstrói o widget
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Contador: $_counter'),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: Text('Incrementar'),
        ),
      ],
    );
  }
}
```

### Exemplos de Código

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  initState() {
    super.initState();
    // Inicialização do estado, se necessário
  }

  @override
  void dispose() {
    // Limpeza de recursos, se necessário
    super.dispose();
  }  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Exemplo de Widgets')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Olá, Mundo!'),
              ElevatedButton(
                onPressed: () {
                  // Ação do botão
                },
                child: Text('Clique Aqui'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```



