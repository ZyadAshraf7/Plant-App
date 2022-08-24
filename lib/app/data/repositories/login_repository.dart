import 'dart:convert';

import 'package:plant_app/app/core/constants/api_strings.dart';
import 'package:http/http.dart' as http;
class LoginRepository{
  Future<dynamic> loginUser(String email,String password)async{
    try {
      const url = ApiStrings.loginApi;
      final response = await http.post(Uri.parse(url), body: {
        'email': email,
        'password': password,
      });
      print(response.body);
      return jsonDecode(response.body) as Map<String, dynamic>;
    }catch(e){
      print(e.toString());
    }
  }

  Future<dynamic>loginWithGoogle(String id,String email,String firstName,String lastName,String photoUrl)async{
    const url = ApiStrings.googleApi;
  final response = await  http.post(Uri.parse(url),body: {
      'id':id,
      'email':email,
      'firstName':firstName,
      'lastName':lastName,
      'picture':photoUrl,
    });
    print(response.body);
    return jsonDecode(response.body);
  }
  Future<dynamic>loginWithFacebook(String id,String email,String firstName,String lastName,String photoUrl)async{
    const url = ApiStrings.facebookApi;
    final response = await  http.post(Uri.parse(url),body: {
      'id':id,
      'email':email,
      'firstName':firstName,
      'lastName':lastName,
      'picture':photoUrl,
    });
    print(response.body);
    return jsonDecode(response.body);
  }
}