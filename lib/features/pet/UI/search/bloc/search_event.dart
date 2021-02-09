part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];

 
}

class SearchEventStarted extends SearchEvent {
  final String petName;

  SearchEventStarted(this.petName);
  
}

class SearchEventSuccess extends SearchEvent {
  final List<Pet> pet;

  SearchEventSuccess({@required this.pet});
  @override
  List<Object> get props => [pet];
}

class SearchEventFailure extends SearchEvent {
  final Errors errors;

  SearchEventFailure({@required this.errors});
  @override
  List<Object> get props => [errors];
}
