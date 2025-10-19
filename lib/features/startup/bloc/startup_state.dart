part of 'startup_bloc.dart';

enum StartupStatus { unknown, loading, loaded, error }

class StartupState extends Equatable {
  const StartupState({
    this.status = StartupStatus.unknown,
    this.sharedPreferencesRepo,
    this.isFirstOpen = false,
  });
  final StartupStatus status;
  final SharedPrefsRepository? sharedPreferencesRepo;
  final bool isFirstOpen;

  StartupState copyWith({
    StartupStatus? status,
    SharedPrefsRepository? sharedPreferencesRepo,
    bool? isFirstOpen,
  }) {
    return StartupState(
      status: status ?? this.status,
      isFirstOpen: isFirstOpen ?? this.isFirstOpen,
      sharedPreferencesRepo:
          sharedPreferencesRepo ?? this.sharedPreferencesRepo,
    );
  }

  @override
  List<Object?> get props => [
        status,
        sharedPreferencesRepo,
        isFirstOpen,
      ];
}
