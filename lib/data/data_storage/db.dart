import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/product/product.dart';
import 'dart:convert';

Future<void> storeProduct(Product product) async {
  final prefs = await SharedPreferences.getInstance();
  final productList = (prefs.getStringList('products') ?? <String>[])
      .map((json) => Product.fromJson(jsonDecode(json)))
      .toList();
  productList.add(product);
  await prefs.setStringList('products',
      productList.map((product) => jsonEncode(product.toMap())).toList());
}
