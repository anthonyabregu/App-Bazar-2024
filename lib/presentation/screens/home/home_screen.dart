import 'package:flutter/material.dart';
import 'package:temp_app_bazar/presentation/widgets/my_navigationbar.dart';
import 'package:temp_app_bazar/presentation/widgets/screen_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // final List<Widget> _screens = [
  //   const RegisterScreen(),
  //   const FiadosScreen(),
  //   const ClientesScreen()
  // ];

  final List<Widget> _screens = ScreenList.screens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Librería Bazar'),
      // ),
      body: _screens[_currentIndex],
      bottomNavigationBar: MyNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
