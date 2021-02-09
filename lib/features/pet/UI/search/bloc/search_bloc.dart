import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/errors/error.dart';
import '../../../domain/entity/pet.dart';
import '../../../domain/repository/pet_repo.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    @required this.petRepo,
  }) : super(SearchInitial());
  final PetRepo petRepo;
  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchEventStarted) {
      yield SearchInprogress();
      var res = await petRepo.searchPet(event.petName);
      yield res.fold(
        (l) => SearchFailure(errors: l),
        (r) => SearchSuccess(pet: r),
      );
    } else if (event is SearchEventSuccess) {
      yield SearchSuccess(pet: event.pet);
    } else if (event is SearchEventFailure) {
      yield SearchFailure(errors: event.errors);
    }
  }
}
