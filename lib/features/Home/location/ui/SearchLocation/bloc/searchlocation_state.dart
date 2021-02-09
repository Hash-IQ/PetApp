part of 'searchlocation_bloc.dart';

abstract class SearchlocationState extends Equatable {
  const SearchlocationState();

  @override
  List<Object> get props => [];
}

class SearchlocationInitial extends SearchlocationState {}

class SearchlocationInprogress extends SearchlocationState {
  @override
  List<Object> get props => [];
}


class SearchlocationFailure extends SearchlocationState {
  final Errors errors;

  SearchlocationFailure({
    @required this.errors,
  });
  @override
  List<Object> get props => [errors];
}


class SearchlocationSuccess extends SearchlocationState {
  final List<Location> location;

  SearchlocationSuccess({
    @required this.location,
  });
  @override
  List<Object> get props => [location];
}
