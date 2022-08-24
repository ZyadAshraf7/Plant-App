import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:plant_app/app/data/models/user_model.dart';
import 'package:plant_app/app/data/repositories/get_user_data_repository.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit({required this.getUserDataRepository})
      : super(GetUserDataInitial());
  GetUserDataRepository getUserDataRepository;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  UserAccount? userAccount;

  fetchUserData() async {
    try {
      emit(GetUserDataLoading());
      final data = await getUserDataRepository.fetchUserData();
      final userData = data['data'];
      userAccount = UserAccount.fromJson(userData);
      if (userAccount != null) {
        emit(GetUserDataLoaded());
      } else {
        emit(GetUserDataError());
      }
      print(userAccount?.firstName);
    } catch (e) {
      print(e.toString());
      emit(GetUserDataError());
    }
  }

  void changeUserData(
      String email, String firstName, String lastName, String address) async {
    try {
      emit(ChangeUserDataLoading());
      final data = await getUserDataRepository.changeUserData(
          email, firstName, lastName, address);
      if(data['type']=='Success'){
        emit(ChangeUserDataSuccess());
      }else{
        emit(ChangeUserDataError());
      }
    }catch(e){
      print(e.toString());
      emit(ChangeUserDataError());
    }
    finally{
      fetchUserData();
    }
  }
}
