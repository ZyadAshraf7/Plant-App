import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:plant_app/app/data/models/user_model.dart';
import 'package:plant_app/app/data/shared_preference/user_preference.dart';

import '../../../data/repositories/signup_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.signupRepository}) : super(SignupInitial());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  SignupRepository signupRepository;
  UserAccount ?userAccount;

  Future<void>createUserAccount(String firstName,String lastName,String email,String password)async{
    emit(SignupLoading());
    try {
      final data = await signupRepository.sigupUser(
          firstName, lastName, email, password);
      if(data!=null){
        print("data is $data");
        final userData = data['data']['user'] as Map<String,dynamic>;
        userAccount = UserAccount.fromJson(userData);
        userAccount!.accessToken=userData['accessToken'];
        userAccount!.refreshToken=userData['refreshToken'];
        UserPreferences.setUserToken(data['data']['accessToken']);
        print(userAccount!.firstName);
        emit(SignupSuccess());
      }else{
        emit(SignupError());
        print ("data is null");
      }
    }catch(e){
      emit(SignupError());
      print(e.toString());
    }
  }

}
