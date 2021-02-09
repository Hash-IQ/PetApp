part of 'mypet_bloc.dart';

abstract class MypetState extends Equatable {
  const MypetState();

  @override
  List<Object> get props => [];
}

class MypetInitial extends MypetState {}

class MypetInProgress extends MypetState {}

class MypetSuccess extends MypetState {
  final List<Pet> pet;

  MypetSuccess({
    @required this.pet,
  });
  @override
  List<Object> get props => [pet];
}

class MypetFailure extends MypetState {
  final Errors errors;

  MypetFailure(this.errors);
  @override
  List<Object> get props => [errors];
}
