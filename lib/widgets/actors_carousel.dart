import 'package:flutter/material.dart';

class ActorsCarousel extends StatelessWidget {
  const ActorsCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 20),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 120,
              child: Column(
                children: [
                  FadeInImage.assetNetwork(
                    fadeInDuration: const Duration(milliseconds: 10),
                    fadeOutDuration: const Duration(milliseconds: 10),
                    fit: BoxFit.fill,
                    placeholderFit: BoxFit.scaleDown,
                    placeholder: 'assets/images/movie_logo.png',
                    image:
                        'https://image.tmdb.org/t/p/w200/sv1xJUazXeYqALzczSZ3O6nkH75.jpg',
                    height: 150,
                    width: 120,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'data data dadata data dad ata dadata datata dadata dat',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Data data data datavvv da",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle2),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}