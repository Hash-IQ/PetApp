part of 'getpet_bloc.dart';

abstract class GetpetState extends Equatable {
  const GetpetState();

  @override
  List<Object> get props => [];
}

class GetpetInitial extends GetpetState {}

class GetpetInProgress extends GetpetState {}

class GetpetFailure extends GetpetState {
  final Errors errors;

  GetpetFailure(this.errors);
  @override
  List<Object> get props => [errors];
}

class GetpetSucess extends GetpetState {
  final List<Pet> pet;

  GetpetSucess({@required this.pet});
  @override
  List<Object> get props => [pet];
}
