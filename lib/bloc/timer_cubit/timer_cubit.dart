import 'dart:async';

import 'package:bloc/bloc.dart';

class TimerCubit extends Cubit<int> {
  Timer _timer;
  final int initialTime;

  TimerCubit(this.initialTime) : super(initialTime);

  void startTimer() =>
    _timer = Timer.periodic(const Duration(seconds: 1), (timer){
      emit(state - 1);
      if(state == 0) {
        emit(initialTime);
      }
    });


  void stopTimer() => _timer.cancel();

  void resetTimer(){
    stopTimer();
    emit(5);
    startTimer();
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
