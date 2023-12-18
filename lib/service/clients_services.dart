import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tots_challenge/models/clients_data.dart';

import 'package:tots_challenge/models/models_clients.dart';

class ClientService {
  static Future<List<ClientsLista>> getClients() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString("access_token");

    if (token != null) {
      print("Token: $token");
      final String apiUrl = "https://agency-coda.uc.r.appspot.com/client/list";

      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          "data": [
            {
              "id": 1483,
              "firstname": "Matias",
              "lastname": "Camiletti",
              "email": "matias@agencycoda.com",
              "address": "Buenos Aires, Argentina",
              "photo": "",
              "caption": "",
              "created_at": "2023-12-13T17:07:00.000000Z",
              "updated_at": "2023-12-13T17:07:00.000000Z",
              "deleted": 0
            },
          ]
        }),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData.containsKey("response")) {
          final dynamic responseContent = responseData["response"];

          if (responseContent.containsKey("data") &&
              responseContent["data"] is List) {
            final List<dynamic> clientsData = responseContent["data"];

            // Mapeo directo utilizando el constructor
            return clientsData.map((clientJson) {
              final response = ClientsResponseData.fromJson(clientJson);

              // Verificar si 'currentPage' es null y asignar un valor predeterminado si es necesario
              final currentPage = response.currentPage ?? 0;

              return ClientsLista(
                true,
                ClientsResponseData(currentPage, response.data),
              );
            }).toList();
          } else {
            throw Exception("La respuesta no contiene una lista de clientes");
          }
        } else {
          throw Exception("La respuesta no contiene una clave 'response'");
        }
      } else {
        throw Exception("La solicitud no fue exitosa - success: false");
      }
    } else {
      throw Exception("Token de acceso nulo");
    }
  }
}
