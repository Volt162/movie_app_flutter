import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app_flutter/blocs/movie_list/bloc/movie_list_bloc.dart';
import 'package:movie_app_flutter/config/app_router.dart';
import 'package:movie_app_flutter/config/theme.dart';
import 'package:movie_app_flutter/screens/movie_list/movie_list_screen.dart';
import 'package:movie_app_flutter/services/services.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<IRestService>(RestService());
  getIt.registerSingleton<IMovieService>(MovieService(getIt<IRestService>()));

  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MovieListBloc(movieService: getIt<IMovieService>())..add(StartMovieList()))
      ],
      child: MaterialApp(
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        home: MovieListScreen(),
      ),
    );
  }
}
