import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/startup/bloc/startup_bloc.dart';
import '../features/startup/view/splash_view.dart';
import 'global_bloc_provider.dart';

class StartupWidget extends StatelessWidget {
  const StartupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider<StartupBloc>(
        create: (context) {
          final startupBloc = StartupBloc();
          startupBloc.add(const AppStarted());
          return startupBloc;
        },
        child: BlocBuilder<StartupBloc, StartupState>(
          buildWhen: (previous, current) {
            return previous.status != current.status;
          },
          builder: (context, state) {
            debugPrint("|>>---------------> ${state.status}");
            if (state.status == StartupStatus.loading) {
              return const SplashView();
            } else if (state.status == StartupStatus.error) {
              return const Center(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text('Error'),
                ),
              );
            } else if (state.status == StartupStatus.loaded) {
              return GlobalProviderWidget(
                sharedPrefsRepository: state.sharedPreferencesRepo!,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
