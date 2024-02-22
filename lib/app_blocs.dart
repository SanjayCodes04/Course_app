import 'package:courseapp/app_events.dart';
import 'package:courseapp/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(InitStates()) {
    on<Increment>((event, emmit) {
      emit(AppStates(
          counter: state.counter +
              1)); // emit means doing things // state variable is assigned automatically as it extends AppStates class
    });
    on<Decrement>((event, emit) {
      emit(AppStates(counter: state.counter - 1));
    });
  }
}
