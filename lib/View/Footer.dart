import 'package:flutter/material.dart';
Widget FooterWidget() =>
    Container(
        margin: EdgeInsets.all(8),

        decoration: BoxDecoration(
            color:  Colors.white,
            border: Border.all(
                width: 0.2,
                color: Colors.white),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
                BoxShadow(
                    color: Colors.orangeAccent,
                    spreadRadius: 1.5,
                    blurRadius: 3,
                    offset: Offset(0, 5), ),],),
        child: Column(children: [
            Container(
                padding: EdgeInsets.only(top: 15),
                child: Column(
                    children: [
                        Center(
                            child: CircleAvatar(
                                backgroundColor: Colors.orange,
                                backgroundImage: AssetImage("assets/images/sm.png" ),
                                radius: 30,
                            ),
                        ),
                        SizedBox(height: 5,),
                        Text("Satisfait ou Remboursé" ,style: TextStyle( fontWeight: FontWeight.bold),)

                    ],
                ),
            ),
            Container(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                    children: [
                        Center(
                            child: CircleAvatar(
                                backgroundColor: Colors.orange,
                                backgroundImage: AssetImage("assets/images/Mn.png" ),
                                radius: 30,
                            ),
                        ),
                        SizedBox(height: 5,),
                        Text("Paiment a la livrasion" ,style: TextStyle( fontWeight: FontWeight.bold),)

                    ],
                ),
            ),
            Container(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                    children: [
                        Center(
                            child: CircleAvatar(
                                backgroundColor: Colors.orange,
                                backgroundImage: AssetImage("assets/images/cart.png" ),
                                radius: 30,
                            ),
                        ),
                        SizedBox(height: 5,),
                        Text("Paiment en ligne" ,style: TextStyle( fontWeight: FontWeight.bold),)

                    ],
                ),
            ),
            Container(
                padding: EdgeInsets.only(top: 30 ,bottom: 15),
                child: Column(
                    children: [
                        Center(
                            child: CircleAvatar(
                                backgroundColor: Colors.orange,
                                backgroundImage: AssetImage("assets/images/247.png" ),
                                radius: 30,
                            ),
                        ),
                        SizedBox(height: 5,),
                        Text("24/7 Service" ,style: TextStyle( fontWeight: FontWeight.bold),)

                    ],
                ),
            )

        ],),

    );