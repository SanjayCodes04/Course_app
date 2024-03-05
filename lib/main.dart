import 'package:courseapp/common/routes/routes.dart';
import 'package:courseapp/common/values/colors.dart';
import 'package:courseapp/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// "Future<void> main() async {": This is the entry point of the Flutter application.
/// The main function is asynchronous (async), and it returns a Future<void>.
/// It is responsible for initializing the Flutter app and running it.
Future<void> main() async {
  await Global.init();

  /// <runApp(const MyApp());>: This function call runs the Flutter application and specifies the root widget as an instance of the MyApp class.
  runApp(const MyApp());
}

/// <class MyApp extends StatelessWidget { const MyApp({super.key});>: This defines a class named MyApp that extends StatelessWidget.
/// This widget represents the root of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// <return MultiBlocProvider(providers: AppBlocProviders.addBlocProviders, child: ScreenUtilInit(...));>:
    /// This wraps the entire application with multiple BLoC (Business Logic Component) providers using MultiBlocProvider.
    /// It also includes a ScreenUtilInit widget, which initializes the screen utility for responsive design.
    return MultiBlocProvider(
      providers: [...AppPages.allProviders(context)],
      child: ScreenUtilInit(
        /// <builder: (context, child) => MaterialApp(...),>: Inside ScreenUtilInit, this sets up a MaterialApp, which is a basic structure for a Flutter app.
        /// It provides theming, routing, and other configurations
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,

          /// theme: ThemeData(appBarTheme: const AppBarTheme(elevation: 0, backgroundColor: Colors.white)),:
          /// This sets the overall theme for the app, specifically configuring the app bar to have no elevation and a white background.
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: AppColors.primaryText),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),
          onGenerateRoute: AppPages.GenerateRouteSettings,
        ),
      ),
    );
  }
}
