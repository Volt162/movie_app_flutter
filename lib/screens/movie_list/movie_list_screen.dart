import 'package:easy_load_more/easy_load_more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/blocs/movie_list/bloc/movie_list_bloc.dart';
import 'package:movie_app_flutter/models/models.dart';
import 'package:movie_app_flutter/styles.dart';
import 'package:movie_app_flutter/widgets/widgets.dart';

class MovieListScreen extends StatelessWidget {
  static const String routeName = '/movie_list';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => MovieListScreen(),
        settings: const RouteSettings(name: routeName));
  }

  final List<MovieItem?> _movies = [];

  MovieListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Movie list'),
      body: BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, state) {
          if (state is MovieListLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (state is MovieListsLoaded) {
            if (state.isRefresh) {
              _movies.clear();
            }
            _movies.addAll(state.popularMovieList.movies!);

            return MovieListControl(
              movies: _movies,
              totalMovieListLength: state.totalMovieListLength,
              topMovies: state.topMovieList.movies,
            );
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}

class MovieListControl extends StatelessWidget {
  const MovieListControl(
      {Key? key,
      required movies,
      required totalMovieListLength,
      required topMovies})
      : _movies = movies,
        _totalMovieListLength = totalMovieListLength,
        _topMovies = topMovies,
        super(key: key);

  final List<MovieItem?> _movies;
  final List<MovieItem?> _topMovies;
  final int _totalMovieListLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.only(left: 8, top: 20, bottom: 8),
            alignment: Alignment.bottomLeft,
            child:
                const Text("Top 20  most rated movies", style: Styles.titile)),
        TopMovieCarousel(topMovies: _topMovies),
        Container(
            padding: const EdgeInsets.only(left: 20, top: 0, bottom: 10),
            alignment: Alignment.bottomLeft,
            child: const Text("Popular movies", style: Styles.titile)),
        Expanded(
          child: RefreshIndicator(
            color: Colors.black,
            onRefresh: () async {
              await context.read<MovieListBloc>().refreshList();
            },
            child: EasyLoadMore(
              loadingWidgetColor: Colors.black,
              isFinished: _movies.length >= _totalMovieListLength,
              onLoadMore: () async {
                var result = await context.read<MovieListBloc>().loadMore();
                return result;
              },
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 10),
                itemCount: _movies.length,
                prototypeItem: MovieCard(
                  index: -1,
                  movie: _movies[0],
                ),
                itemBuilder: (context, index) {
                  return MovieCard(index: index, movie: _movies[index]);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
