import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../Controller/Network_Controller.dart';
import '../View/Carousel_Loading.dart';
import 'home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  GetBuilder<NetworkController>(
        init: NetworkController(),
        builder: (value){

           return  Container(

             child: value.Conctivite == 'none'

                 ? CarouselLoading()
                 : HomePage(),
           );
        });
  }
}
