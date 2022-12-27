import 'package:eshop/screen/home.dart';
import 'package:flutter/material.dart';

class cartPage extends StatefulWidget {
  List<home> Liste= [];
  cartPage(this.Liste);



  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  List<Map<String ,String>> products= [];
  var counts ;

  int i=0;


  
  void _incrmente(){
    setState(() {
      i++;
    });

  }
  void _decremente(){
    setState(() {
      if(i>0)
        i--;
    });}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pannier"),
        leading: IconButton(onPressed: () {
          Navigator.pushNamed(context, '/home');
        }, icon: Icon(Icons.arrow_back, color: Colors.black,),),
        backgroundColor: Color.fromRGBO(255, 122, 51, 10),

      ),
      body: Container(
        child :ListView.builder(
            itemCount:products.length ,
            itemBuilder: (BuildContext context, int index) {

              return Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(top: 15, bottom: 15 ,right: 5),
                  decoration: BoxDecoration(
                    color:  Colors.white,
                    border: Border.all(
                        width: 0.2,
                        color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1.5,
                        blurRadius: 3,
                        offset: Offset(0, 5), ),],),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Radio(value: "",
                        groupValue: "",
                        activeColor: Color.fromRGBO(255, 122, 51, 10),
                        onChanged: (index){},),
                      Container(
                        width: 90,
                        height: 100,
                        child: Image.network((widget.Liste[index].image.toString()),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(widget.Liste[index].marque.toString().toUpperCase(),style: TextStyle(
                                  color: Color.fromRGBO(255, 122, 51, 10),
                                  fontSize: 22),),


                            ],
                          ),
                          ),
                          SizedBox(
                            height: 25,

                          ),
                          Text('${widget.Liste[index].prix.toString()} DT',style: TextStyle(
                            fontSize: 15
                          ),
                          ),
                          SizedBox(
                            height:10,


                          ),



                        ],
                      )
                      ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         IconButton(onPressed:() {
                           setState(() {
                             widget.Liste.removeAt(index);
                           });
                         }, icon: Icon(Icons.delete,  color: Colors.red,)),
                         SizedBox(
                           height: 25,

                         ),
                         Row(


                           children: [

                             Container(padding: EdgeInsets.all(4),
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(30),
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.grey.withOpacity(0.5),
                                       spreadRadius: 1,
                                       blurRadius: 10,
                                     ),
                                   ]
                               ),
                               child: SizedBox(
                                 height: 30,
                                 width: 30,
                                 child:IconButton(
                                   icon: Icon(Icons.add,),
                                   iconSize: 17,
                                   onPressed: (){
                                     _incrmente();
                                   },
                                 ),
                               ),

                             ),
                             Container(
                               margin: EdgeInsets.symmetric(horizontal: 10),
                               child: Text(
                                 "$i",
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 16,
                                   color: Color(0xFF4C53A5),
                                 ),

                               ),

                             ),
                             Container(padding: EdgeInsets.all(4),
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(20),
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.grey.withOpacity(0.5),
                                       spreadRadius: 1,
                                       blurRadius: 10,
                                     ),
                                   ]
                               ),
                               child: SizedBox(
                                 height: 30,
                                 width: 30,
                                 child:IconButton(
                                   icon: Icon(Icons.remove),
                                   iconSize: 18,
                                   onPressed: (){
                                     _decremente();
                                   },
                                 ),
                               ),
                             )
                           ],
                         ) ,
                       ],
                     ),
                    ],
                  ),

                )
              );
            }),
      )
       );

  }
}
