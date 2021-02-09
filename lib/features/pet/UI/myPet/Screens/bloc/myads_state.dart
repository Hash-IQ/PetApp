part of 'myads_bloc.dart';

abstract class MyadsState extends Equatable {
  const MyadsState();

  @override
  List<Object> get props => [];
}

class MyadsInitial extends MyadsState {}

class MyadsInProgress extends MyadsState {}

class MyadFailureState extends MyadsState {
  final Errors errors;
  const MyadFailureState(this.errors);

  @override
  List<Object> get props => [errors];
}

class MyadsSuccessState extends MyadsState {
  final Pet pets;
  const MyadsSuccessState({@required this.pets});

  @override
  List<Object> get props => [pets];
}
