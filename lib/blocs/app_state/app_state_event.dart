import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart' as widgets;

// Remove the other directives from the part file and move them to the library file.

abstract class AppStateEvent extends Equatable {
  const AppStateEvent();

  @override
  List<Object> get props => [];
}

class AppLifecycleStateChanged extends AppStateEvent {
  final widgets.AppLifecycleState state;

  const AppLifecycleStateChanged({required this.state});

  @override
  List<Object> get props => [state];
}
