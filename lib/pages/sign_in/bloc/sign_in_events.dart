// because the blocs are created, events are triggered

abstract class SignInEvents {
  const SignInEvents();
}

class EmailEvent extends SignInEvents {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends SignInEvents {
  final String password;
  const PasswordEvent(this.password);
}
