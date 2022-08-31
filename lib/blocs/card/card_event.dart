part of 'card_bloc.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object> get props => [];
}

class OnGoNextEvent extends CardEvent {
  final int index;
  final CardStatus status;

  const OnGoNextEvent({required this.index, required this.status});
  @override
  List<Object> get props => [index, status];
}

class OnReturn extends CardEvent {
  final int index;

  OnReturn(this.index);
  @override
  List<Object> get props => [index];
}
