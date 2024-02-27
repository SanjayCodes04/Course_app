import 'package:courseapp/pages/sign_in/bloc/sigin_in_states.dart';
import 'package:courseapp/pages/sign_in/bloc/sign_in_events.dart';
import 'package:courseapp/pages/sign_in/bloc/sing_in_blocs.dart';
import 'package:courseapp/pages/sign_in/widgets/sign_in_controller.dart';
import 'package:courseapp/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBlocs, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLgin(context),
                  Center(
                      child:
                          reusableText("Or use your email account to login")),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        SizedBox(height: 5.h),
                        buildTextField(
                            "Enter your email address", "email", "user",
                            (value) {
                          context.read<SignInBlocs>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        SizedBox(height: 5.h),
                        buildTextField(
                            "Enter your password", "password", "lock", (value) {
                          context.read<SignInBlocs>().add(PasswordEvent(value));
                        }),
                      ],
                    ),
                  ),
                  forgotPassword(),
                  buildLoginAndRegButton("Log In", "login", () {
                    // print("Login Button");
                    SignInController(context: context).handleSignIn("email");
                  }),
                  buildLoginAndRegButton("Register", "register", () {
                    Navigator.of(context).pushNamed("register");
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
