import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tots_challenge/pages/Home_page.dart';
import 'package:tots_challenge/pages/Register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    final String apiUrl = "https://agency-coda.uc.r.appspot.com/mia-auth/login";

    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode({
        "email": emailController.text,
        "password": passwordController.text,
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic>? responseData = json.decode(response.body);

   if (responseData != null && responseData.containsKey("response")) {
   final Map<String, dynamic> response = responseData["response"];

   if (response.containsKey("access_token")) {
    final String token = response["access_token"];

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("access_token", token);

    // Navegar a HomePage después de un inicio de sesión exitoso
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ClientsView(),
      ),
    );
  } else {
    print("Error: El token no se encuentra en la respuesta");
  }
}
    }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
