import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eshop/View/Carousel_Loading.dart';
import 'package:eshop/screen/home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    checkConnectitivy();
  }

  void checkConnectitivy() async {
    var result = await Connectivity().checkConnectivity();

    print(result.name);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              return Scaffold(
                body: snapshot.data == ConnectivityResult.none
                    ? CarouselLoading()
                    : HomePage(),
              );
            }));
  }
}