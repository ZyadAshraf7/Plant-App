import 'dart:convert';

import '../../core/constants/api_strings.dart';
import '../shared_preference/user_preference.dart';
import 'package:http/http.dart' as http;

class ProductsRepository{
  Future fetchProducts()async{
    const url = ApiStrings.fetchProducts;
    final token = UserPreferences.getUserToken();
    final response = await http.get(Uri.parse(url),headers: {
      "Authorization":"Bearer $token",
    });
    print(response.body);
    return jsonDecode(response.body)as Map<String,dynamic>;
  }
}