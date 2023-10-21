// ignore_for_file: cascade_invocations

import 'dart:convert';

import 'package:equatable/equatable.dart';

class RegistrationProfileModel extends Equatable {
  const RegistrationProfileModel({
    required this.userName,
    required this.accesToken,
    required this.refreshToken,
  });
  factory RegistrationProfileModel.fromMap(Map<String, dynamic> map) {
    return RegistrationProfileModel(
      userName: (map['userName'] ?? '') as String,
      accesToken: (map['accesToken'] ?? '') as String,
      refreshToken: (map['refreshToken'] ?? '') as String,
    );
  }
  factory RegistrationProfileModel.init() => const RegistrationProfileModel(
        accesToken: '',
        refreshToken: '',
        userName: '',
      );
  factory RegistrationProfileModel.fromJson(String source) =>
      RegistrationProfileModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
  final String userName;
  final String accesToken;
  final String refreshToken;

  @override
  List<Object> get props => [userName, accesToken, refreshToken];

  RegistrationProfileModel copyWith({
    String? userName,
    String? accesToken,
    String? refreshToken,
  }) {
    return RegistrationProfileModel(
      userName: userName ?? this.userName,
      accesToken: accesToken ?? this.accesToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userName': userName});
    result.addAll({'accesToken': accesToken});
    result.addAll({'refreshToken': refreshToken});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'RegistrationProfileModel(userName: $userName, accesToken: $accesToken, refreshToken: $refreshToken)';
}
