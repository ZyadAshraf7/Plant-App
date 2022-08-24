import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:plant_app/app/data/models/blog.dart';
import 'package:plant_app/app/data/models/plant.dart';
import 'package:plant_app/app/data/models/seeds.dart';
import 'package:plant_app/app/data/models/tools.dart';
import 'package:plant_app/app/data/repositories/fetch_blogs_repository.dart';

part 'fetch_blogs_state.dart';

class FetchBlogsCubit extends Cubit<FetchBlogsState> {
  FetchBlogsCubit({required this.fetchBlogsRepository}) : super(FetchBlogsInitial());

  FetchBlogsRepository fetchBlogsRepository;
  late Blog blogsData;
  fetchBlogs()async{
    blogsData=Blog();
    try {
      emit(FetchBlogsLoading());
      final data = await fetchBlogsRepository.fetchBlogs();
      final plants = data['data']['plants'] as List<dynamic>;
      final seeds = data['data']['seeds'] as List<dynamic>;
      final tools = data['data']['tools'] as List<dynamic>;
      blogsData.plants = plants.map((e) => Plant.fromJson(e)).toList();
      blogsData.seeds = seeds.map((e) => Seed.fromJson(e)).toList();
      blogsData.tools = tools.map((e) => Tool.fromJson(e)).toList();
      emit(FetchBlogsLoaded());
    }catch(e){
      print(e.toString());
      emit(FetchBlogsError());
    }
  }
}
