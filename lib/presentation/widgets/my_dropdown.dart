import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:temp_app_bazar/models/clientes.dart';
import 'package:temp_app_bazar/providers/cliente_provider.dart';

class MyDropdown extends StatefulWidget {
  const MyDropdown({super.key});

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  final ClienteProvider apiProvider = ClienteProvider();
  final List<String> items = [
    'Anthony Abregu',
    'Ana Chahuara',
    'Samantha Sandoval',
    'Teodosia Salas',
    'Alexandra Sandoval',
  ];
  Cliente? selectedCliente;

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return FutureBuilder<List<Cliente>>(
      future: apiProvider.fetchClientesItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          ); // Puedes mostrar un indicador de carga mientras se obtienen los datos
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No se encontraron datos');
        } else {
          final List<Cliente> clientes = snapshot.data!;
          print('CLIENTES: $clientes');
          return DropdownButtonHideUnderline(
            child: DropdownButton2<Cliente>(
              isExpanded: true,
              hint: Text(
                'Escoge un cliente',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: clientes
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.nombre,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              value: selectedCliente,
              onChanged: (value) {
                setState(() {
                  selectedCliente = value;
                });
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
                // height: 20,
                // width: 200,
              ),
              dropdownStyleData: const DropdownStyleData(
                maxHeight: 200,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: textEditingController,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Container(
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: textEditingController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      hintText: 'Busca al cliente',
                      hintStyle: const TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.toString().contains(searchValue);
                },
              ),
              //This to clear the search value when you close the menu
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  textEditingController.clear();
                }
              },
            ),
          );
        }
      },
    );
  }
}
