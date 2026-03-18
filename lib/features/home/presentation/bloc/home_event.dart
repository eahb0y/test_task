import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => <Object?>[];
}

class HomeRequested extends HomeEvent {
  const HomeRequested();
}

class HomeRefreshed extends HomeEvent {
  const HomeRefreshed();
}
