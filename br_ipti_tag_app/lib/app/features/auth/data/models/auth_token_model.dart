import 'dart:convert';

import 'package:br_ipti_tag_app/app/features/auth/domain/entities/auth_token.dart';

class AuthTokenModel extends AuthToken {
  AuthTokenModel({
    required String accessToken,
  }) : super(accessToken: accessToken);

  factory AuthTokenModel.fromMap(Map<String, dynamic> map) {
    return AuthTokenModel(
      accessToken: map['access_token'] as String,
    );
  }

  factory AuthTokenModel.fromJson(String source) {
    final mapped = jsonDecode(source);
    return AuthTokenModel.fromMap(mapped as Map<String, dynamic>);
  }

  AuthToken copyWith({
    String? accessToken,
  }) {
    return AuthToken(
      accessToken: accessToken ?? this.accessToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access_token': accessToken,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'AuthToken(accessToken: $accessToken)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthToken && other.accessToken == accessToken;
  }

  @override
  int get hashCode => accessToken.hashCode;
}
