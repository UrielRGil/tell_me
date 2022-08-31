import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String path;
  final VoidCallback? onTap;

  const MyCard({Key? key, required this.path, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          width: size.width,
          height: size.height,
          child: Image(
            image: AssetImage('assets/cards/$path'),
            fit: BoxFit.contain,
          )),
    );
  }
}
