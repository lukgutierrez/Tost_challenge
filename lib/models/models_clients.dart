import 'package:json_annotation/json_annotation.dart';
import 'package:tots_challenge/models/clients_data.dart';

part 'models_clients.g.dart';

@JsonSerializable()
class ClientsLista {
  final bool success;
  final ClientsResponseData? response;

  ClientsLista(this.success, this.response);

  factory ClientsLista.fromJson(Map<String, dynamic> json) =>
      _$ClientsListaFromJson(json); // Corrected method name

  Map<String, dynamic> toJson() => _$ClientsListaToJson(this); // Corrected method name
}
