part of 'landing_bloc.dart';

enum LandingScreenTab {
  home,
  investment,
  add,
  wallet,
  settings,
}

class LandingState extends Equatable {
  final LandingScreenTab currentTab;
  final int currentTabIndex;

  const LandingState({
    this.currentTab = LandingScreenTab.home,
    this.currentTabIndex = 0,
  });

  @override
  List<Object> get props => [
        currentTab,
        currentTabIndex,
      ];
}
