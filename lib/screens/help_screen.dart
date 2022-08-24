import 'package:flutter/material.dart';
import 'package:tell_me/utils/card_names.dart';
import 'package:tell_me/widgets/card.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MyCard(
      path: CardNames.cards[2],
      onTap: () {
        Navigator.of(context).pop();
      },
    ));
  }
}
