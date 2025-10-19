import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/app_theme/app_theme_bloc.dart';
import '../routes/app_routes.dart';
import 'global_bloc_listener.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppThemeBloc>().add(
            const AppThemeInitialized(),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, appThemeState) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appThemeState.theme?.darkTheme,
          title: 'Task',
          initialRoute: '/',
          onGenerateRoute: TwRouter.generateRoute,
          navigatorKey: kAppNavigatorKey,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context),
              child: Overlay(
                initialEntries: [
                  OverlayEntry(
                    builder: (context) => GestureDetector(
                      onTap: () =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      child: GlobalBlocListener(child: child!),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
