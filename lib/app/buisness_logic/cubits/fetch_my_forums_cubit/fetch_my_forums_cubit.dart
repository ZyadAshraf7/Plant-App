import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:plant_app/app/data/repositories/fetch_my_formus_repository.dart';

import '../../../data/models/forums.dart';

part 'fetch_my_forums_state.dart';

class FetchMyForumsCubit extends Cubit<FetchMyForumsState> {
  FetchMyForumsCubit({required this.fetchMyForumsRepository}) : super(FetchMyForumsInitial());

  FetchMyForumsRepository fetchMyForumsRepository;
  List<Forum> myForums = [];

  void fetchMyForums()async{
    emit(FetchMyForumsLoading());
    try {
      print("fetching formus");
      final responseBody = await fetchMyForumsRepository.fetchMyForums();
      final data = responseBody['data'] as List<dynamic>;
      myForums = data.map((e) => Forum.fromJson(e)).toList();
      if(myForums.isNotEmpty){
        emit(FetchMyForumsLoaded());
      }else{
        emit(FetchMyForumsError());
      }
    }catch(e){
      print(e.toString());
      emit(FetchMyForumsError());
    }
  }
}
