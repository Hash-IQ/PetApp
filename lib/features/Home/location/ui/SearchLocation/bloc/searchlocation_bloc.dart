import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:petapp/core/errors/error.dart';
import 'package:petapp/features/Home/location/domain/entity/location.dart';
import 'package:petapp/features/Home/location/domain/repository/location_repo.dart';

part 'searchlocation_event.dart';
part 'searchlocation_state.dart';

class SearchlocationBloc
    extends Bloc<SearchlocationEvent, SearchlocationState> {
  final LocationRepo locationRepo;

  SearchlocationBloc({
    @required this.locationRepo,
  }) : super(SearchlocationInitial());

  @override
  Stream<SearchlocationState> mapEventToState(
    SearchlocationEvent event,
  ) async* {
    if (event is SearchLocationEventStarted) {
      yield SearchlocationInprogress();
      var res = await locationRepo.searchLocation(event.name);
      res.fold(
        (l) => SearchlocationFailure(errors: l),
        (r) => SearchlocationSuccess(location: r),
      );
    } else if (event is SearchlocationEventSuccess) {
      yield SearchlocationSuccess(location: event.location);
    } else if (event is SearchlocationEventFailure) {
      yield SearchlocationFailure(errors: event.errors);
    }
  }
}
