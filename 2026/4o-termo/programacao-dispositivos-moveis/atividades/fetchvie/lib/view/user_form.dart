import 'dart:io';

import 'package:fetchvie/controller/user_controller.dart';
import 'package:fetchvie/model/user.dart';
import 'package:fetchvie/view/export.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  Object?
  _selectedImage; // Considerando que o usuário pode pegar a imagem da web ou do dispositivo...
  // Os tipos 'String' e 'File' herdam de Object.
  bool _adultMode = false;
  final TextEditingController _nameController = TextEditingController();
  late final UserController _userController;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _userController = UserController();
  }

  Future<void> _choosePhoto(String type) async {
    // 'gallery' || 'web'
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
              decoration: InputDecoration(hintText: "https//..."),
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

        // Verifica se a tela ainda está aberta antes de continuar
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

  static const WidgetStateProperty<Icon> thumbIcon =
      WidgetStateProperty<Icon>.fromMap(<WidgetStatesConstraint, Icon>{
        WidgetState.selected: Icon(Icons.check),
        WidgetState.any: Icon(Icons.close),
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Defina as informações",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: 16),
              Center(
                child: SizedBox(
                  child: TextField(
                    controller: _nameController,
                    onChanged: (text) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.label),
                      hintText: "Nome de usuário...",
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    maxLength: 100,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        (_selectedImage is String &&
                            (_selectedImage as String).isNotEmpty)
                        ? NetworkImage(_selectedImage as String)
                        : _selectedImage is File
                        ? FileImage(_selectedImage as File)
                        : const AssetImage('assets/guest_pfp.jpg')
                              as ImageProvider,
                    radius: 50,
                  ),
                  FilledButton.tonal(
                    onPressed: () => pfpModal(),
                    child: Text("Selecionar foto"),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Modo adulto",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(width: 20),
                  Switch(
                    value: _adultMode,
                    onChanged: (value) {
                      setState(() {
                        _adultMode = value;
                      });
                    },
                    thumbIcon: thumbIcon,
                  ),
                ],
              ),
              SizedBox(height: 80),
              FilledButton.tonal(
                onPressed: _nameController.text.trim().isNotEmpty
                    ? () async {
                        final newUser = User(
                          username: _nameController.text.trim(),
                          isAdult: _adultMode,
                          pfpPath: _imageToString(),
                        );

                        final generatedId = await _userController.createUser(
                          newUser,
                        );

                        final userWithId = User(
                          uid: generatedId,
                          username: newUser.username,
                          isAdult: newUser.isAdult,
                          pfpPath: newUser.pfpPath,
                        );

                        if (!mounted) return;

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Fetchvie(userContext: userWithId),
                          ),
                          (route) => false,
                        );
                      }
                    : null,
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),
                  backgroundColor: WidgetStatePropertyAll<Color>(
                    const Color.fromARGB(255, 49, 114, 52),
                  ),
                ),
                child: Text("Finalizar conta"),
              ),
            ],
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

  String _imageToString() {
    if (_selectedImage is File) {
      return (_selectedImage as File).path;
    } else if (_selectedImage is String) {
      return (_selectedImage as String).toLowerCase();
    } else {
      return "";
    }
  }
}
