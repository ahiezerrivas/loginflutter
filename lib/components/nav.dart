import 'package:flutter/material.dart';
import 'package:loginpage/config/confi.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loginpage/pages/login_page.dart';
final storage = const FlutterSecureStorage();

class BaseScaffold extends StatefulWidget {
  final Widget body;
  final String title;

  const BaseScaffold({
    super.key,
    required this.body,
    required this.title,
  });

  @override
  _BaseScaffoldState createState() => _BaseScaffoldState();
 
}

class _BaseScaffoldState extends State<BaseScaffold> {
  String? _token;
  String? _userFullName;

  @override
  void initState() {
    super.initState();
    _initializeTokenAndFetch();
  }

  Future<void> _initializeTokenAndFetch() async {
    _token = await storage.read(key: 'access_token');
    if (_token != null) {
      await _fetchAndPrintMe();
    } else {
      print('Token no disponible');
    }
  }

  Future<void> _fetchAndPrintMe() async {
    const url = '${Config.baseUrl}/me/';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _userFullName = data['get_full_name'];
        });
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Ocurrió un error: $e');
    }
  }

void _logout() async {
  const url = '${Config.baseUrl}/auth/logout/'; // URL del servidor para logout

  try {
    final response = await http.post(Uri.parse(url), headers: {
      'Authorization': 'Bearer $_token', // Asegúrate de enviar el token si es necesario
    });

    if (response.statusCode == 205) {
      // El servidor ha procesado el logout correctamente
      await storage.delete(key: 'access_token');  // Elimina el token
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => LoginPage())
      );
    } else {
      print('Error en el logout: ${response.statusCode}');
      print(response.body);
    }
  } catch (e) {
    print('Error al intentar hacer logout: $e');
  }
}
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
    ),
    body: widget.body,
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menú'),
          ),
          ListTile(
            title: Text(_userFullName ?? 'Usuario'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Sufijos'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Palabras y Frases'),
            onTap: () {},
          ),
        ],
      ),
    ),
 floatingActionButton: Align(
  alignment: const Alignment(1, -0.92), // Cambia el valor del eje Y para bajarlo un poco
  child: Theme(
    data: Theme.of(context).copyWith(
      dividerColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: const TextTheme().apply(bodyColor: Colors.white),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min, // Para que solo ocupe el espacio necesario
      children: [
        Text(
          _userFullName ?? 'Usuario', // Muestra el nombre del usuario
          style: const TextStyle(color: Colors.black), // Ajusta el estilo según lo necesites
        ),
      
        PopupMenuButton<int>(
          offset: const Offset(-10, 50),
          color: Colors.white,
          onSelected: (value) {
            if (value == 2) {
              _logout();  // Llama a la función de logout
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem<int>(
              value: 2,
              child: Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 8),
                  Text('Logout'),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  ),
)

  );
}
}