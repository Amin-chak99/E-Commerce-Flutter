import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'Home_Screen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:Column(
        children: [
          Image.asset('assets/images/AC.png'),
          Text('AC SHOP', style: TextStyle(fontSize:32 , fontWeight: FontWeight.bold , color: Colors.red) )
        ],
      ),
      backgroundColor: Colors.orange.shade700,
      nextScreen: HomeScreen(),
      splashIconSize: 450,
      splashTransition: SplashTransition.scaleTransition ,
      pageTransitionType: PageTransitionType.bottomToTop,
      duration:2000,
    );
  }
}
