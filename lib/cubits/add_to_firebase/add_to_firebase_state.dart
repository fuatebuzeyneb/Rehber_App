part of 'add_to_firebase_cubit.dart';

@immutable
sealed class AddToFirebaseState {}

final class AddToFirebaseInitial extends AddToFirebaseState {}

final class AddToFirebaseLoading extends AddToFirebaseState {}

final class AddToFirebaseSuccess extends AddToFirebaseState {}

final class AddToFirebaseFailure extends AddToFirebaseState {
  final String errorMsg;

  AddToFirebaseFailure(this.errorMsg);
}
