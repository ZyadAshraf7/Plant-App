part of 'fetch_tools_cubit.dart';

@immutable
abstract class FetchToolsState {}

class FetchToolsInitial extends FetchToolsState {}
class FetchToolsLoading extends FetchToolsState {}
class FetchToolsSuccess extends FetchToolsState {}
class FetchToolsError extends FetchToolsState {}
class FetchToolsQuantityChange extends FetchToolsState {}
