import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';

@JsonSerializable(createToJson: false)
@immutable
class AppConfig {
  final String version;

  final String api;
  final String key;

  const AppConfig({required this.version, required this.api, required this.key});

  factory AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);
}
