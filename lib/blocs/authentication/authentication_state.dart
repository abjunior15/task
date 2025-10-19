part of 'authentication_bloc.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final bool isfirstTimeOpen;

  const AuthenticationState({
    this.status = AuthenticationStatus.unknown,
    this.isfirstTimeOpen = false,
  });

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    final bool? isfirstTimeOpen,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      isfirstTimeOpen: isfirstTimeOpen ?? this.isfirstTimeOpen,
    );
  }

  @override
  List<Object> get props => [
        status,
        isfirstTimeOpen,
      ];
}
