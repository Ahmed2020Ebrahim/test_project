import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is CounterAddedOne) {
        counter += 1;
        emit(CounterHasValue(counter));
      } else if (event is CounterMinsOne) {
        counter -= 1;
        emit(CounterHasValue(counter));
      } else {
        counter = 0;
        emit(CounterHasValue(0));
      }
    });
  }
}
