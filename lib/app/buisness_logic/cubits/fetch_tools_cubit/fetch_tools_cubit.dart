import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:plant_app/app/data/repositories/fetch_tools_repositories.dart';

import '../../../data/models/tools.dart';

part 'fetch_tools_state.dart';

class FetchToolsCubit extends Cubit<FetchToolsState> {
  FetchToolsCubit({required this.toolsRepository}) : super(FetchToolsInitial());
  ToolsRepository toolsRepository;
  List<Tool> toolsList = [];

  Future<void>fetchTools()async{
    try {
      emit(FetchToolsLoading());
      final data = await toolsRepository.fetchtools();
      final tools = data['data'] as List<dynamic>;
      toolsList = tools.map((e) => Tool.fromJson(e)).toList();
      if(toolsList.isNotEmpty){
        emit(FetchToolsSuccess());
      }else{
        emit(FetchToolsError());
      }
    }catch(e){
      print(e);
      emit(FetchToolsError());
    }
  }
  Tool findProductbyId(String id){
    return toolsList.firstWhere((e) => e.toolId==id);
  }
  void incrementQuantity(String id){
    final tool = findProductbyId(id);
    tool.quantity=(tool.quantity!+1);
    emit(FetchToolsQuantityChange());
  }
  void decrementQuantity(String id){
    final tool = findProductbyId(id);
    if(tool.quantity!>1){
      tool.quantity=(tool.quantity!-1);
      emit(FetchToolsQuantityChange());
    }
  }
}
