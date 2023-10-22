// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:riverpod_ddd/features/registration_screen/domain/registraionModel.dart';

class RegistrationState extends Equatable {
  final bool isLoading;
  final RegistrationProfileModel? userProfileModel;
  const RegistrationState({
    required this.isLoading,
    this.userProfileModel,
  });

  @override
  List<Object?> get props => [isLoading, userProfileModel];

  RegistrationState copyWith({
    bool? isLoading,
    RegistrationProfileModel? userProfileModel,
  }) {
    return RegistrationState(
      isLoading: isLoading ?? this.isLoading,
      userProfileModel: userProfileModel ?? this.userProfileModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isLoading': isLoading,
      'userProfileModel': userProfileModel?.toMap(),
    };
  }

  factory RegistrationState.fromMap(Map<String, dynamic> map) {
    return RegistrationState(
      isLoading: map['isLoading'] as bool,
      userProfileModel: map['userProfileModel'] != null
          ? RegistrationProfileModel.fromMap(
              map['userProfileModel'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationState.fromJson(String source) =>
      RegistrationState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  factory RegistrationState.init() => RegistrationState(
      isLoading: false, userProfileModel: RegistrationProfileModel());
}
