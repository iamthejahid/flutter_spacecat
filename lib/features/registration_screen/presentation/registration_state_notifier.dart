import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_ddd/core/di.dart';
import 'package:riverpod_ddd/features/home_page/presentation/home_screen.dart';

import 'package:riverpod_ddd/features/registration_screen/data/registration_repo.dart';
import 'package:riverpod_ddd/features/registration_screen/presentation/registration_state.dart';
import 'package:riverpod_ddd/local_cache/cache_provider.dart';
import 'package:riverpod_ddd/router/app_route.dart';

final registrationProvider =
    StateNotifierProvider<RegistrationStateNotifier, RegistrationState>((ref) {
  return RegistrationStateNotifier(domain: sl<RegistrationRepo>(), ref: ref);
});

class RegistrationStateNotifier extends StateNotifier<RegistrationState> {
  RegistrationStateNotifier(
      {required RegistrationRepo domain, required Ref ref})
      : _domain = domain,
        _ref = ref,
        super(RegistrationState.init());
  final RegistrationRepo _domain;
  final Ref _ref;

  void statemaker(RegistrationState newState) => state = newState;

  Future<void> registration({
    required Map<String, dynamic> body,
  }) async {
    statemaker(state.copyWith(isLoading: true));
    final v = await _domain.registration(body: body);
    v.fold((failure) => log(failure.error), (success) async {
      statemaker(
        state.copyWith(
          userProfileModel: success,
        ),
      );
      log(success.authorisation!.token!, name: "TOKEN");
      _ref.watch(hiveProvider).setToken(token: success.authorisation!.token!);
      Future.microtask(
          () => _ref.watch(routerProvider).goNamed(HomeScreen.name));
    });
    statemaker(state.copyWith(isLoading: false));
  }
}
