import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      elevation: 4,
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(title, style: Theme.of(context).textTheme.headline1),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
