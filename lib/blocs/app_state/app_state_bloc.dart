import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:logging/logging.dart';
import 'app_state_event.dart';
part 'app_state_state.dart';

class AppStateBloc extends Bloc<AppStateEvent, AppState> {
  static final Logger _log = Logger('AppStateBloc');

  AppStateBloc() : super(const AppState(AppLifecycleStatus.unknown)) {
    on<AppLifecycleStateChanged>(_onFlutterAppStateChanged);
  }

  void _onFlutterAppStateChanged(
    AppLifecycleStateChanged event,
    Emitter<AppState> emit,
  ) {
    switch (event.state) {
      case widgets.AppLifecycleState.detached:
        emit(const AppState(AppLifecycleStatus.detached));
        _log.info('app detached');
        break;

      case widgets.AppLifecycleState.inactive:
        emit(const AppState(AppLifecycleStatus.inactive));
        _log.info('app inactive');
        break;

      case widgets.AppLifecycleState.paused:
        emit(const AppState(AppLifecycleStatus.paused));
        _log.info('app paused');
        break;

      case widgets.AppLifecycleState.resumed:
        emit(const AppState(AppLifecycleStatus.resumed));
        _log.info('app resumed');
        break;

      default:
        emit(const AppState(AppLifecycleStatus.unknown));
        _log.info('unknown state');
    }
  }
}
