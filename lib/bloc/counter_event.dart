part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

final class CounterAddedOne extends CounterEvent {}

final class CounterMinsOne extends CounterEvent {}

final class CounterResetToZero extends CounterEvent {}
