import 'package:flutter/material.dart';
import 'package:movie_app_flutter/widgets/widgets.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = '/details';
  final int index;

  static Route route({required int index}) {
    return MaterialPageRoute(
        builder: (_) => MovieDetailsScreen(index: index),
        settings: const RouteSettings(
          name: routeName,
        ));
  }

  const MovieDetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataMap = <String, double>{
      "rate": 77,
    };

    return Scaffold(
      appBar: const CustomAppBar(title: 'Black Pantera'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w400/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg',
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
                      'https://image.tmdb.org/t/p/w200/sv1xJUazXeYqALzczSZ3O6nkH75.jpg',
                      width: 130,
                      fit: BoxFit.fill,
                      height: 200,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IntrinsicHeight(
                    child: Container(
                      color: Colors.grey.shade200,
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
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
                                  style: Theme.of(context).textTheme.headline4,
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
                              'data data dadata data dad ata dadata datata dadata dat',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        "<<Data dnfsdnfksd fndsnfs nfsn fsndnf sdnf dsndsfn jskfjs >>",
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
                    color: Colors.grey.shade200,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                        "Data data data datavvv data data data data datavvv data datadata data datavvv data data data data datavvv data data data data datavvv data datadata data datavvv data data data data datavvv data data data data datavvv data datadata data datavvv data data data data datavvv data data data data datavvv data datadata data datavvv data data v data data datavvv data data data data datavvv data datadata data datavvv data data data data datavvv data data data data datavvv data datadata data datavvv data data data data datavvv data data data data datavvv data datadata data datavvv data data vdata data datavvv data data data data datavvv data datadata data datavvv data data data data datavvv data data data data datavvv data datadata data datavvv data data v data data datavvv data data data data datavvv data datadata data datavvv data data vdata data datavvv data data data data datavvv data datadata data datavvv data data ",
                        style: Theme.of(context).textTheme.subtitle2),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, bottom: 10, top: 15),
                    child: Text("Actors",
                        style: Theme.of(context).textTheme.headline3),
                  ),
                  const ActorsCarousel(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


