import 'package:courseapp/pages/application/bloc/app_events.dart';
import 'package:courseapp/pages/application/bloc/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvent, AppState> {
  AppBlocs() : super(const AppState()) {
    on<TriggerAppEvent>((event, emit) {
      // print("My tapped index is ${event.index}");
      emit(AppState(index: event.index));
    });
  }
}
