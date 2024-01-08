import 'package:flutter/material.dart';
import 'package:temp_app_bazar/models/clientes.dart';
import 'package:temp_app_bazar/providers/cliente_provider.dart';

class ClientesScreen extends StatelessWidget {
  final ClienteProvider apiProvider = ClienteProvider();
  ClientesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listado de Clientes'),
        ),
        body: FutureBuilder<List<Cliente>>(
          future: apiProvider.fetchClientesItems(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child:
                      CircularProgressIndicator()); // Puedes mostrar un indicador de carga mientras se obtienen los datos
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No se encontraron datos');
            } else {
              final List<Cliente> clientes = snapshot.data!;

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListView.builder(
                  itemCount: clientes.length,
                  itemBuilder: (context, index) {
                    final Cliente cliente = clientes[index];
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          color: colors.primary,
                        ),
                        trailing: Icon(cliente.icon, color: colors.primary),
                        title: Text(cliente.nombre),
                        subtitle: Text('Celular: ${cliente.celular}'),
                        onTap: () {
                          // Implementa la navegación a la ruta correspondiente
                          // Navigator.pushNamed(context, menuItem.link);
                        },
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.person_add_alt_1_rounded),
        ));
  }
}
