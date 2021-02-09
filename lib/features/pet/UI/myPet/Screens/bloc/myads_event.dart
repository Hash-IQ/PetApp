part of 'myads_bloc.dart';

abstract class MyadsEvent extends Equatable {
  const MyadsEvent();

  @override
  List<Object> get props => [];
}

class MyadStartEvent extends MyadsEvent {
  final int id;
  final Pet pet;
  MyadStartEvent({
    this.pet,
    this.id,
  });
}

class MyadsSuccessEvent extends MyadsEvent {
  final Pet pets;
  const MyadsSuccessEvent({
    @required this.pets,
  });

  @override
  List<Object> get props => [pets];
}

class MyadsFailureEvent extends MyadsEvent {
  final Errors errors;
  const MyadsFailureEvent({this.errors});

  @override
  List<Object> get props => [errors];
}
