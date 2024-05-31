import 'dart:convert';

import 'package:apidan_oliw/model/gridview_model.dart';
import 'package:http/http.dart' as http;
class ApiService {
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}