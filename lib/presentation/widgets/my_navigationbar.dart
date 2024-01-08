import 'package:flutter/material.dart';

class MyNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'Fiados',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Clientes',
        ),
      ],
    );
  }
}
