import 'package:flutter/material.dart';

class FiadosList {
  final int id;
  final String nombre;
  final int cantidad;
  final IconData icon;

  const FiadosList({
    required this.id,
    required this.nombre,
    required this.cantidad,
    required this.icon,
  });

  factory FiadosList.fromJson(Map<String, dynamic> json) {
    return FiadosList(
      id: json['cli_id'],
      nombre: json['cli_nombre'],
      cantidad: json['cantidad'],
      icon: Icons.visibility_outlined,
    );
  }
}
