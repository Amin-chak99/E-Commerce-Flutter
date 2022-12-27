import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:eshop/screen/mylist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'addproduce.dart';
class EspaceFr extends StatefulWidget {
  const EspaceFr({Key? key}) : super(key: key);

  @override
  State<EspaceFr> createState() => _EspaceFrState();
}
int _page = 0;
GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();


class _EspaceFrState extends State<EspaceFr> {
  var page ;


  void setbodyPage(){
    switch(_page){
      case 0:
        page= addproduce();
        break;
      case 1:
        page= mylist();   break;
    }
  }


  @override
  Widget build(BuildContext context) {
    final user=FirebaseAuth.instance.currentUser;

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromRGBO(225, 225, 225, 10),
        key: _bottomNavigationKey,
        items: [
          CurvedNavigationBarItem(icon: Icon(Icons.add, size: 30), label: "Add" ,),
          CurvedNavigationBarItem(icon: Icon(Icons.list, size: 30), label: "List"),
        ],

        buttonBackgroundColor: Color.fromRGBO(255, 122, 51, 50),
        buttonLabelColor: Color.fromRGBO(255, 122, 51, 50) ,

        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        onTap: (index) {
          setState(() {

            _page = index;
            setbodyPage();
            print(_page);
          });
        },
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context,'/Fournisseur');
            }, icon:Icon(Icons.arrow_back_ios , color:Color.fromRGBO(225, 225, 225, 10) )),
        title: Text('Espace Fournisseur',style: TextStyle(
          fontSize: 16,
          color: Colors.white,

        ),),
        backgroundColor: Color.fromRGBO(255, 122, 51, 30),
        elevation: 2,
      ),
      body: Container(
        color:Color.fromRGBO(225, 225, 225, 10),
        child: Center(
          child: Flexible(
            child: (_page ==0 ? addproduce(): page),

          ),
        ),
      ),
    );
  }
}
