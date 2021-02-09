part of 'mypet_bloc.dart';

abstract class MypetEvent extends Equatable {
  const MypetEvent();

  @override
  List<Object> get props => [];
}

class MypetEventStarted extends MypetEvent {}

class MypetEventSuccess extends MypetEvent {
  final List<Pet> pet;

  MypetEventSuccess({
    @required this.pet,
  });
  @override
  List<Object> get props => [pet];
}

class MypetEventFailure extends MypetEvent {
  final Errors errors;

  MypetEventFailure(this.errors);
  @override
  List<Object> get props => [errors];
}
