part of 'searchlocation_bloc.dart';

abstract class SearchlocationEvent extends Equatable {
  const SearchlocationEvent();

  @override
  List<Object> get props => [];
}

class SearchLocationEventStarted extends SearchlocationEvent {
  final String name;

  SearchLocationEventStarted({
    @required this.name,
  });
 
}

class SearchlocationEventSuccess extends SearchlocationEvent {
  final List<Location> location;
  const SearchlocationEventSuccess({@required this.location});

  @override
  List<Object> get props => [location];
}

class SearchlocationEventFailure extends SearchlocationEvent {
  final Errors errors;
  const SearchlocationEventFailure({
    @required this.errors,
  });

  @override
  List<Object> get props => [errors];
}
