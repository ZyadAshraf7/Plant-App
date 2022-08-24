import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:plant_app/app/data/repositories/fetch_plants_repository.dart';

import '../../../data/models/plant.dart';

part 'fetch_plants_state.dart';

class FetchPlantsCubit extends Cubit<FetchPlantsState> {
  FetchPlantsCubit({required this.fetchPlantsRepository}) : super(FetchPlantsInitial());
  FetchPlantsRepository fetchPlantsRepository;
  List<Plant> plantsProducts=[];

  Future<void>fetchPlants()async{
    emit(FetchPlantsLoading());
    print("loading");
    try {
      emit(FetchPlantsLoading());
      final data = await fetchPlantsRepository.fetchPlants();
      final plants = data['data'] as List<dynamic>;
      plantsProducts = plants.map((e) => Plant.fromJson(e)).toList();
      if(plantsProducts.isNotEmpty){
        emit(FetchPlantsSuccess());
        print(plantsProducts[0].name);
        emit(FetchPlantsSuccess());
      }else{
        emit(FetchPlantsError());
      }
    }catch(e){
      emit(FetchPlantsError());
      print(e.toString());
    }
  }
  Plant findProductbyId(String id){
    return plantsProducts.firstWhere((e) => e.plantId==id);
  }
   incrementQuantity(String id){
    final plant = findProductbyId(id);
    plant.quantity=(plant.quantity!+1);
    emit(FetchPlantsQuantityChange());
  }
  void decrementQuantity(String id){
    final plant = findProductbyId(id);
    if(plant.quantity!>1){
      plant.quantity=(plant.quantity!-1);
      emit(FetchPlantsQuantityChange());
    }
  }
}
