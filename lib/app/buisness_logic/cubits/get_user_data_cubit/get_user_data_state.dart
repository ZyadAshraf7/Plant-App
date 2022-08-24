part of 'get_user_data_cubit.dart';

@immutable
abstract class GetUserDataState {}

class GetUserDataInitial extends GetUserDataState {}
class GetUserDataLoading extends GetUserDataState {}
class GetUserDataLoaded extends GetUserDataState {}
class GetUserDataError extends GetUserDataState {}
class ChangeUserDataLoading extends GetUserDataState {}
class ChangeUserDataSuccess extends GetUserDataState {}
class ChangeUserDataError extends GetUserDataState {}
