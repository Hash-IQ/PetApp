import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/errors/error.dart';
import '../../../domain/entity/pet.dart';
import '../../../domain/repository/pet_repo.dart';

part 'pet_event.dart';
part 'pet_state.dart';

class PetBloc extends Bloc<PetEvent, PetState> {
  PetBloc({
    @required this.petRepo,
  }) : super(PetInitial());
  final PetRepo petRepo;
  List<Pet> petdata = [];
  @override
  Stream<PetState> mapEventToState(
    PetEvent event,
  ) async* {
    if (event is PetEventStarted) {
      yield PetInProgress();
      var res = await petRepo.createPet(event.pet);
      yield res.fold(
        (l) => PetFailure(l),
        (r) => PetSuccess(pet: r),
      );
    } else if (event is PetEventScuccess) {
      //  petdata =event.pet;
      yield PetSuccess(pet: event.pet);
    }
  }
}
