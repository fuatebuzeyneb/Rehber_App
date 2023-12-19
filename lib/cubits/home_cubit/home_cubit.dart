import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/model/historical_characters_model.dart';
import 'package:travel_app/model/historical_periodes_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<HistoricalPeriodsModel> historicalPeriodsList = [];
  List<HistoricalCharacters> historicalCharactersList = [];
  Future<void> getPeriodsInFirebase() async {
    try {
      emit(HomePeriodsLoading());
      await FirebaseFirestore.instance
          .collection('historical_periods')
          .get()
          .then(
            (value) => value.docs.forEach(
              (element) {
                historicalPeriodsList.add(
                  HistoricalPeriodsModel.fromJson(
                    element.data(),
                  ),
                );
              },
            ),
          );
      emit(HomePeriodsSuccess());
    } on Exception catch (e) {
      emit(HomePeriodsFailure(e.toString()));
      // TODO
    }
  }

  Future<void> getCharactersInFirebase() async {
    try {
      emit(HomeCharactersLoading());
      FirebaseFirestore.instance.collection('historical_characters').get().then(
            (value) => value.docs.forEach(
              (element) {
                historicalCharactersList.add(
                  HistoricalCharacters.fromJson(
                    element.data(),
                  ),
                );
              },
            ),
          );
      emit(HomeCharactersSuccess());
    } on Exception catch (e) {
      emit(HomeCharactersFailure(e.toString()));
    }
  }
}
