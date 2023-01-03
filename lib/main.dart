import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eshop/screen/EspaceFr.dart';
import 'package:eshop/screen/FournisseurPage.dart';
import 'package:eshop/screen/Splach_Screen.dart';
import 'package:eshop/screen/cartPage.dart';
import 'package:eshop/screen/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Binding/Product_binding.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //options: DefaultFirebaseOptions.currentPlatform;

  // await _onGetMode().then((value){
  //  GlobalParams.themeActuel.setMode(value);
  runApp(MyApp());

  // });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  final routers = {
    '/home': (context) => HomePage(),
    '/Fournisseur': (context) => FournisseurPage(),
    '/EspaceFr': (context) => EspaceFr(),
  };

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routers,
        home: SplashScreen(),
      initialBinding: ControllerBinding(),
      
        );
  }

  @override
  void initState() {
    super.initState();

    setState(() {});
  }

}
