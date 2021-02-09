part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class CategoryEventStarted extends CategoryEvent {
  final String category;

  CategoryEventStarted(this.category);
}

class CategoryEventSuccess extends CategoryEvent {
  final List<Pet> pet;

  CategoryEventSuccess({
    @required this.pet,
  });
  @override
  List<Object> get props => [pet];
}

class CategoryEventFailure extends CategoryEvent {
  final Errors errors;

  CategoryEventFailure(this.errors);
  @override
  List<Object> get props => [errors];
}
