import 'package:task/common/extensions/build_context.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/authentication/authentication_bloc.dart';
import '../routes/app_routes.dart';

class GlobalBlocListener extends StatelessWidget {
  const GlobalBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listenWhen: (previous, current) {
            return previous.status != current.status;
          },
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                if (kDebugMode) {
                  print("I am authenticated");
                }
                kAppNavigatorKey.currentContext?.pushNamedAndRemoveUntil(
                  homeRoute,
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                if (state.isfirstTimeOpen == false) {
                  kAppNavigatorKey.currentContext?.pushNamedAndRemoveUntil(
                    homeRoute,
                    (route) => false,
                  );
                } else {
                  kAppNavigatorKey.currentContext?.pushNamedAndRemoveUntil(
                    homeRoute,
                    (route) => false,
                  );
                }
                if (kDebugMode) {
                  print("I am unauthenticated");
                }
                break;
              default:
                if (kDebugMode) {
                  print("I am unknown");
                }
                break;
            }
          },
        ),
      ],
      child: child,
    );
  }
}
