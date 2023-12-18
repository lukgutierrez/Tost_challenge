import 'package:flutter/material.dart';
import 'package:tots_challenge/models/clients_data.dart';
import 'package:tots_challenge/models/models_clients.dart';
import 'package:tots_challenge/service/clients_services.dart';
class ClientsView extends StatefulWidget {
  @override
  _ClientsViewState createState() => _ClientsViewState();
}

class _ClientsViewState extends State<ClientsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Clientes'),
      ),
      body: FutureBuilder<List<ClientsLista>>(
        future: ClientService.getClients(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Muestra un indicador de carga mientras se obtienen los datos
          } else 
          if (snapshot.hasError) {
            
            return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      
      Text('Error al cargar los clientes: ${snapshot.error}'),
      SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {
          print('Error al cargar los clientes: ${snapshot.error}');
          // Acciones sugeridas para el usuario (pueden variar según el contexto)
          // Ejemplo: Intentar nuevamente la carga de clientes
          setState(() {});
        },
        child: Text('Intentar Nuevamente'),
      ),
    ],
  );
            
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No hay clientes disponibles.');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                ClientsLista clientsList = snapshot.data![index];
                ClientsResponseData responseData = clientsList.response!;

                return ListTile(
                  title: Text('Página Actual: ${responseData.currentPage}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: responseData.data.map((cliente) {
                      return Text('Cliente: ${cliente.updatedAt} ${cliente.firstname}');
                    }).toList(),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
