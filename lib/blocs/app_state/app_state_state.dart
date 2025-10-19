part of 'app_state_bloc.dart';

enum AppLifecycleStatus {
  unknown,
  resumed,
  inactive,
  paused,
  detached,
}

class AppState extends Equatable {
  final AppLifecycleStatus state;

  const AppState(this.state);

  @override
  List<Object> get props => [state];
}
