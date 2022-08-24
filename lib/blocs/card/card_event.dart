part of 'card_bloc.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object> get props => [];
}

class OnFlipEvent extends CardEvent {
  final String path;
  final CardStatus status;

  const OnFlipEvent({required this.path, required this.status});
  @override
  List<Object> get props => [path];
}
