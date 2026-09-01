import 'package:fetchvie/controller/user_controller.dart';
import 'package:fetchvie/model/user.dart';
import 'package:fetchvie/model/work.dart';
import 'package:fetchvie/widgets/base_screen.dart';
import 'package:flutter/material.dart';

class WorkData extends StatefulWidget {
  final Work work;
  final User user;

  const WorkData({super.key, required this.work, required this.user});

  @override
  State<WorkData> createState() => _WorkDataState();
}

class _WorkDataState extends State<WorkData> {
  late final UserController _userController;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _userController = UserController(user: widget.user);
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'https://image.tmdb.org/t/p/w500${widget.work.posterPath}';
    final title = widget.work.title;
    final type = (widget.work.type == 'movie') ? "Filme" : "Série de Televisão";
    final release = widget.work.releaseDate;
    final formattedRelease = release == null
        ? 'Lançamento: Desconhecido'
        : 'Lançamento: ${release.day.toString().padLeft(2, '0')}/${release.month.toString().padLeft(2, '0')}/${release.year}';
    final overview = widget.work.overview;
    final rating = widget.work.rating;

    return BaseScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(backgroundColor: Color.fromARGB(255, 86, 133, 172)),
        body: Padding(
          padding: const EdgeInsets.all(4),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 36, 36, 36),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          imageUrl,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            type,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            formattedRelease,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: _isProcessing ? null : () async {
                              setState(() {
                                _isProcessing = true; // Bloqueia novos cliques
                              });

                              try {
                                final wasAdded = await _userController
                                    .toggleFavoriteMovie(widget.work);

                                // Garante que o widget ainda está na tela antes de usar o context
                                if (!mounted) return;

                                ScaffoldMessenger.of(context).clearSnackBars();

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      wasAdded
                                          ? "Filme adicionado aos favoritos!"
                                          : "Filme removido dos favoritos.",
                                          style: TextStyle(color: Colors.white),
                                    ),
                                    duration: Duration(seconds: 2),
                                    backgroundColor: wasAdded
                                        ? Colors.green
                                        : Colors.grey.shade700,
                                  ),
                                );
                              } catch (e) {

                                if (!mounted) return;
                                ScaffoldMessenger.of(context).clearSnackBars();

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Não foi possível realizar esta ação.",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Color.fromARGB(
                                      255,
                                      77,
                                      24,
                                      20,
                                    ),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              } finally {
                                if (mounted) {
                                  setState(() {
                                    _isProcessing = false;
                                  });
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Colors.amber,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  rating.toString(),
                                  style: const TextStyle(color: Colors.amber),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(overview, style: const TextStyle(fontSize: 12)),
                        ],
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
}
