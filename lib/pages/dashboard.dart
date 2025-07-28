import 'package:flutter/material.dart';
import 'package:loginpage/components/nav.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
       title: 'Dashboard',
     body: Center(
        child: Text(
          "Welcome to your Dashboard!",
          style: TextStyle(fontSize: 24),
        ),
    )
    );
  }
}

