class SignInState {
  final String email;
  final String password;
  const SignInState({
    this.email = "",
    this.password = "",
  });

  /// if your classes or objects are immutable and you want to create a new objects based on that
  SignInState copyWith({
    // optional named parameters
    String? email,
    String? password,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
