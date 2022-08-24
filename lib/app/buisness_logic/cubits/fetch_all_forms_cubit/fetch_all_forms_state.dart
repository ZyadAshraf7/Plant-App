part of 'fetch_all_forms_cubit.dart';

@immutable
abstract class FetchAllFormsState {}

class FetchAllFormsInitial extends FetchAllFormsState {}
class FetchAllFormsLoading extends FetchAllFormsState {}
class FetchAllFormsLoaded extends FetchAllFormsState {}
class FetchAllFormsError extends FetchAllFormsState {}
