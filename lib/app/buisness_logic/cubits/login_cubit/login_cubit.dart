import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:plant_app/app/data/models/user_model.dart';

import '../../../data/repositories/login_repository.dart';
import '../../../data/shared_preference/user_preference.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepository}) : super(LoginInitial());
  LoginRepository loginRepository;
  TextEditingController emaiController = TextEditingController();
  TextEditingController password = TextEditingController();
  UserAccount? userAccount;
  final googleSignIn = GoogleSignIn();
  String photo =
      "https://icon-library.com/images/google-user-icon/google-user-icon-7.jpg";

  Future googleSignin() async {
    emit(GoogleSignInLoading());
    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      /* print(account!.email);
      print(account.photoUrl);
      print(account.displayName);*/
      final name = account!.displayName!.split(" ");
      print(name.first);
      print(name.last);
      final response = await loginRepository.loginWithGoogle(
        account.id,
        account.email,
        name.last,
        name.last,
        account.photoUrl ?? photo,
      );
      userAccount = UserAccount.fromJson(response['data']['user']);
      userAccount?.accessToken = response['data']['accessToken'];
      if (userAccount != null) {
        UserPreferences.setUserToken(response['data']['accessToken']);
        print(userAccount!.accessToken);
        print("response is $response");
        emit(GoogleSignInSuccess());
      }
    } catch (e) {
      print(e);
      emit(GoogleSignInFailed());
    }
  }

  Future googleSignOut() async {
    await googleSignIn
        .disconnect(); /*.then((value) {
      emit(GoogleSignOut());
    });*/
  }

  Future<void> loginUser(String email, String password) async {
    emit(LoginLoading());
    try {
      final data = await loginRepository.loginUser(email, password);
      if (data != null) {
        print("data is $data");
        final userData = data['data']['user'] as Map<String, dynamic>;
        userAccount = UserAccount.fromJson(userData);
        userAccount!.accessToken = userData['accessToken'];
        userAccount!.refreshToken = userData['refreshToken'];
        UserPreferences.setUserToken(data['data']['accessToken']);
        print(userAccount!.firstName);
        print("login success");
        emit(LoginSuccess());
      }
    } catch (e) {
      emit(LoginError());
      print(e);
    }
  }

  String prettyPrint(Map json) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String pretty = encoder.convert(json);
    return pretty;
  }

  Future<void> loginWithFacebook() async {
    try {
      emit(FacebookLoginLoading());
      final LoginResult result = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      // prettyPrint(userData);
      final fullName = userData['name'] as String;
      final name = fullName.split(" ");
      print(userData);
      final response = await loginRepository.loginWithFacebook(
        userData['id'],
        userData['email'],
        name.first,
        name.last,
        userData['picture']['data']['url'],
      );
      print(userData['picture']['data']['url']);
      userAccount!.email = userData['email'];
      userAccount!.firstName = name.first;
      userAccount!.lastName = name.last;
      userAccount!.imageUrl = userData['picture']['data']['url'];
      userAccount?.accessToken = result.accessToken?.token;
    print("facebook token: ${result.accessToken}");
    emit(FacebookLoginSuccess());
    } catch (e) {
    print(e.toString());
    emit(FacebookLoginError());
    }
  }
}
