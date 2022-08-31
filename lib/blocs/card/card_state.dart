part of 'card_bloc.dart';

enum CardStatus { initial, flip, error }

class CardState extends Equatable {
  final CardStatus status;
  final int currentIndex;

  const CardState({required this.status, required this.currentIndex});

  CardState copyWith({int? currentIndex, CardStatus? status}) => CardState(
      status: status ?? this.status,
      currentIndex: currentIndex ?? this.currentIndex);

  @override
  List<Object> get props => [status, currentIndex];
}
