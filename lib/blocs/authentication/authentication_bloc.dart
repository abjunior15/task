import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';

import '../../data/shared_prefs_repo.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SharedPrefsRepository _sharedPrefsRepository;
  final Logger _logger = Logger('AuthenticationBloc');

  AuthenticationBloc({
    required SharedPrefsRepository sharedPrefsRepository,
  })  : _sharedPrefsRepository = sharedPrefsRepository,
        super(const AuthenticationState()) {
    on<AuthenticationEvent>(_onAuthenticationEvent);
    on<RequestToCheckAuthentication>(_onRequestToCheckAuthentication);
  }

  void _onAuthenticationEvent(
    AuthenticationEvent event,
    Emitter<AuthenticationState> emit,
  ) async {}

  void _onRequestToCheckAuthentication(
    RequestToCheckAuthentication event,
    Emitter<AuthenticationState> emit,
  ) async {
    // check from login response that user has user role
    final token = _sharedPrefsRepository.getToken();
    final userId = _sharedPrefsRepository.getUserId();

    _logger
        .info('Checking authentication status ${state.status}  $token $userId');

    if (token != null && userId != null) {
      emit(
        state.copyWith(
          status: AuthenticationStatus.authenticated,
          isfirstTimeOpen: _sharedPrefsRepository.isFirstTimeOpen,
        ),
      );
      _logger.info('Checking authentication status ${state.status} ');
    } else {
      emit(
        state.copyWith(
          status: AuthenticationStatus.unauthenticated,
          isfirstTimeOpen: _sharedPrefsRepository.isFirstTimeOpen,
        ),
      );
      _logger.info('Checking authentication status  ${state.status}');
    }
  }
}
