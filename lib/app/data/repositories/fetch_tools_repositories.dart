import 'dart:convert';

import '../../core/constants/api_strings.dart';
import '../shared_preference/user_preference.dart';
import 'package:http/http.dart' as http;

class ToolsRepository{
  Future fetchtools()async{
    const url = ApiStrings.fetchtools;
    final token = UserPreferences.getUserToken();
    final response = await http.get(Uri.parse(url),headers: {
      "Authorization":"Bearer $token",
    });
    print(response.body);
    return jsonDecode(response.body)as Map<String,dynamic>;
  }
}