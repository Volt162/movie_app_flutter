import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final int index;

  const MovieCard({
    Key? key, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.pushNamed(context, '/details', arguments: index);
      }),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
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
                tag: 'tag$index',
                child: FadeInImage.assetNetwork(
                  fadeInDuration: const Duration(milliseconds: 10),
                  fadeOutDuration: const Duration(milliseconds: 10),
                  fit: BoxFit.fill,
                  placeholderFit: BoxFit.scaleDown,
                  placeholder: 'assets/images/movie_logo.png',
                  image:
                      'https://image.tmdb.org/t/p/w200/sv1xJUazXeYqALzczSZ3O6nkH75.jpg',
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
                    child: Text("Black Pantera",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline6),
                    alignment: Alignment.centerLeft,
                  ),
                  Align(
                    child: Text("01 februrary",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.grey)),
                    alignment: Alignment.centerLeft,
                  ),
                  Spacer(),
                  Align(
                    child: Text(
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                        "data data data data data v data data data data data data v data  data data data data data v data data data data data data v data data data data data data v data data data data data data v data data data data data data v data data data data data data v data data data data data data v data data data data data data v data data data data data data v data data data data data data v data data data data data data v data"),
                    alignment: Alignment.centerLeft,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
