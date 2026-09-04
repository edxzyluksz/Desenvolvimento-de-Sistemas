import 'package:fetchvie/controller/user_controller.dart';
import 'package:fetchvie/model/user.dart';
import 'package:fetchvie/model/work.dart';
import 'package:flutter/material.dart';
import 'package:fetchvie/widgets/base_screen.dart';
import 'package:fetchvie/view/export.dart'
    show ScrollDisplay, UserProfile, WorkData;

class Fetchvie extends StatefulWidget {
  
  User userContext;
  Fetchvie({super.key, required this.userContext});

  @override
  State<Fetchvie> createState() => _FetchvieState();
}

class _FetchvieState extends State<Fetchvie> {
  final String _logo = 'assets/fetchvie.png';
  int navIndex = 0;

  bool _existsUsers = false;
  bool _isLoadingUser = true;
  User? _currentUser;

  bool _searchMode = false;
  Work? _selectedWork;

  late final UserController _userController;

  @override
  void initState() {
    super.initState();
    _userController = UserController();
    _loadUser();
  }

  Future<void> _loadUser() async {
    setState(() {
      _currentUser = widget.userContext;
      _isLoadingUser = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: SizedBox(height: 40, child: Image.asset(_logo)),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _searchMode = !_searchMode;
                  if (navIndex > 1) navIndex = 0;
                });
              },
              icon: Icon(
                (_searchMode
                    ? ((navIndex == 1) ? Icons.tv : Icons.movie)
                    : Icons.search
                ), // Se já em modo de pesquisa, troca o ícone para o correspondente da seção
              ),

              iconSize: 30,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(50),
              child: CircleAvatar(
                backgroundImage: _currentUser?.getPfpOrigin(
                  _currentUser?.pfpPath,
                ),
              ),
              onTap: () {
                setState(() {
                  _searchMode = false;
                  _selectedWork = null;
                  navIndex = 2;
                });
              },
            ),
          ],
          actionsPadding: EdgeInsets.only(right: 16),
          backgroundColor: Color.fromARGB(255, 86, 133, 172),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: (_isLoadingUser || _currentUser == null)
              ? Center(child: CircularProgressIndicator())
              : _buildScreen(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navIndex,
          onTap: (value) => setState(() {
            navIndex = value;
            _selectedWork = null;
            _searchMode = false;
          }),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movies"),
            BottomNavigationBarItem(icon: Icon(Icons.tv), label: "TV Series"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          backgroundColor: Color.fromARGB(255, 35, 33, 39),
          unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }

  Widget _buildScreen() {
    if (_selectedWork != null) {
      return WorkData(work: _selectedWork!, user: _currentUser!);
    }

    switch (navIndex) {
      case 0:
        return ScrollDisplay(
          key: ValueKey('movie_$_searchMode'),
          type: "movie",
          user: _currentUser!,
          searchMode: _searchMode,
          onWorkClicked: (clickedWork) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    WorkData(work: clickedWork, user: _currentUser!),
              ),
            );
          },
        );
      case 1:
        return ScrollDisplay(
          key: ValueKey('tv_$_searchMode'),
          type: 'tv',
          user: _currentUser!,
          searchMode: _searchMode,
          onWorkClicked: (clickedWork) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    WorkData(work: clickedWork, user: _currentUser!),
              ),
            );
          },
        );
      case 2:
        return UserProfile(
          user: _currentUser!,
          onWorkClicked: (clickedWork) async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    WorkData(work: clickedWork, user: _currentUser!),
              ),
            );
          },
          onUserUpdated: (newUser) {
            setState(() {
              _currentUser = newUser;
            });
          },
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
