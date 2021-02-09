import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../core/errors/error.dart';
import '../../../../domain/entity/pet.dart';
import '../../../../domain/repository/pet_repo.dart';

part 'myads_event.dart';
part 'myads_state.dart';

class MyadsBloc extends Bloc<MyadsEvent, MyadsState> {
  final int id;
  final PetRepo petRepo;
  final Pet pet;
  MyadsBloc({
    @required this.id,
    @required this.petRepo,
    @required this.pet,
  }) : super(MyadsInitial());

  @override
  Stream<MyadsState> mapEventToState(
    MyadsEvent event,
  ) async* {
    if (event is MyadStartEvent) {
      yield MyadsInProgress();

      var res = await petRepo.updaePet(id, pet);
      res.fold(
        (l) => MyadFailureState(l),
        (r) => MyadsSuccessState(pets: r),
      );
    } else if (event is MyadsSuccessEvent) {
      yield MyadsSuccessState(pets: event.pets);
    } else if (event is MyadsFailureEvent) {
      yield MyadFailureState(event.errors);
    }
  }
}
