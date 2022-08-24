import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:plant_app/app/data/repositories/fetch_seeds.dart';

import '../../../data/models/seeds.dart';

part 'fetch_seeds_state.dart';

class FetchSeedsCubit extends Cubit<FetchSeedsState> {
  FetchSeedsCubit({required this.seedsRepository}) : super(FetchSeedsInitial());
  SeedsRepository seedsRepository;
  List<Seed>seedsList=[];

  Future<void>fetchSeeds()async{
    try {
      emit(FetchSeedsLoading());
      final data = await seedsRepository.fetchSeeds();
      final seeds = data['data'] as List<dynamic>;
      seedsList = seeds.map((e) => Seed.fromJson(e)).toList();
      if(seedsList.isNotEmpty){
        emit(FetchSeedsSuccess());
      }else{
        emit(FetchSeedsError());
      }
    }catch(e){
      print(e);
      emit(FetchSeedsError());
    }
  }
  Seed findProductbyId(String id){
    return seedsList.firstWhere((e) => e.seedId==id);
  }
  void incrementQuantity(String id){
    final seed = findProductbyId(id);
    seed.quantity=(seed.quantity!+1);
    emit(FetchSeedsQuantityChange());
  }
  void decrementQuantity(String id){
    final seed = findProductbyId(id);
    if(seed.quantity!>1) {
      seed.quantity = (seed.quantity! - 1);
      emit(FetchSeedsQuantityChange());
    }
  }
}
