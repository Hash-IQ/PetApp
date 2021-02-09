import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/errors/error.dart';
import '../../../domain/entity/pet.dart';
import '../../../domain/repository/pet_repo.dart';

part 'getpet_event.dart';
part 'getpet_state.dart';

class GetpetBloc extends Bloc<GetpetEvent, GetpetState> {
  GetpetBloc({
    @required this.petRepo,
  }) : super(GetpetInitial());

  final PetRepo petRepo;

  @override
  Stream<GetpetState> mapEventToState(
    GetpetEvent event,
  ) async* {
    if (event is GetpetEventStarted) {
      yield GetpetInProgress();
      var res = await petRepo.getpet();
      yield res.fold(
        (l) => GetpetFailure(l),
        (r) => GetpetSucess(pet: r),
      );
    } else if (event is GetpetEventSuccess) {
      yield GetpetSucess(pet: event.pet);
    } else if (event is GetpetEventFailure) {
      yield GetpetFailure(event.errors);
    }
  }
}
