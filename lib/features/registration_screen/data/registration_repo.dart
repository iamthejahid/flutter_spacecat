import 'package:riverpod_ddd/core/network/network.dart';
import 'package:riverpod_ddd/features/registration_screen/domain/registraionModel.dart';

// ignore: one_member_abstracts
abstract class RegistrationRepo {
  Future<Either<CleanFailure, RegistrationProfileModel>> registration({
    required Map<String, dynamic> body,
  });
}

class RegistrationRepoI implements RegistrationRepo {
  @override
  Future<Either<CleanFailure, RegistrationProfileModel>> registration({
    required Map<String, dynamic> body,
  }) async {
    final NetworkHandler networkHandler = NetworkHandler.instance;

    return networkHandler.post(
      endPoint: '/api/user/signup',
      fromData: (v) => RegistrationProfileModel.fromMap(v),
      body: body,
    );
  }
}
