// ignore_for_file: cascade_invocations

import 'dart:convert';
import 'package:equatable/equatable.dart';

class UserProfileModel extends Equatable {
  const UserProfileModel({
    required this.userName,
    required this.token,
    required this.refreshToken,
  });

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      userName: (map['userName'] ?? '') as String,
      token: Authorisation.fromMap(map['token']),
      refreshToken: Authorisation.fromMap(map['refreshToken']),
    );
  }

  factory UserProfileModel.init() => UserProfileModel(
        token: Authorisation(token: ''),
        refreshToken: Authorisation(token: ''),
        userName: '',
      );

  factory UserProfileModel.fromJson(String source) =>
      UserProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String userName;
  final Authorisation token;
  final Authorisation refreshToken;

  @override
  List<Object> get props => [userName, token, refreshToken];

  UserProfileModel copyWith({
    String? userName,
    Authorisation? token,
    Authorisation? refreshToken,
  }) {
    return UserProfileModel(
      userName: userName ?? this.userName,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userName': userName});
    result.addAll({'token': token.toMap()});
    result.addAll({'refreshToken': refreshToken.toMap()});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'UserProfileModel(userName: $userName, token: $token, refreshToken: $refreshToken)';
}

class Authorisation {
  String? token;

  Authorisation({
    this.token,
  });

  Authorisation copyWith({
    String? token,
  }) =>
      Authorisation(
        token: token ?? this.token,
      );

  factory Authorisation.fromMap(Map<String, dynamic> map) => Authorisation(
        token: map["token"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
      };
}
