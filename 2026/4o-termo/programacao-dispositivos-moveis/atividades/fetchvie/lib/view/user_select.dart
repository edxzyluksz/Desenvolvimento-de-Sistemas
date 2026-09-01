import 'package:fetchvie/controller/user_controller.dart';
import 'package:fetchvie/model/user.dart';
import 'package:fetchvie/view/export.dart';
import 'package:fetchvie/view/user_form.dart';
import 'package:flutter/material.dart';

class UserSelect extends StatefulWidget {
  const UserSelect({super.key});

  @override
  State<UserSelect> createState() => _UserSelectState();
}

class _UserSelectState extends State<UserSelect> {
  List<User> _users = [];
  late final UserController _userController;

  @override
  void initState() {
    super.initState();
    _userController = UserController();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final users = await _userController.getUsers();
    if (!mounted) return;

    setState(() {
      _users = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 32, 0, 32),
          child: Column(
            children: [
              SizedBox(height: 100, child: Image.asset('assets/fetchvie.png')),
              SizedBox(height: 20),
              Text(
                'Olá! Escolha sua conta',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 160,
                child: (_users.isEmpty)
                    ? Text("Sem usuários registrados.")
                    : Center(
                      child: ListView.builder(
                        itemCount: _users.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const PageScrollPhysics(),
                        itemBuilder: (context, index) {
                          final currentUser = _users[index];
                          return Container(
                            width: 100,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Fetchvie(userContext: currentUser),
                                    ),
                                    (route) => false,
                                  );
                                },
                                borderRadius: BorderRadius.circular(50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundImage: currentUser.getPfpOrigin(
                                        currentUser.pfpPath,
                                      ),
                                    ),
                                    Text(
                                      currentUser.username,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          (currentUser.isAdult)
                                              ? Icons.check
                                              : Icons.close,
                                          size: 14,
                                          color: (currentUser.isAdult)
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "Adulto",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserForm()),
                ),
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                child: Text("Criar conta"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
