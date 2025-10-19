part of 'landing_bloc.dart';

sealed class LandingEvent extends Equatable {
  const LandingEvent();

  @override
  List<Object> get props => [];
}

class TabChangeRequested extends LandingEvent {
  const TabChangeRequested({required this.tab, required this.tabIndex});

  final LandingScreenTab tab;
  final int tabIndex;

  @override
  List<Object> get props => [tab, tabIndex];
}
