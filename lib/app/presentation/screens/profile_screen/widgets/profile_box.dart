import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plant_app/app/buisness_logic/cubits/fetch_all_forms_cubit/fetch_all_forms_cubit.dart';
import 'package:plant_app/app/core/constants/route_names.dart';
import 'package:plant_app/app/core/constants/style_manager.dart';
import 'package:plant_app/app/data/shared_preference/user_preference.dart';
import 'package:plant_app/app/presentation/screens/discussion_forums/discussion_forums.dart';

import '../../../../buisness_logic/cubits/login_cubit/login_cubit.dart';
import '../../../../buisness_logic/cubits/signup_cubit/signup_cubit.dart';
import '../../../../data/models/user_model.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({
    Key? key,
    required this.size,
    required this.userData,
  }) : super(key: key);

  final Size size;
  final UserAccount? userData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height * 0.4,
          width: size.width,
          child: Image.network(
            userData!.imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.8),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem<String>(
                  child: GestureDetector(

                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteNames.discussionForumsScreen);
                    },
                    child: const Text(
                      "Discussion Forum",
                    ),
                  ),
                ),
                PopupMenuItem(child: GestureDetector(
                  onTap: (){
                    try {
                      BlocProvider.of<LoginCubit>(context).googleSignOut();
                      Navigator.pushReplacementNamed(
                          context, RouteNames.loginScreen);
                      UserPreferences.setUserToken("");
                      BlocProvider.of<LoginCubit>(context).userAccount=null;
                      BlocProvider.of<SignupCubit>(context).userAccount=null;
                      FacebookAuth.instance.logOut();
                    }catch(e){
                      print(e.toString());
                    }
                  },
                  child: Text("Signout"),
                ))
              ];
            },
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                width: 150.0,
                height: 150.0,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      userData!.imageUrl!,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(80.0)),
                ),
              ),
              SizedBox(height: 4),
              Text(
                "${userData?.firstName!} ${userData!.lastName!}",
                style: getSemiBoldStyle(color: Colors.white, fontSize: 24),
              )
            ],
          ),
        ),
      ],
    );
  }
}
