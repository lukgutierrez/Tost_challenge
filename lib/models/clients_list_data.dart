import 'package:json_annotation/json_annotation.dart';

part 'clients_list_data.g.dart';

@JsonSerializable()
class Clientes {
  int id;
  String firstname;
  String lastname;
  String email;
  String address;
  String photo;
  String caption;
  String createdAt;
  String updatedAt;
  int deleted;

  Clientes(
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.address,
    this.photo,
    this.caption,
    this.createdAt,
    this.updatedAt,
    this.deleted,
  );

  factory Clientes.fromJson(Map<String, dynamic> json) =>
      _$ClientesFromJson(json);

  Map<String, dynamic> toJson() => _$ClientesToJson(this);
}
