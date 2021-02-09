part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchInprogress extends SearchState {

}

class SearchFailure extends SearchState {
  final Errors errors;

  SearchFailure({this.errors});

  @override
  List<Object> get props => [errors];
}

class SearchSuccess extends SearchState {
  final List<Pet> pet;

  SearchSuccess({this.pet});
  @override
  List<Object> get props => [pet];
}
