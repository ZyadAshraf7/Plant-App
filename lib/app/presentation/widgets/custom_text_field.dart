import 'package:flutter/material.dart';
import 'package:plant_app/app/core/constants/app_colors.dart';
import 'package:plant_app/app/core/constants/style_manager.dart';
import 'package:plant_app/app/core/constants/values_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    required this.textEditingController,  this.maxLines,
  }) : super(key: key);
  final String title;
  final int? maxLines;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: getMediumStyle(
            color: AppColors.darkGrey,
          ),
        ),
        const SizedBox(height: AppValues.s10),
        TextFormField(
          maxLines: maxLines??1,
          cursorColor: AppColors.darkGrey,
          textAlignVertical: TextAlignVertical.center,
          controller: textEditingController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: AppValues.s10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppValues.s5),
              borderSide: const BorderSide(
                color: AppColors.borderGrey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppValues.s5),
              borderSide: const BorderSide(
                color: AppColors.borderGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
