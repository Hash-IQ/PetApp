part of 'district_bloc.dart';

abstract class DistrictState extends Equatable {
  const DistrictState();

  @override
  List<Object> get props => [];
}

class DistrictInitial extends DistrictState {}

class DistrictInProgres extends DistrictState {
  @override
  List<Object> get props => [];
}

class DistrictSuccess extends DistrictState {
  final List<Location> location;

  DistrictSuccess({
    @required this.location,
  });
  @override
  List<Object> get props => [location];
}

class DistrictFailure extends DistrictState {
  final Errors errors;

  DistrictFailure({
    @required this.errors,
  });
  @override
  List<Object> get props => [errors];
}
