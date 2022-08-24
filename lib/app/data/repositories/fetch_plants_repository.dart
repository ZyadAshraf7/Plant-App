import 'dart:convert';

import 'package:plant_app/app/core/constants/api_strings.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/app/data/shared_preference/user_preference.dart';
class FetchPlantsRepository{
   Future fetchPlants()async{
    const url = ApiStrings.fetchPlants;
    final token = UserPreferences.getUserToken();
    final response = await http.get(Uri.parse(url),headers: {
      "Authorization":"Bearer $token",
    });
    print(response.body);
    return jsonDecode(response.body)as Map<String,dynamic>;
  }
}