import 'package:fetchvie/model/user.dart';
import 'package:fetchvie/model/work.dart';
import 'package:fetchvie/service/tmdb_fetch.dart';

class WorkController {
  final User user;
  int currentPage = 1;
  String currentQuery = "";
  List<Work> works = [];

  WorkController({
    required this.user,
  }); // Obrigatório saber os dados do usuário para realizar a pesquisa

  Future<void> getInitialWorks(bool isMovie) async {
    currentPage = 1; // Reseta o cursor
    final works = await TmdbService.discoverWork(
      isMovie,
      user.isAdult,
      page: currentPage,
    );
    final String searchType = isMovie ? 'movie' : 'tv';
    final toAdd = works
        .map((work) => Work.fromMap(work, providedType: searchType))
        .toList();
    this.works = toAdd;
  }

  Future<void> getMoreWorks(bool isMovie) async {
    currentPage++;
    final works = await TmdbService.discoverWork(
      isMovie,
      user.isAdult,
      page: currentPage,
    );
    final String searchType = isMovie ? 'movie' : 'tv';
    final toAdd = works
        .map((work) => Work.fromMap(work, providedType: searchType))
        .toList();
    this.works.addAll(toAdd);
  }

  Future<void> queryInitialWorks(String query, bool isMovie) async {
    currentQuery = query;
    currentPage = 1;
    final works = await TmdbService.searchWork(
      query,
      isMovie,
      user.isAdult,
      page: currentPage,
    );
    final String searchType = isMovie ? 'movie' : 'tv';
    final toAdd = works
        .map((work) => Work.fromMap(work, providedType: searchType))
        .toList();
    this.works = toAdd;
  }

  Future<void> queryMoreWorks(String query, bool isMovie) async {
    currentPage++;
    final works = await TmdbService.searchWork(
      query,
      isMovie,
      user.isAdult,
      page: currentPage,
    );
    final String searchType = isMovie ? 'movie' : 'tv';
    final toAdd = works
        .map((work) => Work.fromMap(work, providedType: searchType))
        .toList();
    this.works.addAll(toAdd);
  }
}
