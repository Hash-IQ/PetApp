part of 'pet_bloc.dart';

abstract class PetState extends Equatable {
  const PetState();

  @override
  List<Object> get props => [];
}

class PetInitial extends PetState {}

class PetInProgress extends PetState {}

class PetFailure extends PetState {
  final Errors errors;

  PetFailure(this.errors);
  @override
  List<Object> get props => [errors];
}

class PetSuccess extends PetState {
  final Pet pet;

  PetSuccess({
    @required this.pet,
  });
  @override
  List<Object> get props => [pet];
}

class PetDeleteSuccess extends PetState {
  List<Object> get props => [];
}

class Petupdate extends PetState {
  final Pet pet;

  Petupdate(this.pet);
  List<Object> get props => [pet];
}
