import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

part 'add_to_firebase_state.dart';

class AddToFirebaseCubit extends Cubit<AddToFirebaseState> {
  AddToFirebaseCubit() : super(AddToFirebaseInitial());

  String? name;
  String? image;
  String? description;
  GlobalKey<FormState> formKeyForAdd = GlobalKey();

  Future<void> addUser() async {
    // Call the user's CollectionReference to add a new user
    CollectionReference users =
        FirebaseFirestore.instance.collection('historical_periods');
    await users.add({
      'name': name,
      'image': image, // John Doe
      'description': description,
    });
  }
}
