import 'dart:convert';

import 'package:plant_app/app/core/constants/api_strings.dart';
import 'package:http/http.dart' as http;

import '../shared_preference/user_preference.dart';

class FetchBlogsRepository {
  fetchBlogs() async {
    const url = ApiStrings.fetchBlogs;
    final token = UserPreferences.getUserToken();
    final response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
    });
    return jsonDecode(response.body);
  }
}
