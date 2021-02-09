import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/errors/error.dart';
import '../../../domain/entity/pet.dart';
import '../../../domain/repository/pet_repo.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({
    @required this.petRepo,
  }) : super(CategoryInitial());

  final PetRepo petRepo;

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is CategoryEventStarted) {
      yield CategoryInProgress();
      var res = await petRepo.categoryPet(event.category);
      yield res.fold(
        (l) => CategoryFailure(l),
        (r) => CategorySuccess(pet: r),
      );
    } else if (event is CategoryEventSuccess) {
      print(event.pet);
      yield CategorySuccess(pet: event.pet);
    } else if (event is CategoryEventFailure) {
      yield CategoryFailure(event.errors);
    }
  }
}
