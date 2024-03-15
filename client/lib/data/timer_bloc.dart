import 'dart:async';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';

const defaultTickRate = 1.0;

Duration calculatePeriod(double tickRate) {
  return Duration(milliseconds: (1000 / tickRate).round());
}

class TimerState {
  // tickRate is the number of game ticks per second
  final double tickRate;
  final Timer? timer;
  final VoidCallback? callback;

  const TimerState({
    required this.tickRate,
    this.timer,
    this.callback,
  });

  // builds and executes a timer state object with a given tick rate and callback
  TimerState build({
    required double tickRate,
    VoidCallback? callback,
  }) {
    if (callback == null) {
      return TimerState(tickRate: tickRate);
    } else {
      final period = calculatePeriod(tickRate);
      final newTimer = Timer.periodic(
        period,
        (_) => callback(),
      );
      return TimerState(
        tickRate: tickRate,
        timer: newTimer,
        callback: callback,
      );
    }
  }
}

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerState(tickRate: defaultTickRate));

  // modifies the game ticking function
  void setPeriodicFunction(VoidCallback callback) {
    state.timer?.cancel();
    final newState = state.build(
      tickRate: state.tickRate,
      callback: callback,
    );
    emit(newState);
  }

  // modifies the tick rate of the game
  // not for general use, only for dev playtesting
  void setTickRate(double newTickRate) {
    state.timer?.cancel();
    final newState = state.build(
      tickRate: newTickRate,
      callback: state.callback,
    );
    emit(newState);
  }
}
