import 'dart:io';

import 'package:fetchvie/controller/user_controller.dart';
import 'package:fetchvie/view/user_select.dart';
import 'package:fetchvie/widgets/base_screen.dart';
import 'package:fetchvie/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class UserConfig extends StatefulWidget {
  final User sessionUser;
  const UserConfig({super.key, required this.sessionUser});

  @override
  State<UserConfig> createState() => _UserConfigState();
}

class _UserConfigState extends State<UserConfig> {
  late final User user;
  late String _username;
  late bool _adultMode;
  dynamic _selectedImage;

  late final TextEditingController _controller;
  late final UserController _userController;

  @override
  void initState() {
    user = widget.sessionUser;
    _controller = TextEditingController(text: user.username);
    _userController = UserController(user: user);
    _adultMode = user.isAdult;
    _username = user.username;
    _selectedImage = user.pfpPath;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> saveAndExit(BuildContext context) async {

    String? finalPfpPath = user.pfpPath;
    
    if (_selectedImage != null) {
      if (_selectedImage is File) {
        finalPfpPath = (_selectedImage as File).path;
      } else if (_selectedImage is String) {
        finalPfpPath = _selectedImage as String;
      }
    }

    final updatedUser = User(
      uid: user.uid,
      username: _username,
      isAdult: _adultMode,
      pfpPath: finalPfpPath
    );

    try {
      // Executa o update no banco
      int rowsAffected = await _userController.updateUser(updatedUser);
      print("Usuários atualizados no banco: $rowsAffected");
    } catch (e) {
      print("Erro ao atualizar no banco: $e");
    }

    if (!context.mounted) return;

    Navigator.pop(context, updatedUser);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: ((didPop, result) async {
        if (didPop) return;
        await saveAndExit(context);
      }),
      child: BaseScreen(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 86, 133, 172),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => saveAndExit(context)
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 36, 36, 36),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        "Configurações",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "Nome de usuário: $_username",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                            onPressed: changeUsername,
                            icon: Icon(Icons.edit),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundImage: _selectedImage != null
                                ? user.getPfpOrigin(
                                    _selectedImage is File
                                        ? (_selectedImage as File).path
                                        : _selectedImage as String,
                                  )
                                : user.getPfpOrigin(user.pfpPath),
                            radius: 40,
                          ),
                          FilledButton.tonal(
                            onPressed: pfpModal,
                            child: Text("Mudar foto"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Modo adulto",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 20),
                          Switch(
                            value: _adultMode,
                            onChanged: (value) {
                              setState(() {
                                _adultMode = value;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 100),
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserSelect(),
                            ),
                            (route) => false,
                          );
                        },
                        label: Text("Sair da sessão"),
                        icon: Icon(Icons.exit_to_app),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pfpModal({String path = ""}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Foto de perfil",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _choosePhoto('gallery'),
                  child: Text("Dispositivo"),
                ),
                ElevatedButton(
                  onPressed: () => _choosePhoto('web'),
                  child: Text("Link da Web"),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Fechar"),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _choosePhoto(String type) async {
    if (type == 'web') {
      Navigator.pop(context);
      TextEditingController urlController = TextEditingController();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("URL da Imagem"),
            content: TextField(
              controller: urlController,
              decoration: const InputDecoration(hintText: "https://..."),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (urlController.text.isNotEmpty) {
                    setState(() {
                      _selectedImage = urlController.text;
                    });
                  }
                  Navigator.pop(context);
                },
                child: const Text("Pronto"),
              ),
            ],
          );
        },
      );
    } else if (type == 'gallery') {
      final ImagePicker picker = ImagePicker();
      try {
        final XFile? image = await picker.pickImage(
          source: ImageSource.gallery,
        );

        if (!mounted) return;

        if (image != null) {
          setState(() {
            _selectedImage = File(image.path);
          });

          Navigator.pop(context);
        }
      } catch (e) {
        throw Exception("Erro ao carregar imagem. ($e)");
      }
    }
  }

  Future<void> changeUsername() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Mudar nome"),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hint: Text("Novo nome de usuário...")),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  setState(() {
                    _username = _controller.text.trim();
                  });
                  Navigator.pop(context);
                }
              },
              child: Text("Confirmar"),
            ),
          ],
        );
      },
    );
  }
}
