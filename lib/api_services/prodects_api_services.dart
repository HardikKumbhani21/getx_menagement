import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> getProductApi() async {
  http.Response response =
      await http.get(Uri.parse("https://fakestoreapi.com/products"));
  return response.body;
}
