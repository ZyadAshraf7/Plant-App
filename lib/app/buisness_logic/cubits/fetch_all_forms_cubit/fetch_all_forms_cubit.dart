import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:plant_app/app/data/repositories/fetch_all_forums_repository.dart';

import '../../../data/models/forums.dart';

part 'fetch_all_forms_state.dart';

class FetchAllFormsCubit extends Cubit<FetchAllFormsState> {
  FetchAllFormsCubit({required this.fetchAllForumsRepository}) : super(FetchAllFormsInitial());

  FetchAllForumsRepository fetchAllForumsRepository;
  List<Forum> allForums=[];

  void fetchAllForums()async{
    emit(FetchAllFormsLoading());
    try {
      print("fetching formus");
      final responseBody = await fetchAllForumsRepository.fetchAllForums();
      final data = responseBody['data'] as List<dynamic>;
      allForums = data.map((e) => Forum.fromJson(e)).toList();
      print(allForums.first.title);
      print(allForums.first.forumLikes!.first.userId);
      print(allForums.first.forumComments!.first.comment);
      if(allForums.isNotEmpty){
        emit(FetchAllFormsLoaded());
      }else{
        emit(FetchAllFormsError());
      }
    }catch(e){
      print(e.toString());
      emit(FetchAllFormsError());
    }
  }
}
