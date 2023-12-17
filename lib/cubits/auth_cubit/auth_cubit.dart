import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? name;
  String? lastName;
  String? email;
  String? password;
  GlobalKey<FormState> formKeyForSignUp = GlobalKey();
  GlobalKey<FormState> formKeyForSignIn = GlobalKey();
  GlobalKey<FormState> formKeyForForgotPassword = GlobalKey();
  bool? obscurePasswordTextValue = true;
  bool? termsAndConditionCheckVox;

  Future<void> signUpUserWithEmailAndPassword() async {
    try {
      emit(SignUpLoading());

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      await addUser();
      await verifyEmail();
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(
          SignUpFailure('The password provided is too weak'),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          SignUpFailure('The account already exists for that email.'),
        );
      } else if (e.code == 'invalid-email') {
        emit(
          SignUpFailure('The email is invalid.'),
        );
      } else {
        emit(
          SignInFailure(e.code),
        );
      }
    } catch (e) {
      // emit(
      //   SignUpFailure(e.toString()),
      // );
    }
  }

  Future<void> signInUserWithEmailAndPassword() async {
    try {
      emit(SignInLoading());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(
          SignInFailure('No user found for that email.'),
        );
      } else if (e.code == 'wrong-password') {
        emit(
          SignInFailure('Wrong password provided for that user.'),
        );
      } else {
        emit(
          SignInFailure('Check your email and password.'),
        );
      }
    } catch (e) {
      // emit(
      //   SignInFailure(e.toString()),
      // );
    }
  }

  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future<void> sendLinkToEmailForForgotPassword() async {
    try {
      emit(ForgotPasswordLoading());
      FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
      emit(ForgotPasswordSuccess());
    } catch (e) {
      emit(ForgotPasswordFailure('This email does not exist'));
    }
  }

  Future<void> addUser() async {
    // Call the user's CollectionReference to add a new user
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.add({
      'email': email,
      'first_name': name, // John Doe
      'last_name': lastName,
      'password': password, // Stokes and Sons
    });
  }

  void updateTermsAndConditionCheckVox({required newValue}) {
    termsAndConditionCheckVox = newValue;
    emit(TermsAndConditionUpdateCheckVoxState());
  }

  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }
}
