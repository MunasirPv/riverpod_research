import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/counter_three/counter_state.dart';

class CounterStateNotifier extends StateNotifier<CounterState> {
  CounterStateNotifier() : super(CounterState(0));

  void increment() {
    state = CounterState(state.counter + 1);
  }

  void decrement() {
    state = CounterState(state.counter - 1);
  }
}
