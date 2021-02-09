part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryInProgress extends CategoryState {}

class CategoryFailure extends CategoryState {
  final Errors errors;

  CategoryFailure(this.errors);
  @override
  List<Object> get props => [errors];
}

class CategorySuccess extends CategoryState {
  final List<Pet> pet;

  CategorySuccess({@required this.pet});
  @override
  List<Object> get props => [pet];
}
