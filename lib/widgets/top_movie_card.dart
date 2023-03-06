import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/models.dart';
import 'package:movie_app_flutter/styles.dart';

class TopMovieCard extends StatelessWidget {
  const TopMovieCard({
    super.key,
    required this.id,
    this.movie,
  });

  final int id;
  final MovieItem? movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/details', arguments: {
          movie!.id,
          movie!.posterpath,
          movie!.backdroppath,
          movie!.title
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Styles.grey),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Styles.grey,
              blurRadius: 4,
              offset: Offset(4, 4),
            ),
          ],
        ),
        margin: const EdgeInsets.only(top: 0, left: 8, right: 8),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: Hero(
            tag: 'tag${id}',
            child: FadeInImage.assetNetwork(
              fadeInDuration: const Duration(milliseconds: 10),
              fadeOutDuration: const Duration(milliseconds: 10),
              fit: BoxFit.fill,
              placeholderFit: BoxFit.scaleDown,
              placeholder: 'assets/images/movie_logo.png',
              image:
                  'https://image.tmdb.org/t/p/w300/${movie!.posterpath}',
              height: 250,
              width: 150,
            ),
          ),
        ),
      ),
    );
  }
}
