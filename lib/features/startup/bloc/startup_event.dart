part of 'startup_bloc.dart';

sealed class StartupEvent extends Equatable {
  const StartupEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends StartupEvent {
  const AppStarted();
}
