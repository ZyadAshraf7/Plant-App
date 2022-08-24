import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:plant_app/app/data/repositories/create_new_post_repository.dart';

part 'add_new_post_state.dart';

class AddNewPostCubit extends Cubit<AddNewPostState> {
  AddNewPostCubit({required this.createNewPostRepository}) : super(AddNewPostInitial());
  File? image;
  Uint8List?bytes;
  String ? imageBase64;
  CreateNewPostRepository createNewPostRepository;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String imageLink = "data:image/jpeg;base64,";
  Future<String?> getImage()async{
    var picker = ImagePicker();
    PickedFile ?imageToPick;
    imageToPick = await picker.getImage(source: ImageSource.camera);
    if(imageToPick!.path.isNotEmpty){
      image = File(imageToPick.path);
      bytes = File(image!.path).readAsBytesSync();
      imageBase64 = base64Encode(bytes!);
      // print(imageBase64);
      if (imageBase64!.length % 4 > 0) {
        imageBase64=imageBase64! + '=' * (4 - imageBase64!.length % 4) ;
      }

      log(imageBase64!);
      emit(ImagePickedSuccess());
      return imageLink+imageBase64!;
    }else{
      print("something went wrong");
    }
    return null;
  }
  Future<void>addNewPost(String title,String description,String imageBase64)async{
    try {
      emit(AddNewPostLoading());
      final data = await createNewPostRepository.addNewPost(
          title, description, imageBase64);
      if (data['type'] == 'Success') {
        emit(AddNewPostSuccess());
      } else {
        emit(AddNewPostError());
      }
    }catch(e){
      print(e.toString());
    }
  }

}
