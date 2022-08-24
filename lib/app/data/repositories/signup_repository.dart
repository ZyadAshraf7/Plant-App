import 'dart:convert';

import 'package:plant_app/app/core/constants/api_strings.dart';
import 'package:http/http.dart' as http;
class SignupRepository{
   sigupUser(String firstName,String lastName,String email,String password)async{
    try {
      const url = ApiStrings.signupApi;
      final response = await http.post(Uri.parse(url), body: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
      });
      return jsonDecode(response.body) as Map<String,dynamic>;
    }catch(e){
      print(e.toString());
    }
  }

}