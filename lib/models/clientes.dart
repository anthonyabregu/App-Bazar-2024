import 'package:flutter/material.dart';

class Cliente {
  final int id;
  final String nombre;
  final String celular;
  final String fechacreacion;
  final IconData icon;

  const Cliente({
    required this.id,
    required this.nombre,
    required this.celular,
    required this.fechacreacion,
    required this.icon,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['cli_id'],
      nombre: json['cli_nombre'],
      celular: json['cli_celular'],
      fechacreacion: json['cli_fecha_creacion'],
      icon: Icons.edit_note,
    );
  }
}
