import 'package:riverpod_ddd/core/network/network.dart';
import 'package:riverpod_ddd/features/login_page/domain/user_profile_model.dart';

// ignore: one_member_abstracts
abstract class RegistrationRepo {
  Future<Either<CleanFailure, UserProfileModel>> registration({
    required Map<String, dynamic> body,
  });
}

class RegistrationRepoI implements RegistrationRepo {
  @override
  Future<Either<CleanFailure, UserProfileModel>> registration({
    required Map<String, dynamic> body,
  }) async {
    final NetworkHandler networkHandler = NetworkHandler.instance;

    return networkHandler.post(
      endPoint: '/api/user/login',
      fromData: (v) => UserProfileModel.fromMap(v),
      body: body,
    );
  }
}
