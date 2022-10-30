import 'dart:convert';

import 'package:myshop/models/auth_token.dart';
import 'package:myshop/models/product.dart';
import 'package:myshop/services/firebase_service.dart';
import 'package:http/http.dart' as http;

class ProductService extends FirebaseService {
  ProductService([AuthToken? authToken]) : super(authToken);

  Future<List<Product>> fetchProducts([bool filterByUser = false]) async {
    final List<Product> products = [];
    try {
      final filters = filterByUser ? 'orderBy=creatorId&equalTo="$userId"' : '';
      final productsUrl =
          Uri.parse('$databaseUrl/products.json?auth=$token&$filters');
      final respone = await http.get(productsUrl);

      final productsMap = jsonDecode(respone.body);

      if (respone.statusCode != 200) {
        print(productsMap['error']);
        return products;
      }

      final userFavoritesUrl =
          Uri.parse('$databaseUrl/userFavorites/$userId.json?auth=$token');
      final userFavoritesResponse = await http.get(userFavoritesUrl);
      final userFavoritesMap = jsonDecode(userFavoritesResponse.body);

      productsMap.forEach((productId, product) {
        final isFavorite = (userFavoritesMap == null)
            ? false
            : (userFavoritesMap[productId] ?? false);

        products.add(
          Product.fromJson({
            'id': productId,
            ...product,
          })
            ..copyWith(isFavorite: isFavorite),
        );
      });
      return products;
    } catch (error) {
      print(error);
      return products;
    }
  }

  Future<Product?> addProduct(Product product) async {
    try {
      final url = Uri.parse('$databaseUrl/products.json?auth=$token');
      final respone = await http.post(
        url,
        body: json.encode(product.toJson()..addAll({'creatorId': userId})),
      );

      if (respone.statusCode != 200) {
        throw Exception(json.decode(respone.body)['error']);
      }

      return product.copyWith(
        id: json.decode(respone.body)['name'],
      );
    } catch (error) {
      print(error);
      return null;
    }
  }
}
