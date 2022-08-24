import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/buisness_logic/cubits/add_new_post_cubit/add_new_post_cubit.dart';
import 'package:plant_app/app/core/constants/app_strings.dart';
import 'package:plant_app/app/core/constants/style_manager.dart';
import 'package:plant_app/app/presentation/widgets/custom_button.dart';
import 'package:plant_app/app/presentation/widgets/custom_text_field.dart';
import 'package:plant_app/app/presentation/widgets/cutom_loading_spinner.dart';

import '../../../buisness_logic/cubits/fetch_all_forms_cubit/fetch_all_forms_cubit.dart';
import '../../../core/constants/app_colors.dart';

class AddNewPostScreen extends StatelessWidget {
  const AddNewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Create New Post",
          style: getBoldStyle(
            color: Colors.black,
            fontSize: 21,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<AddNewPostCubit, AddNewPostState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<AddNewPostCubit>(context);
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<AddNewPostCubit>(context).getImage();
                    },
                    child: Container(
                      height: 136,
                      width: 136,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.primaryGreen)),
                      child: cubit.imageBase64 != null
                          ? Container(
                              child: Image.memory(
                                base64Decode(
                                  cubit.imageBase64.toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add,
                                  color: AppColors.primaryGreen,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Add photo",
                                  style: getMediumStyle(
                                    color: AppColors.primaryGreen,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                  SizedBox(height: 30),
                  CustomTextField(
                    title: "Title",
                    textEditingController: cubit.title,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    title: "Description",
                    textEditingController: cubit.description,
                    maxLines: 7,
                  ),
                  SizedBox(height: 40),
                  state is AddNewPostLoading
                      ? CustomLoadingSpinner()
                      : CustomButton(
                          onTap: () {
                            cubit.addNewPost(cubit.title.text,
                                cubit.description.text, CONSTANTIMAGEBASE64).then((value){
                                  Navigator.of(context).pop();
                            });
                          },
                          title: "Post",
                          hasBorder: false,
                          margin: EdgeInsets.zero,
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
