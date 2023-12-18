

import 'package:json_annotation/json_annotation.dart';
import 'package:tots_challenge/models/clients_list_data.dart';

part 'clients_data.g.dart';

@JsonSerializable()
class ClientsResponseData {
 int currentPage;
 List<Clientes> data;


  ClientsResponseData(this.currentPage,this.data);

  factory ClientsResponseData.fromJson(Map<String, dynamic> json) =>
      _$ClientsResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ClientsResponseDataToJson(this);
}