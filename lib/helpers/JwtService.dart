// ignore_for_file: file_names

import 'dart:convert' show base64Url, json, utf8;

import 'package:stay/models/user.dart';

class JwtService {
  static JwtService? _instance;
  late String _token;

  JwtService._internal();

  static JwtService getInstance() {
    _instance ??= JwtService._internal();
    return _instance!;
  }

  void setToken(String token) {
    _token = token;
  }

  Map<String, dynamic> getPayload() {
    final parts = _token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }

    final payload = parts[1];
    final normalized = base64Url.normalize(payload);
    final resp = utf8.decode(base64Url.decode(normalized));
    final payloadMap = json.decode(resp);

    return payloadMap;
  }

  User getUser() {
    final payloadMap = getPayload();
    final user = User.fromJson(payloadMap);
    return user;
  }
}
