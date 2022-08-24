import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/buisness_logic/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:plant_app/app/core/constants/style_manager.dart';
import 'package:plant_app/app/presentation/screens/profile_screen/widgets/edit_profile_box.dart';
import 'package:plant_app/app/presentation/screens/profile_screen/widgets/profile_box.dart';
import 'package:plant_app/app/presentation/widgets/cutom_loading_spinner.dart';

import '../../../core/constants/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<GetUserDataCubit>(context).fetchUserData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<GetUserDataCubit, GetUserDataState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<GetUserDataCubit>(context);
          final userData = cubit.userAccount;
          if (state is GetUserDataLoading) {
            return CustomLoadingSpinner();
          }
          return SizedBox(
            height: size.height,
            child: Stack(
              //alignment: Alignment.bottomCenter,
              children: [
                ProfileBox(size: size, userData: userData),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    child: Container(
                      height: size.height * 0.58,
                      width: size.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 21),
                            decoration: BoxDecoration(
                              color: Color(0xffF3FEF1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Image.asset("assets/images/stars.png"),
                                SizedBox(width: 14),
                                Text(
                                  "You have ${userData?.userPoints == "" ? 0 : userData?.userPoints} points",
                                  style: getSemiBoldStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          Text(
                            "Edit Profile",
                            style: getSemiBoldStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 24),
                          EditProfileBox(
                            title: "Change Name",
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (builder) {
                                    return AlertDialog(
                                      actions: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            primary: AppColors.primaryGreen,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Cancel"),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            primary: AppColors.primaryGreen,
                                          ),
                                          onPressed: () {
                                            cubit.changeUserData(
                                              cubit.userAccount!.email!,
                                              cubit.firstName.text,
                                              cubit.lastName.text,
                                              "address",
                                            );
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Submit"),
                                        ),
                                      ],
                                      title: Column(
                                        children: [
                                          TextFormField(
                                            controller: cubit.firstName,
                                            decoration: InputDecoration(
                                                hintText: cubit
                                                    .userAccount?.firstName),
                                          ),
                                          TextFormField(
                                            controller: cubit.lastName,
                                            decoration: InputDecoration(
                                                hintText: cubit
                                                    .userAccount?.lastName),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                          ),
                          SizedBox(height: 24),
                          EditProfileBox(
                            title: "Change Email",
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (builder) {
                                    return AlertDialog(
                                      actions: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            primary: AppColors.primaryGreen,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Cancel"),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            primary: AppColors.primaryGreen,
                                          ),
                                          onPressed: () {
                                            cubit.changeUserData(
                                              cubit.email.text,
                                              cubit.userAccount!.firstName!,
                                              cubit.userAccount!.lastName!,
                                              "address",
                                            );
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Submit"),
                                        ),
                                      ],
                                      title: TextFormField(
                                        controller: cubit.email,
                                        decoration: InputDecoration(
                                            hintText: cubit.userAccount?.email),
                                      ),
                                    );
                                  });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
