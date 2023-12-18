import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tots_challenge/pages/Home_page.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  Future<void> _register() async {
    final String apiUrl = "https://agency-coda.uc.r.appspot.com/mia-auth/register";

    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode({
        "email": emailController.text,
        "password": passwordController.text,
        "firstname": firstNameController.text,
        "lastname": lastNameController.text,
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic>? responseData = json.decode(response.body);

      if (responseData != null) {
        if (responseData["success"] == true) {
          // Registro exitoso
          final Map<String, dynamic> response = responseData["response"];

          if (response.containsKey("access_token")) {
            final String token = response["access_token"];
            final String userId = response["id"].toString(); // ID del usuario u otra información que desees guardar

            // Guardar el token y otros detalles de la sesión en SharedPreferences
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("access_token", token);
            prefs.setString("user_id", userId); // Puedes agregar más campos según tus necesidades

            // Navegar a HomePage después de un registro exitoso
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => ClientsView(),
              ),
            );
          } else {
            print("Error: El token no se encuentra en la respuesta");
          }
        } else {
          // Registro fallido
          final Map<String, dynamic> error = responseData["error"];
          final int errorCode = error["code"];
          final String errorMessage = error["message"];

          // Manejar el error según tus necesidades
          print("Error en el registro - Código: $errorCode, Mensaje: $errorMessage");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: "First Name"),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: "Last Name"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
