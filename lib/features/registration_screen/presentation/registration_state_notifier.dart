import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_ddd/core/di.dart';
import 'package:riverpod_ddd/features/home_page/presentation/home_screen.dart';
import 'package:riverpod_ddd/features/login_page/data/login_repo.dart';
import 'package:riverpod_ddd/features/login_page/domain/user_profile_model.dart';
import 'package:riverpod_ddd/features/registration_screen/presentation/registration_state.dart';
import 'package:riverpod_ddd/local_cache/cache_provider.dart';
import 'package:riverpod_ddd/router/app_route.dart';

final registrationProvider =
    StateNotifierProvider<RegistrationStateNotifier, RegistrationState>((ref) {
  return RegistrationStateNotifier(domain: sl(), ref: ref);
});

class RegistrationStateNotifier extends StateNotifier<RegistrationState> {
  RegistrationStateNotifier({required LoginRepo domain, required Ref ref})
      : _domain = domain,
        _ref = ref,
        super(RegistrationState.init());
  final LoginRepo _domain;
  final Ref _ref;

  void statemaker(RegistrationState newState) => state = newState;

  Future<void> login({
    required Map<String, dynamic> body,
  }) async {
    statemaker(state.copyWith(isLoading: true));
    final v = await _domain.login(body: body);
    v.fold((failure) => log(failure.error), (success) async {
      statemaker(
        state.copyWith(
          userProfileModel: UserProfileModel(
            userName: success.userName,
            accesToken: success.accesToken,
            refreshToken: success.refreshToken,
          ),
        ),
      );
      _ref.watch(hiveProvider).setToken(token: success.accesToken);
      // await Future.delayed(Duration(seconds: 3));
      _ref.watch(routerProvider).goNamed(HomeScreen.name);
    });
    statemaker(state.copyWith(isLoading: false));
  }
}
