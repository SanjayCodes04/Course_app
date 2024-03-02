// thread safe

class RegisterStates {
  /// we want to keep it safe, we dont want outside events to change it.
  final String userName;
  final String email;
  final String password;
  final String rePassword;

  /// when we have immutable objects, you want to make constuctor immutable.
  const RegisterStates(

      /// optional named paramets
      {this.userName = "",
      this.email = "",
      this.password = "",
      this.rePassword = ""});

  RegisterStates copyWith({
    String? userName,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterStates(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword);
  }
}
