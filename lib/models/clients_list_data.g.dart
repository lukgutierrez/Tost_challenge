// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Clientes _$ClientesFromJson(Map<String, dynamic> json) => Clientes(
      json['id'] as int,
      json['firstname'] as String,
      json['lastname'] as String,
      json['email'] as String,
      json['address'] as String,
      json['photo'] as String,
      json['caption'] as String,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['deleted'] as int,
    );

Map<String, dynamic> _$ClientesToJson(Clientes instance) => <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'address': instance.address,
      'photo': instance.photo,
      'caption': instance.caption,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deleted': instance.deleted,
    };
