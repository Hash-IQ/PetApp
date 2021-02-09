part of 'getpet_bloc.dart';

abstract class GetpetEvent extends Equatable {
  const GetpetEvent();

  @override
  List<Object> get props => [];
}

class GetpetEventStarted extends GetpetEvent {}

class GetpetEventSuccess extends GetpetEvent {
  final List<Pet> pet;

  GetpetEventSuccess({
    @required this.pet,
  });
   @override
  List<Object> get props => [pet];

}
class GetpetEventFailure extends GetpetEvent{
  final Errors errors;

  GetpetEventFailure(this.errors);
    @override
  List<Object> get props => [errors];
}