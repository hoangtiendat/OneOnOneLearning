// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tokens _$TokensFromJson(Map<String, dynamic> json) => Tokens(
      Access.fromJson(json['access'] as Map<String, dynamic>),
      Access.fromJson(json['refresh'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokensToJson(Tokens instance) => <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };
