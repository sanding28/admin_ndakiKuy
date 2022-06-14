// ignore_for_file: prefer_const_constructors_in_immutables

part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSucess extends AuthState{
  // tambahkan paramater user, dan buat model admins.
  final AdminModel user;

  AuthSucess(this.user);

  @override
  List<Object> get props => [user];
}

class AuthFailed extends AuthState{
  final String error;

  AuthFailed(this.error);

  @override
  List<Object> get props => [error];
}
