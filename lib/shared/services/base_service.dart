import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lemonstarwars/shared/enums/e_request_type.dart';

class BaseService {
  String baseUrl = "https://swapi.dev/api";
  final String url;
  final ERquestType method;
  String get finalUrl => "$baseUrl/$url";

  BaseService({required this.url, required this.method})
      : assert(url.length >= 3, method == ERquestType.Get) {
        print("BaseService(): Initialized with url: $url, method: $method, finalUrl:  $finalUrl");
      }

  Future<http.Response> get() async {
    try {
      print("BaseService.get(): Requesting url: $finalUrl");
      final response = await http.get(Uri.parse(finalUrl));
      print(
          "BaseService.get() url: $finalUrl, Success, response: ${response.statusCode}");
      return response;
    } catch (ex) {
      throw Exception(
          "BaseService.get(): Erro to request url:  $finalUrl, Error: $ex");
    }
  }
}
