import 'package:flutter/material.dart';
import 'package:loginpage/components/my_button.dart';
import 'package:loginpage/components/my_textfield.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loginpage/config/confi.dart'; 
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:loginpage/pages/dashboard.dart'; 
class LoginPage extends StatefulWidget  {
  const LoginPage({super.key});
@override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final storage = const FlutterSecureStorage();
  String? usernameErrorText;
  String? passwordErrorText;

   // Función que realiza la solicitud al backend
 void signUserIn() async {
    const url = '${Config.baseUrl}/auth/login/';  // URL de tu API

    print("Login Button Pressed");

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'username': usernameController.text,
          'password': passwordController.text,
        },
      );

        if (response.statusCode == 200) {
      // Login exitoso
      var jsonResponse = jsonDecode(response.body);
      String accessToken = jsonResponse['access'];  // Extrae el token de la respuesta

      // Guardamos el token de acceso en almacenamiento seguro
      await storage.write(key: 'access_token', value: accessToken);

      print("Login successful. Token saved: $accessToken");

      // Navegar al Dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    }  else {
        // Login fallido, analizando el cuerpo de la respuesta
        var jsonResponse = jsonDecode(response.body);
        setState(() {
          usernameErrorText = jsonResponse['username']?.first;
          passwordErrorText = jsonResponse['password']?.first;
        });
      }
    } catch (error) {
      print("Error during login: $error");
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: false, // Esto ayuda a evitar el desplazamiento cuando aparece el teclado
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2B0E73), // Azul profundo en la parte superior
            Color(0xFF2196F3), // Azul claro en la parte inferior
          ],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView( // Hacemos el contenido desplazable
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 5.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Fondo blanco para el contenido
                borderRadius: BorderRadius.circular(16), // Bordes redondeados
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 50),
                  Image.asset(
                    'lib/images/logo-tc.png',
                    height: 75,
                    width: 500,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Welcome back you\'ve been missed',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Username',
                    obscureText: false,
                    errorText: usernameErrorText, // Mostrar error en el campo
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    errorText: passwordErrorText, // Mostrar error en el campo
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  MyButton(
                    onTap: () => signUserIn(), // Ejecutar la función de login
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

}