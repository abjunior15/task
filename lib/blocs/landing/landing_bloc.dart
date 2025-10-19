import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'landing_event.dart';
part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(const LandingState()) {
    on<LandingEvent>(_onEvent);
    on<TabChangeRequested>(_onTabChangeRequested);
  }

  void _onEvent(LandingEvent event, Emitter<LandingState> emit) {}

  void _onTabChangeRequested(
    TabChangeRequested event,
    Emitter<LandingState> emit,
  ) {
    emit(
      LandingState(
        currentTab: event.tab,
        currentTabIndex: event.tabIndex,
      ),
    );
  }
}
