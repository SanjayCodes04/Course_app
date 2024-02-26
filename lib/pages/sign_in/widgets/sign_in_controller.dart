import 'package:courseapp/pages/sign_in/bloc/sing_in_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBlocs>().state;

        // accessing the email address using the state variable which reads <SignInBlocs>
        String emailAddress = state.email;
        String password = state.password;

        // checking ig the email and password is empty
        if (emailAddress.isEmpty) {
          //
          print("Email Empty");
        }
        if (password.isEmpty) {
          //
          print("Password Empty");
        }

        /**try and catch are used for error handling. The code inside the try block is attempted, and if any exceptions (errors) occur during the execution of this block, the program will jump to the catch block to handle the error.
         
        await: This keyword is used to wait for the result of an asynchronous operation. In this case, it is used with the signInWithEmailAndPassword method, indicating that the program will wait for the authentication to complete before proceeding to the next line.

        FirebaseAuth.instance: This suggests that the code is using Firebase Authentication. FirebaseAuth is an instance of the Firebase Authentication service.

        signInWithEmailAndPassword: This method is used for signing in a user with their email and password. It takes two parameters - email and password.

        emailAddress and password: These are presumably variables holding the user's email address and password, which are passed as arguments to the signInWithEmailAndPassword method.

        The result of the sign-in operation is stored in the credentials variable. The type of credentials will depend on the return type of signInWithEmailAndPassword in the specific library or API being used.
        */
        try {
          final credentials = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          // checking for the user
          if (credentials.user == null) {
            //
            print("User does not exist");
          }
          // checking for the email verification
          if (!credentials.user!.emailVerified) {
            //
            print("Not Verified");
          }

          var user = credentials.user;
          if (user != null) {
            //we got verified user from firebase
            print("User exists");
          } else {
            //we have error getting user from firebase
            print("No User");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            print("No user found for that email");
          } else if (e.code == "wrong-password") {
            print("Wrong password provided for that user");
          } else if (e.code == "invalid-email") {
            print("Your email format is worng");
          }
        }
      }
    } catch (e) {}
  }
}
