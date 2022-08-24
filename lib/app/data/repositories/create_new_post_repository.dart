import 'dart:convert';

import 'package:plant_app/app/core/constants/api_strings.dart';
import 'package:http/http.dart' as http;

import '../shared_preference/user_preference.dart';
class CreateNewPostRepository{
  addNewPost(String title,String description,String imageBase64)async{
    const url = ApiStrings.createNewPost;
    final token = UserPreferences.getUserToken();
    final response = await http.post(Uri.parse(url),body: {
      "title": title,
      "description": description,
      "imageBase64": imageBase64,
    },headers: {
      "Authorization": "Bearer $token",
    });
    print(response.body);
    return jsonDecode(response.body);
  }
}