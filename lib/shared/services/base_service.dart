import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lemonstarwars/shared/enums/e_request_type.dart';

class BaseService {
  String baseUrl =  "https://swapi.dev/api";
  final String url;
  final ERquestType method;
  dynamic body;
  String get finalUrl => "$baseUrl/$url";

  BaseService({required this.url, required this.method})
      : assert(url.length >= 3) {    
  }

  Future<http.Response> get() async {
    try {
      final response = await http.get(Uri.parse(finalUrl));
      print("BaseService.get() url: $finalUrl, Success, response: ${response.statusCode}");

      return response;
    } catch (ex) {
      throw Exception("BaseService.get(): Erro to request url:  $finalUrl, Error: $ex");
    }
    
  }
}
