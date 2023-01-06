import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'AppTextFiled.dart';
import 'EspaceFr.dart';
import 'mylist.dart';
FirebaseDatabase fire = FirebaseDatabase.instance;
DatabaseReference ref = fire.ref();
class addproduce extends StatefulWidget {
  const addproduce({Key? key}) : super(key: key);
  @override
  State<addproduce> createState() => _addproduceState();
}
class _addproduceState extends State<addproduce> {
  final List<SelectedListItem> _listOfCities = [
    SelectedListItem(name: "Ordinateur Portable",),
    SelectedListItem(name: "Climatiseur",),
    SelectedListItem(name: "Imprimente",),
    SelectedListItem(name: "OrdinateurFix"),
    SelectedListItem(name: "Telephone"),
    SelectedListItem(name: "frigidaire"),
    SelectedListItem(name: "machine a laver"),
    SelectedListItem(name: "machine a vaisselle"),
    SelectedListItem(name: "bisiklet"),
    SelectedListItem(name: "plaque chauffante"),
    SelectedListItem(name: "vetement homme"),
    SelectedListItem(name: "vetement femme"),];
  final TextEditingController _nameProductTextEditingController =
  TextEditingController();
  final TextEditingController _descTextEditingController =
  TextEditingController();
  final TextEditingController _catTextEditingController =
  TextEditingController();
  final TextEditingController _prixTextEditingController =
  TextEditingController();
  String imgRef='';
  @override
  void dispose() {
    super.dispose();
    _nameProductTextEditingController.dispose();
    _descTextEditingController.dispose();
    _catTextEditingController.dispose();
    _prixTextEditingController.dispose();
  }
  String? fileName;
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  String imagename='';
  Widget BuildProgress() => StreamBuilder<TaskSnapshot> (
      stream: uploadTask?.snapshotEvents,
      builder:(context,snapshot){
        if (snapshot.hasData){
          final data = snapshot.data!;
          double progress = data.bytesTransferred/data.totalBytes;
          return SizedBox(
            height: 10,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(

                      value: progress,
                      backgroundColor: Colors.grey,
                      color:const Color.fromRGBO(255, 122, 51, 10)
                  ),
                ),
                Center(
                  child: Text(
                    '${(100*progress).roundToDouble()}%',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                    ),
                  ),
                )
              ],
            ),
          );
        }else{
          return const SizedBox(height: 10);
        }
      }
  );
  Future uploadfile() async{
    final path= 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);

    setState(()   {
      uploadTask=ref.putFile(file);
    });
    final snapshot = await uploadTask!.whenComplete(() {});

    var imgRe = await (await uploadTask!.whenComplete(() {})).ref.getDownloadURL();
    imgRef = imgRe.toString();
    setState(() {
      uploadTask=null;

      print('houni ${imgRef}');
    });
  }

   Future takePh() async {
    final result = await FilePicker.platform.pickFiles(
    );

    if(result == null) return;
    setState(() {
      pickedFile = result.files.first;
      imagename = result.files.first.name.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(225, 225, 225, 10),
        resizeToAvoidBottomInset: false,
        body: Container(
          child: LayoutBuilder(builder: (BuildContext ,BoxConstraints) {
            return SingleChildScrollView(
              child: SafeArea(
                child: _mainBody(),
              ),
            );
          }
            ,),
        )
    );
  }
  Widget _mainBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0 , right: 20 ,top: 12.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            width: 80,
            height: 80,
            child: const Center(
              child: CircleAvatar(
                backgroundColor: Color.fromRGBO(225, 112, 51, 50),
                radius: 80,
                child:  Icon(Icons.shopify_sharp , size: 60,color: Colors.white,),

              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: const Text('Produit',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 27,
            ),),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: const Text('Remplire se formulaire pour ajouter un nouveau Produit.',style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                color: Colors.black
            ),),
          ),
          const SizedBox(
            height: 15.0,
          ),
          AppTextField(
            isCitySelected: true,
            cities: _listOfCities,
            textEditingController: _catTextEditingController,
            title: "Catégories",
            hint: "Choisir un catégorie",
          ),
          AppTextField(

            textEditingController: _nameProductTextEditingController,
            title: "Nom du Produit",
            hint: "Enter nom produit",
            isCitySelected: false,
          ),
          AppTextField(
            textEditingController: _descTextEditingController,
            title: "Description",
            hint: "Description produit",
            isCitySelected: false,
          ),
          AppTextField(
            textEditingController: _prixTextEditingController,
            title: "Prix",
            hint: "Prix produit",
            isCitySelected: false,
          ),

          Row(
            children: [
              IconButton(onPressed: () {
                takePh();
              }, icon: Icon(Icons.camera_alt),),
              Container(
                  child: pickedFile==null? Text("image non selectionné"):Image.file(File(pickedFile!.path!),width: 200,height:200 ,)
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          BuildProgress(),
          const SizedBox(
            height: 15.0,
          ),
          ElevatedButton(onPressed:() {

            print(fileName);
          }, child: Text("submit")),
          ElevatedButton(onPressed:()   async {
             affichage().whenComplete(() {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const EspaceFr()) );
             });
          }, child: Text("add")),
          const SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
  Future _onSaveMode() async {
   final docUser = FirebaseFirestore.instance.collection('users').doc();
   final user = User(
     nomProduit: _nameProductTextEditingController.text ,
     categorie:_catTextEditingController.text,
     description:_descTextEditingController.text,
     prix:_prixTextEditingController.text,
     imgRef:imgRef,
   );
   final json = user.toJson();
   await docUser.set(json);
  }

  Future<void> affichage() async {
    await uploadfile().then((value) {
      _onSaveMode();
      print(_nameProductTextEditingController.text);
      print('categories ${_catTextEditingController.text}');
      print(_descTextEditingController.text);
      print(_prixTextEditingController.text);
      print(imgRef);
  });}
}
class User{
  late final String nomProduit;
  late final String categorie;
  late final String description;
  late final String prix;
  late final String imgRef;
  User({
    required this.nomProduit,
    required this.categorie,
    required this.description,
    required this.prix,
    required this.imgRef,
});
  Map<String, dynamic> toJson() =>
      {
        "nom_Produit": nomProduit ,
        "categorie":categorie,
        "description":description,
        "prix":prix,
        "imagename":imgRef,
      };
  static User fromJson(Map<String, dynamic>json)=> User(
      nomProduit: json['nom_Produit'],
      categorie: json['categorie'],
      description: json['description'],
      prix: json['prix'],
      imgRef: json['imagename']);
}