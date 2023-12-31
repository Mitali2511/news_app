import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/home_screen.dart';
import 'package:news_app/view/login_screen.dart';
import 'package:news_app/view/news_details_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        getPages: [
          GetPage(name: "/home", page: () => HomeScreen()),
          GetPage(name: "/", page: () => LoginScreen()),
          GetPage(name: "/details", page: () => NewsDetailScreen())
        ],
        title: 'Flutter Demo',
        theme: ThemeData(
          iconButtonTheme: const IconButtonThemeData(
              style: ButtonStyle(
                  iconColor: MaterialStatePropertyAll(Colors.black))),
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 248, 67, 67)),
        ),
        debugShowCheckedModeBanner: false,
        home: LoginScreen());
  }
}
