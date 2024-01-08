import 'package:flutter/material.dart';
import 'package:temp_app_bazar/models/fiados/fiados.dart';
import 'package:temp_app_bazar/providers/fiados_provider.dart';

class FiadosScreen extends StatelessWidget {
  final FiadoProvider apiProvider = FiadoProvider();
  FiadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Fiados'),
        ),
        body: FutureBuilder<List<FiadosList>>(
          future: apiProvider.fetchFiadosItems(),
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
              final List<FiadosList> fiados = snapshot.data!;

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListView.builder(
                  itemCount: fiados.length,
                  itemBuilder: (context, index) {
                    final FiadosList fiado = fiados[index];
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        leading: Icon(
                          Icons.article_outlined,
                          color: colors.primary,
                        ),
                        trailing: Icon(fiado.icon, color: colors.primary),
                        title: Text(fiado.nombre),
                        subtitle: Text('Listas Pendientes: ${fiado.cantidad}'),
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
          child: const Icon(Icons.post_add_rounded),
        ));
  }
}
