import 'package:bloc/bloc.dart';
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
  bool? obscurePasswordTextValue = true;
  bool? termsAndConditionCheckVox;
  Future<void> signUpUserWithEmailAndPassword() async {
    try {
      emit(AuthLoading());

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(
          AuthFailure('The password provided is too weak'),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          AuthFailure('The account already exists for that email.'),
        );
      }
    } catch (e) {
      // emit(
      //   AuthFailure(e.toString()),
      // );
    }
  }

  Future<void> signInUserWithEmailAndPassword() async {
    try {
      emit(AuthLoading());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(
          AuthFailure('No user found for that email.'),
        );
      } else if (e.code == 'wrong-password') {
        emit(
          AuthFailure('Wrong password provided for that user.'),
        );
      }
    } catch (e) {
      // emit(
      //   AuthFailure(e.toString()),
      // );
    }
  }

  updateTermsAndConditionCheckVox({required newValue}) {
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
