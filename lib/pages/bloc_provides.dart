import 'package:courseapp/app_blocs.dart';
import 'package:courseapp/pages/register/bloc/register_bloc.dart';
import 'package:courseapp/pages/sign_in/bloc/sing_in_blocs.dart';
import 'package:courseapp/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get addBlocProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBlocs(),
        ),
        BlocProvider(
          create: (context) => RegisterBlocs(),
        ),
      ];
}
