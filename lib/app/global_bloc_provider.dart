import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/app/app.dart';
import 'package:task/blocs/app_theme/app_theme_bloc.dart';
import '../blocs/app_state/app_state_bloc.dart';
import '../blocs/authentication/authentication_bloc.dart';
import '../blocs/landing/landing_bloc.dart';
import '../data/network_client/request_client.dart';
import '../data/shared_prefs_repo.dart';
import '../features/startup/bloc/startup_bloc.dart';

class GlobalProviderWidget extends StatelessWidget {
  const GlobalProviderWidget({
    super.key,
    required this.sharedPrefsRepository,
  });

  final SharedPrefsRepository sharedPrefsRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SharedPrefsRepository>(
          create: (context) => sharedPrefsRepository,
        ),
        RepositoryProvider<RequestClient>(
          create: (context) => RequestClient(
            sharedPrefsRepository: sharedPrefsRepository,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppStateBloc>(
            create: (BuildContext context) => AppStateBloc(),
          ),
          BlocProvider(
            create: (context) => StartupBloc(),
          ),
          BlocProvider(
            create: (context) {
              final bloc = AuthenticationBloc(
                sharedPrefsRepository: context.read<SharedPrefsRepository>(),
              );
              bloc.add(RequestToCheckAuthentication());
              return bloc;
            },
          ),
          BlocProvider<LandingBloc>(
            create: (context) => LandingBloc(),
          ),
          BlocProvider<AppThemeBloc>(
            create: (BuildContext context) => AppThemeBloc(
              sharedPrefsRepository: context.read<SharedPrefsRepository>(),
            ),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}
