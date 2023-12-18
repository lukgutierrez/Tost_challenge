// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientsResponseData _$ClientsResponseDataFromJson(Map<String, dynamic> json) =>
    ClientsResponseData(
      json['currentPage'] as int,
      (json['data'] as List<dynamic>)
          .map((e) => Clientes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClientsResponseDataToJson(
        ClientsResponseData instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'data': instance.data,
    };
