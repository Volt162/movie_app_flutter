import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/movie/company_list_model.dart';
import 'package:movie_app_flutter/models/movie/prod_companies.dart';
import 'package:movie_app_flutter/widgets/widgets.dart';

class ActorsCarousel extends StatelessWidget {
  const ActorsCarousel({
    Key? key, required this.companyList,
  }) : super(key: key);

  final ProdCompanyList companyList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 20),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: companyList.companies!.length,
        itemBuilder: (context, index) {
          return CompanyCard(company: companyList.companies![index]!);
        },
      ),
    );
  }
}