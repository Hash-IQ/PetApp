import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/errors/error.dart';
import '../../../domain/entity/pet.dart';
import '../../../domain/repository/pet_repo.dart';

part 'mypet_event.dart';
part 'mypet_state.dart';

class MypetBloc extends Bloc<MypetEvent, MypetState> {
  MypetBloc({
    @required this.petRepo,
  }) : super(MypetInitial());
  final PetRepo petRepo;
  @override
  Stream<MypetState> mapEventToState(
    MypetEvent event,
  ) async* {
    if (event is MypetEventStarted) {
      yield MypetInProgress();
      var res = await petRepo.myPet();
      yield res.fold(
        (l) => MypetFailure(l),
        (r) => MypetSuccess(pet: r),
      );
    } else if (event is MypetEventSuccess) {
      yield MypetSuccess(pet: event.pet);
    } else if (event is MypetEventFailure) {
      yield MypetFailure(event.errors);
    }
  }
}
