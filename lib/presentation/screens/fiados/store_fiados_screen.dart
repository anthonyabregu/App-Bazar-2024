import 'package:flutter/material.dart';
import 'package:temp_app_bazar/presentation/widgets/my_dropdown.dart';

class StoreFiadosScreen extends StatefulWidget {
  const StoreFiadosScreen({super.key});

  @override
  State<StoreFiadosScreen> createState() => _StoreFiadosScreenState();
}

class _StoreFiadosScreenState extends State<StoreFiadosScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Fiado'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const MyDropdown(),
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Nombre',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: colors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
