part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class CounterHasValue extends CounterState {
  final int counterValue;
  CounterHasValue(this.counterValue);
}
