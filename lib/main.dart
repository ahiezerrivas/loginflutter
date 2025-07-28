import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'pages/login_page.dart';
import 'pages/dashboard.dart';  // Asegúrate de importar el Dashboard


final storage = const FlutterSecureStorage();  // Instancia de almacenamiento seguro

void main() async {
  // Asegúrate de que los widgets se inicialicen correctamente antes de acceder al almacenamiento seguro.
  WidgetsFlutterBinding.ensureInitialized();
  
  // Comprobar si hay un token almacenado
  String? token = await storage.read(key: 'access_token');
  
  // Inicializa dotenv si estás utilizando variables de entorno
 

  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: token == null ? LoginPage() : Dashboard(),  // Si hay token, va al Dashboard
    );
  }
}
