import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:http/http.dart' as http;
import 'package:temp_app_bazar/presentation/widgets/my_button_login.dart';
import 'package:temp_app_bazar/presentation/widgets/my_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView();

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _dio = Dio();

  Future<void> login() async {
    //print(emailController.text);
    //print(passwordController.text);

    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty) throw Exception('El email es requerido');
    if (password.isEmpty) throw Exception('La contraseña es requerida');

    try {
      final response = await _dio.post(
        'http://192.168.18.10:4000/v1/login/',
        data: {
          'usr_email': email,
          'usr_password': password,
        },
      );

      //print('Response status: ${response.statusCode}');
      //print('Response body: ${response.data}');

      if (response.statusCode == 201) {
        final String token = response.data['token'];

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);

        print('Logueado');
      } else {
        print('Error de inicio de sesión: ${response.data['message']}');
      }
    } catch (e) {
      print('Error de red: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Image.asset(
            'assets/images/logo_miguelito_oficial.png',
            width: 300,
            height: 200,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              MyTextField(
                hintText: 'Email',
                obscureText: false,
                controller: emailController,
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController,
                icon: Icons.lock_outline,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
              MyButtonLogin(
                onTap: () async {
                  await login();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class _CustomTextField extends StatelessWidget {
//   final String label;
//   final bool obscureText;
//   final TextEditingController controller;

//   const _CustomTextField({
//     super.key,
//     required this.label,
//     required this.obscureText,
//     required this.controller,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(labelText: label),
//       obscureText: obscureText,
//     );
//   }
// }
