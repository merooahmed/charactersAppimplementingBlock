import 'package:breakingbadproject/constants/strings.dart';
import 'package:dio/dio.dart';

class ApiService {
  late Dio dio;

  ApiService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<List< dynamic>> getCharacters() async {
    try {
      Response response = await dio.get('character');
      List<dynamic> data=response.data['results'];
      return data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
