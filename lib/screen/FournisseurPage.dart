import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FournisseurPage extends StatefulWidget {
  @override
  State<FournisseurPage> createState() => _FournisseurPageState();
}

class _FournisseurPageState extends State<FournisseurPage> {
  TextEditingController txt_login = new TextEditingController();

  TextEditingController txt_password = new TextEditingController();

  bool Etat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context,'/home');
          }, icon:Icon(Icons.arrow_back_ios , color: Color.fromRGBO(255, 122, 51, 10) )),
        title: Text('Espace Fournisseur',style: TextStyle(
          fontSize: 16,
          color: Color.fromRGBO(255, 122, 51, 10),


        ),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:  Center(

          child: Column(

              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 5 , left: 20 , right: 20),
                  child: TextField(
                    controller: txt_login,


                    decoration: InputDecoration(

                      prefixIcon: Icon(Icons.person),

                      hintText: "Identifiant ",
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(50 ),

                      ),

                      labelText: "Identifiant",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    maxLength: 50,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 5 , left: 20 , right: 20),
                  child: TextField(
                    controller: txt_password,

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            Etat=!Etat;

                          });

                        }, icon: Icon(Icons.visibility),
                      ),
                      hintText: "Mot de Passe",
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      labelText: "mot de passe",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: Etat,
                    maxLength: 10,
                  ),
                ),


                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    side: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(255, 122, 51, 100)
                    ),
                  ),
                  onPressed: () {
                    _onAuthentifier(context);
                    print('connect');

                  },
                  child: Text(
                    "Connexion",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 122, 51, 10),

                      fontFamily: 'Aboret',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )



              ]
          )
      )
    );
  }
  Future<void> _onAuthentifier (BuildContext context) async
  {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: txt_login.text.trim(), password: txt_password.text.trim());
      Navigator.pop(context);
      Navigator.pushNamed(context, '/EspaceFr');
    }on FirebaseAuthException catch(e){
      SnackBar snackBar = SnackBar(content: Text(""));
      if(e.code == 'user-not-found'){
        snackBar = SnackBar(content: Text('Utilisateur inexistant'),);
      }else if (e.code =='wrong-password'){
        snackBar = SnackBar(content: Text('Verifier votre mot de passe'));
      }
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

  }
}


