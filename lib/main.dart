import 'package:flutter/material.dart';
import 'package:tutorials_world/consts/constant.dart';
import 'package:tutorials_world/screens/home_screen.dart';
import 'package:appwrite/appwrite.dart';
import 'package:tutorials_world/project_id.dart';

void main() {
  Client client = Client();
  client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject(project_id)
      .setSelfSigned(status: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutorials World',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}
