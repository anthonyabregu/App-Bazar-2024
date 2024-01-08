import 'package:dio/dio.dart';
import 'package:temp_app_bazar/models/fiados/fiados.dart';

class FiadoProvider {
  final Dio _dio = Dio();

  Future<List<FiadosList>> fetchFiadosItems() async {
    try {
      final response = await _dio
          .get('http://192.168.18.254:4000/v1/fiados/'); // Reemplaza con tu URL
      print('RESPONSE: $response');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data["data"];
        return data.map((item) => FiadosList.fromJson(item)).toList();
      } else {
        throw Exception('Error al cargar los datos');
      }
    } catch (error) {
      throw Exception('Error de red: $error');
    }
  }
}
