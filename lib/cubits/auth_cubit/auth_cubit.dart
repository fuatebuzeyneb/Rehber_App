import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  late String? name;
  late String? lastName;
  late String? email;
  late String? password;
  Future<void> signUpUserWithEmailAndPassword() async {
    try {
      emit(AuthLoading());
      final credential =
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
      print(e);
    }
  }

  Future<void> signInUserWithEmailAndPassword() async {
    try {
      emit(AuthLoading());
      final credential = await FirebaseAuth.instance
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
      print(e);
    }
  }
}
