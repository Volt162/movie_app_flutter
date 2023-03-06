
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/models.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({
    super.key,
    required this.company,
  });

  final ProductionCompany company;

  @override
  Widget build(BuildContext context) {
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
            ClipRRect(
              borderRadius:  const BorderRadius.all(Radius.circular(8.0)),
              child: FadeInImage.assetNetwork(
                fadeInDuration: const Duration(milliseconds: 10),
                fadeOutDuration: const Duration(milliseconds: 10),
                fit: BoxFit.fitWidth,
                placeholderFit: BoxFit.scaleDown,
                placeholder: 'assets/images/movie_logo.png',
                image: 'https://image.tmdb.org/t/p/w200${company.logopath}',
                height: 120,
                width: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                company.name!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(company.origincountry!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle2),
            ),
          ],
        ),
      ),
    );
  }
}