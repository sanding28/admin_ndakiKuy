part of 'basecamp_cubit.dart';

abstract class BasecampState extends Equatable {
  const BasecampState();

  @override
  List<Object> get props => [];
}

class BasecampInitial extends BasecampState {}

class BasecampLoading extends BasecampState{}

class BasecampSuccess extends BasecampState{
  final List<BasecampModel> basecamp;

  BasecampSuccess(this.basecamp);

  @override
  List<Object> get props => [basecamp];
}

class BasecampFailed extends BasecampState{
  final String error;

  BasecampFailed(this.error);

  @override
  List<Object> get props => [error];
}
