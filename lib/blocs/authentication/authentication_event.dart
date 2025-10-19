part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class RequestToCheckAuthentication extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
