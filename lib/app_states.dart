class AppStates<int> {
  int counter;
  AppStates({required this.counter});
}

class InitStates extends AppStates {
  InitStates()
      : super(
            counter: -2); // Counter value is initialized by calling this class
}
