import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageState {
  final int counter1;
  final int counter2;

  MainPageState({required this.counter1, required this.counter2});

  factory MainPageState.i() {
    return MainPageState(
      counter1: 0,
      counter2: 0,
    );
  }

  copyWith({int? counter1, int? counter2}) {
    return MainPageState(
      counter1: counter1 ?? this.counter1,
      counter2: counter2 ?? this.counter2,
    );
  }
}

class MainPageController extends Cubit<MainPageState> {
  MainPageController() : super(MainPageState.i());

  void setScore1(value) => emit(state.copyWith(counter1: value));
  void setScore2(value) => emit(state.copyWith(counter2: value));

  void addScore1() => emit(state.copyWith(counter1: state.counter1 + 1));
  void addScore2() => emit(state.copyWith(counter2: state.counter2 + 1));
}
