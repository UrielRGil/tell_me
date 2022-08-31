import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tell_me/utils/card_names.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc()
      : super(const CardState(currentIndex: 0, status: CardStatus.initial)) {
    on<OnGoNextEvent>(_onGoNextEvent);
    on<OnReturn>(_onReturn);
  }

  void _onGoNextEvent(OnGoNextEvent event, Emitter<CardState> emit) async {
    final nextIndex = state.copyWith(currentIndex: event.index + 1);
    if (nextIndex.currentIndex != CardNames.cards.length) {
      emit(state.copyWith(
          currentIndex: nextIndex.currentIndex, status: CardStatus.flip));

      await Future.delayed(const Duration(seconds: 2));

      emit(state.copyWith(status: CardStatus.initial));
    }
  }

  void _onReturn(OnReturn event, Emitter<CardState> emit) async {
    final nextCard = state.copyWith(currentIndex: event.index - 1);

    if (nextCard.currentIndex >= 0) {
      emit(state.copyWith(
          currentIndex: nextCard.currentIndex, status: CardStatus.flip));

      await Future.delayed(const Duration(seconds: 1));

      emit(state.copyWith(status: CardStatus.initial));
    } else {
      emit(state.copyWith(currentIndex: 0, status: CardStatus.flip));

      await Future.delayed(const Duration(seconds: 1));

      emit(state.copyWith(status: CardStatus.initial));
    }
  }
}
