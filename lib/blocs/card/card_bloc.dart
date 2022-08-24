import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tell_me/utils/card_names.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc()
      : super(CardState(path: CardNames.cards[1], status: CardStatus.initial)) {
    on<OnFlipEvent>(_onFlipEvent);
  }

  void _onFlipEvent(OnFlipEvent event, Emitter<CardState> emit) async {
    emit(state.copyWith(path: event.path, status: CardStatus.flip));

    await Future.delayed(const Duration(seconds: 5));

    emit(state.copyWith(path: CardNames.cards[1], status: CardStatus.initial));
  }
}
