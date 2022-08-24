import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_app/app/plant_app.dart';
import 'package:plant_app/app/presentation/routing/app_router.dart';
import 'app/data/shared_preference/shared_preference.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  runApp( PlantApp(
    appRouter: AppRouter(),
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

}

/*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.applicationName,

    );
  }
}*/
