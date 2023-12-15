import 'dart:async';
import 'package:http/http.dart' as http;

class APIService {
  APIService._internal();
  static final APIService _instance = APIService._internal();
  factory APIService() => _instance;

  Future get(String url) async {
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      print('Exception is : $e');
    }
  }
}
