import 'package:fetchvie/controller/user_controller.dart';
import 'package:fetchvie/model/user.dart';
import 'package:fetchvie/model/work.dart';
import 'package:fetchvie/view/user_config.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  final User user;
  final Future<void> Function(Work) onWorkClicked;
  final Function(User)? onUserUpdated;

  const UserProfile({
    super.key,
    required this.user,
    required this.onWorkClicked,
    required this.onUserUpdated,
  });

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool _showFavorites = false;
  late UserController _userController;
  late Future<List<Work>> _favoritesFuture;

  late User _currentUser;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _currentUser = widget.user;
    _userController = UserController(user: _currentUser);
    _loadFavorites();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadFavorites() {
    _favoritesFuture = _userController.getFavoriteMovies();
  }

  @override
  Widget build(BuildContext build) => SingleChildScrollView(
    controller: _scrollController,
    child: Center(
      child: Column(
        children: [
          Stack(
            children: [
              Text(
                _currentUser.username,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3
                    ..color = Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                _currentUser.username,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(height: 5),
          CircleAvatar(
            backgroundImage: _currentUser.getPfpOrigin(_currentUser.pfpPath),
            radius: 100,
          ),
          const SizedBox(height: 10),
          DecoratedBox(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 36, 36, 36),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ID de Usuário: ${_currentUser.uid?.toString() ?? 'Desconhecido'}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Modo Adulto: ${_currentUser.isAdult ? "Ativado" : "Desativado"}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  FilledButton.icon(
                    onPressed: () async {
                      final updatedUser = await Navigator.push<User>(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return UserConfig(sessionUser: _currentUser);
                          },
                        ),
                      );

                      if (updatedUser != null && mounted) {
                        setState(() {
                          _currentUser = updatedUser;
                          _userController = UserController(user: _currentUser);
                        });

                        if (widget.onUserUpdated != null) {
                          widget.onUserUpdated!(updatedUser);
                        }
                      }
                    },
                    label: Text("Acessar configurações"),
                    icon: Icon(Icons.settings),
                    style: FilledButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 86, 133, 172),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          TextButton.icon(
            onPressed: () {
              setState(() {
                _showFavorites = !_showFavorites;
                if (_showFavorites) {
                  _loadFavorites();
                }
              });

              if (_showFavorites) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _scrollController.animateTo(
                    175.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                });
              }
            },
            icon: Icon(
              _showFavorites
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            label: Text(
              _showFavorites ? "Ocultar Favoritos" : "Mostrar Favoritos",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),

          if (_showFavorites)
            FutureBuilder<List<Work>>(
              future: _favoritesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Erro ao carregar favoritos."),
                  );
                }

                final favoritedWorks = snapshot.data ?? [];

                if (favoritedWorks.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Você não possui nenhuma obra favoritada!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 10.0,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: favoritedWorks.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.7,
                        ),
                    itemBuilder: (context, index) {
                      final currentWork = favoritedWorks[index];
                      final imageUrl =
                          'https://image.tmdb.org/t/p/w500${currentWork.posterPath}';

                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () async {
                            await widget.onWorkClicked(currentWork);

                            if (!mounted) return;

                            setState(() {
                              _loadFavorites();
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(
                                        Icons.broken_image,
                                        size: 50,
                                        color: Colors.grey,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentWork.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 16,
                                          color: Colors.amber,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          currentWork.rating.toString(),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

          const SizedBox(height: 30),
        ],
      ),
    ),
  );
}
