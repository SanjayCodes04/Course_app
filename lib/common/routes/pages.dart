import 'package:courseapp/common/routes/names.dart';
import 'package:courseapp/global.dart';
import 'package:courseapp/pages/application/application_page.dart';
import 'package:courseapp/pages/application/bloc/app_blocs.dart';
import 'package:courseapp/pages/register/bloc/register_bloc.dart';
import 'package:courseapp/pages/register/register.dart';
import 'package:courseapp/pages/sign_in/bloc/sing_in_blocs.dart';
import 'package:courseapp/pages/sign_in/sign_in.dart';
import 'package:courseapp/pages/welcome/bloc/welcome_bloc.dart';
import 'package:courseapp/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBlocs()),
      ),
    ];
  }

  // return all the bloc providers.
  static List<dynamic> allProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a model that covers entore screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // check for route name matching when navigator gets triggered
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();

          // checking if the user is logged in and if true directly go to the apllication page
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("invalid route name ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

// unify bloc providers and routes and pages...
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
