// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models_clients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientsLista _$ClientsListaFromJson(Map<String, dynamic> json) => ClientsLista(
      json['success'] as bool,
      json['response'] == null
          ? null
          : ClientsResponseData.fromJson(
              json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClientsListaToJson(ClientsLista instance) =>
    <String, dynamic>{
      'success': instance.success,
      'response': instance.response,
    };
