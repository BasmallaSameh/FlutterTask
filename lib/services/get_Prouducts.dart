

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:project/Models/Product_Model.dart';

class ProductService {
  final Dio dio;
  ProductService({required this.dio});

  Future<List<ProductModel>> fetchProducts() async {
    try {
      Response response = await dio.get("https://dummyjson.com/products");
      if (response.statusCode == 200) {
        // Check if the response data is a Map and contains the 'products' key
        if (response.data is Map<String, dynamic> &&
            response.data.containsKey('products')) {
          final List<dynamic> productsJson = response.data['products'];
          List<ProductModel> products = [];
          for (final productJson in productsJson) {
            try {
              final product = ProductModel.fromJson(productJson);
              products.add(product);
            } catch (e) {
              print('Error parsing product: $productJson');
              print(e);
            }
          }
          return products;
        } else {
          throw Exception(
              'Failed to load products - "products" key is missing or null');
        }
      } else {
        throw Exception(
            'Failed to load products - Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
