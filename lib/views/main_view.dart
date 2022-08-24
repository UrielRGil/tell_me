import 'dart:developer';

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
          if (state.status == CardStatus.initial) {
            return FadeIn(
                delay: const Duration(milliseconds: 500),
                child: MyCard(
                  path: state.path,
                  onTap: () {
                    context.read<CardBloc>().add(OnFlipEvent(
                        path: CardNames.obtenerPathAleatorio(),
                        status: CardStatus.flip));
                  },
                ));
          }
          return FlipInY(child: MyCard(path: state.path));
        },
        buildWhen: (current, previus) => current.status != previus.status,
        listener: (BuildContext context, state) {
          if (state.status == CardStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Error en la aplicación, reinicie porfavor')));
          }
        },
      ),
    );
  }
}
