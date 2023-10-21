import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:riverpod_ddd/features/login_page/domain/user_profile_model.dart';

class RegistrationState extends Equatable {
  RegistrationState({
    required this.isLoading,
    required this.userProfileModel,
  });
  factory RegistrationState.fromMap(Map<String, dynamic> map) {
    return RegistrationState(
      isLoading: (map['isLoading'] ?? false) as bool,
      userProfileModel: UserProfileModel.fromMap(
        map['userProfileModel'] as Map<String, dynamic>,
      ),
    );
  }

  factory RegistrationState.fromJson(String source) =>
      RegistrationState.fromMap(json.decode(source) as Map<String, dynamic>);

  factory RegistrationState.init() => RegistrationState(
        isLoading: false,
        userProfileModel: UserProfileModel.init(),
      );

  final bool isLoading;
  final UserProfileModel? userProfileModel;

  @override
  List<Object?> get props => [isLoading, userProfileModel];

  RegistrationState copyWith({
    bool? isLoading,
    UserProfileModel? userProfileModel,
  }) {
    return RegistrationState(
      isLoading: isLoading ?? this.isLoading,
      userProfileModel: userProfileModel ?? this.userProfileModel,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{}
      ..addAll({'isLoading': isLoading})
      ..addAll({'userProfileModel': userProfileModel?.toMap()});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'RegistrationState(isLoading: $isLoading, userProfileModel: $userProfileModel)';
}
