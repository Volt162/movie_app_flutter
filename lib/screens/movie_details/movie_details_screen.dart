import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app_flutter/blocs/movie_details/bloc/movie_details_bloc.dart';
import 'package:movie_app_flutter/main.dart';
import 'package:movie_app_flutter/models/models.dart';
import 'package:movie_app_flutter/services/services.dart';
import 'package:movie_app_flutter/styles.dart';
import 'package:movie_app_flutter/widgets/widgets.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = '/details';
  final int index;
  final String poster;
  final String backImage;
  final String title;

  static Route route(
      {required int index, required String title, required String poster, required String backImage}) {
    return MaterialPageRoute(
        builder: (_) => MovieDetailsScreen(
            index: index, poster: poster, backImage: backImage, title: title,),
        settings: const RouteSettings(
          name: routeName,
        ));
  }

  const MovieDetailsScreen(
      {Key? key,
      required this.index,
      required this.poster,
      required this.backImage,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MovieDetailsBloc(movieService: getIt<IMovieService>())
          ..add(StartMovieDetails(index));
      },
      child: Scaffold(
        appBar: CustomAppBar(title: title),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w400$backImage',
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.7],
                          begin: FractionalOffset.centerLeft,
                          end: FractionalOffset.centerRight,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: 'tag$index',
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w200$poster',
                        width: 130,
                        fit: BoxFit.fill,
                        height: 200,
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                builder: (context, state) {
                  if (state is MovieDetailsLoading) {
                    return Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(150),
                        child: const CircularProgressIndicator(
                            color: Colors.black));
                  } else if (state is MovieDetailsLoaded) {
                    final dataMap = <String, double>{
                      "rate": state.details.voteaverage! * 10,
                    };

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          IntrinsicHeight(
                            child: Container(
                              color: Styles.white_2,
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        RateChart(dataMap: dataMap),
                                        Text(
                                          'Rate',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                        const VerticalDivider(
                                          thickness: 2,
                                          indent: 20,
                                          endIndent: 20,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Budget: ${state.details.budget}\$',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("${state.details.tagline}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(fontStyle: FontStyle.italic)),
                          ),
                          Container(
                            color: Colors.grey.shade200,
                            padding: const EdgeInsets.all(10),
                            child: Text("Review",
                                style: Theme.of(context).textTheme.headline3),
                          ),
                          Container(
                            color: Styles.white_2,
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, bottom: 10),
                            child: Text(state.details.overview!,
                                style: Theme.of(context).textTheme.subtitle2),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 15),
                            child: Text("Production companies",
                                style: Theme.of(context).textTheme.headline3),
                          ),
                          ActorsCarousel(
                              companyList: ProdCompanyList(
                                  companies:
                                      state.details.productioncompanies!)),
                        ],
                      ),
                    );
                  } else {
                    return const Text('Something went wrong');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
