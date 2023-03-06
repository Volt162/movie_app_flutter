import 'package:easy_load_more/easy_load_more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/blocs/movie_list/bloc/movie_list_bloc.dart';
import 'package:movie_app_flutter/models/models.dart';
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
          } else if (state is MovieListLoaded) {
            if (state.isRefresh) {
              _movies.clear();
            }
            _movies.addAll(state.movieList.movies!);
            
            return RefreshIndicator(
              color: Colors.black,
              onRefresh: () async {
                await context.read<MovieListBloc>().refreshList();
              },
              child: EasyLoadMore(
                loadingWidgetColor: Colors.black,
                isFinished: _movies.length >= state.totalMovieListLength,
                onLoadMore: () async {
                  var result = await context.read<MovieListBloc>().loadMore();
                  return result;
                },
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
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
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
