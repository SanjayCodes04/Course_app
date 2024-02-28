// thread safe

class RegisterStates {
  /// we want to keep it safe, we dont want outside events to change it.
  final String userName;
  final String email;
  final String password;
  final String rePassword;

  /// when we have immutable objects, you want to make constuctor immutable.
  const RegisterStates(
      this.userName, this.email, this.password, this.rePassword);

  RegisterStates copyWith({
    String? userName,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterStates(userName ?? this.userName, email ?? this.email,
        password ?? this.password, rePassword ?? this.rePassword);
  }
}
