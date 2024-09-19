import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shopping_app/model/jjson_to_dart';

Future<List<Product>> fatchdata() async {
  final jsonstring =
      await rootBundle.loadString('assets/propular_products.json');
  final List<dynamic> jsonlist = json.decode(jsonstring);
  return jsonlist.map((json) => Product.fromJson(json)).toList();
}
