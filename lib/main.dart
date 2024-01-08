import 'package:flutter/material.dart';
import 'package:temp_app_bazar/config/theme/app_theme.dart';
//import 'package:temp_app_bazar/presentation/screens/clientes/clientes_screen.dart';
import 'package:temp_app_bazar/presentation/screens/home/home_screen.dart';
//import 'package:temp_app_bazar/presentation/screens/login/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).getTheme(),
      home: const HomeScreen(),
    );
  }
}
