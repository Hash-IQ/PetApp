import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:petapp/core/errors/error.dart';
import 'package:petapp/features/Home/location/domain/entity/location.dart';
import 'package:petapp/features/Home/location/domain/repository/location_repo.dart';

part 'district_event.dart';
part 'district_state.dart';

class DistrictBloc extends Bloc<DistrictEvent, DistrictState> {
  final LocationRepo locationRepo;
  DistrictBloc({
    @required this.locationRepo,
  }) : super(DistrictInitial());

  @override
  Stream<DistrictState> mapEventToState(
    DistrictEvent event,
  ) async* {
    if (event is DistrictEventStarted) {
      yield DistrictInProgres();
      var res = await locationRepo.getLocationBasedDistrict(event.district);
      yield res.fold(
        (l) => DistrictFailure(errors: l),
        (r) => DistrictSuccess(location: r),
      );
    }else if(event is DistrictEventSuccess){
      yield DistrictSuccess(location: event.location);
    }else if(event is DistrictEventFailure){
      yield DistrictFailure(errors: event.errors);
    }
  }
}
