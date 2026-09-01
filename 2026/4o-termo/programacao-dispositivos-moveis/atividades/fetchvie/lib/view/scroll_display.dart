import 'dart:async';

import 'package:fetchvie/controller/work_controller.dart';
import 'package:fetchvie/model/user.dart';
import 'package:fetchvie/model/work.dart';
import 'package:flutter/material.dart';

class ScrollDisplay extends StatefulWidget {
  final String type; // Envia se tipo é 'movie' ou 'tv'
  final User user;
  final bool searchMode;
  final Function(Work) onWorkClicked;

  const ScrollDisplay({
    super.key,
    required this.type,
    required this.user,
    this.searchMode = false,
    required this.onWorkClicked,
  });

  @override
  State<ScrollDisplay> createState() => _ScrollDisplayState();
}

class _ScrollDisplayState extends State<ScrollDisplay> {
  final ScrollController _scrollController =
      ScrollController(); // Responsável por detectar a rolagem do usuário
  late final WorkController _workController;
  List<Work> _works = [];

  Timer? _debounce;

  void _onSearchChanged(String text) {
    query = text;

    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 600), () {
      if (query.isNotEmpty) {
        _load();
      }
    });
  }

  String error = "";
  String query = "";

  bool _isLoading = true;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _workController = WorkController(user: widget.user);
    _load();

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isLoadingMore) return;

    final currentPosition = _scrollController.position.pixels;
    final maxScroll = _scrollController.position.maxScrollExtent;

    if (currentPosition >= maxScroll * 0.9) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    setState(() => _isLoadingMore = true);

    try {
      final bool isMovie = (widget.type == 'movie');

      (!widget.searchMode)
          ? await _workController.getMoreWorks(isMovie)
          : await _workController.queryMoreWorks(query, isMovie);

      setState(() {
        _works = List.from(_workController.works);
      });
    } catch (e) {
      print("Erro ao carregar mais: $e");
    } finally {
      setState(() => _isLoadingMore = false);
    }
  }

  void _load() async {
    // Se estiver no modo de busca e o usuário ainda não digitou nada, nem chama a API
    if (widget.searchMode && query.isEmpty) {
      setState(() => _isLoading = false);
      return;
    }

    setState(() => _isLoading = true);
    try {
      final bool isMovie = (widget.type == 'movie');
      (!widget.searchMode)
          ? await _workController.getInitialWorks(isMovie)
          : await _workController.queryInitialWorks(query, isMovie);

      setState(() {
        _works = List.from(_workController.works);
        error = "";
      });
    } catch (e) {
      setState(() => error = e.toString());
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (error.isNotEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Ops, falhou:\n$error",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 16,
              backgroundColor: Colors.blueGrey,
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        if (widget.searchMode)
          TextField(
            // Se estiver em modo de pesquisa, aciona um TextField no topo
            autofocus: false,
            onChanged: _onSearchChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 42, 42, 43),
              hintText: "Pesquisar...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white, width: 1),
              ),
            ),
          ),

        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : (widget.searchMode && query.isEmpty)
              ? const SizedBox.shrink()
              : _works.isEmpty
              ? const Center(
                  child: Text(
                    "Nenhum resultado encontrado.",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : GridView.builder(
                  controller: _scrollController,
                  itemCount: _works.length + (_isLoadingMore ? 2 : 0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    if (index >= _works.length) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final currentWork = _works[index];
                    final imageUrl =
                        'https://image.tmdb.org/t/p/w500${currentWork.posterPath}';

                    return TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: Duration(
                        milliseconds: 300 + (index * 50).clamp(0, 500),
                      ),
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(0, 50 * (1 - value)),
                          child: Opacity(opacity: value, child: child),
                        );
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            widget.onWorkClicked(currentWork);
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
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
