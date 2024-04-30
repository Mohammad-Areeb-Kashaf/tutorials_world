import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorials_world/consts/constant.dart';
import 'package:tutorials_world/firebase_options.dart';
import 'package:tutorials_world/home_screen_binding.dart';
import 'package:tutorials_world/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.getHomeRoute(),
      getPages: Routes.routes,
      title: 'Tutorials World',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        brightness: Brightness.dark,
      ),
      initialBinding: HomeScreenBinding(),
    );
  }
}
