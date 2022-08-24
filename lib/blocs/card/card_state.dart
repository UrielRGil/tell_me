part of 'card_bloc.dart';

enum CardStatus { initial, flip, error }

class CardState extends Equatable {
  final CardStatus status;
  final String path;

  const CardState({required this.status, required this.path});

  CardState copyWith({String? path, CardStatus? status}) =>
      CardState(status: status ?? this.status, path: path ?? this.path);

  @override
  List<Object> get props => [status, path];
}
