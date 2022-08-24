import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plant_app/app/core/constants/api_strings.dart';

import '../shared_preference/user_preference.dart';

class GetUserDataRepository {
  fetchUserData() async {
    const url = ApiStrings.fetchUserData;
    final token = UserPreferences.getUserToken();
    final response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
    });
    return jsonDecode(response.body);
  }

  changeUserData(
      String email, String firstName, String lastName, String address) async {
    const url = ApiStrings.changeUserData;
    final token = UserPreferences.getUserToken();
    final response = await http.patch(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
    }, body: {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'address': address,
    });
    print(response.body);
    return jsonDecode(response.body);
  }
}
