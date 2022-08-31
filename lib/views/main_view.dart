import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tell_me/blocs/card/card_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tell_me/utils/card_names.dart';
import 'package:tell_me/widgets/card.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardBloc(),
      child: BlocConsumer<CardBloc, CardState>(
        builder: (BuildContext context, state) {
          final cardBloc = context.read<CardBloc>();

          if (state.status == CardStatus.initial) {
            return Dismissible(
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                if (direction.index == 2) {
                  cardBloc.add(OnGoNextEvent(
                      index: state.currentIndex, status: CardStatus.flip));
                }
                if (direction.index == 3) {
                  cardBloc.add(OnReturn(state.currentIndex));
                }
              },
              key: Key(state.currentIndex.toString()),
              child: MyCard(
                path: CardNames.cards[state.currentIndex],
                onTap: () {},
              ),
            );
          }
          return FlipInY(
              child: MyCard(path: CardNames.cards[state.currentIndex]));
        },
        buildWhen: (current, previus) => current.status != previus.status,
        listener: (BuildContext context, state) {
          if (state.status == CardStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('No existen tarjetas hacia atras')));
          }
        },
      ),
    );
  }
}
