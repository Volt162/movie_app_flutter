import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/movie/movie_item.dart';
import 'package:movie_app_flutter/styles.dart';

class MovieCard extends StatelessWidget {
  final int index;
  final MovieItem? movie;

  const MovieCard({
    Key? key,
    required this.index,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.pushNamed(context, '/details',
            arguments: {movie!.id, movie!.posterpath, movie!.backdroppath, movie!.title});
      }),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 150,
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
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0)),
              child: Hero(
                tag: 'tag${movie!.id}',
                child: FadeInImage.assetNetwork(
                  fadeInDuration: const Duration(milliseconds: 10),
                  fadeOutDuration: const Duration(milliseconds: 10),
                  fit: BoxFit.fill,
                  placeholderFit: BoxFit.scaleDown,
                  placeholder: 'assets/images/movie_logo.png',
                  image: 'https://image.tmdb.org/t/p/w200/${movie!.posterpath}',
                  height: 150,
                  width: 100,
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(movie!.title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(movie!.releasedate!.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.grey)),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      movie!.overview!,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
