part of 'district_bloc.dart';

abstract class DistrictEvent extends Equatable {
  const DistrictEvent();

  @override
  List<Object> get props => [];
}

class DistrictEventStarted extends DistrictEvent {
  final String district;

  DistrictEventStarted({
    @required this.district,
  });
  @override
  List<Object> get props => [district];
}

class DistrictEventSuccess extends DistrictEvent {
  final List<Location> location;

  DistrictEventSuccess({
    @required this.location,
  });
  @override
  List<Object> get props => [location];
}

class DistrictEventFailure extends DistrictEvent {
  final Errors errors;

  DistrictEventFailure({
    @required this.errors,
  });
  @override
  List<Object> get props => [errors];
}
