part of 'pet_bloc.dart';

abstract class PetEvent extends Equatable {
  const PetEvent();

  @override
  List<Object> get props => [];
}

class PetEventStarted extends PetEvent {
  final Pet pet;

  PetEventStarted({
    @required this.pet,
  });
}

class PetEventScuccess extends PetEvent {
  final Pet pet;

  PetEventScuccess(this.pet);
  @override
  List<Object> get props => [pet];
}

class PetEventFailure extends PetEvent {
  final Errors errors;

  PetEventFailure(this.errors);
  @override
  List<Object> get props => [errors];
}

class PetEventDelete extends PetEvent {
  final int id;

  PetEventDelete(this.id);
  @override
  List<Object> get props => [id];
}

class PetEventUpdate extends PetEvent {
  final int id;
  final bool saled;

  PetEventUpdate(this.id, this.saled);
  @override
  List<Object> get props => [id, saled];
}
