import 'dart:typed_data';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_feishola/bet.dart';
import 'package:app_feishola/admin.dart';
import 'package:app_feishola/mes_spots.dart';
import 'package:app_feishola/wid.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:country_picker/country_picker.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final nomPrenomController = TextEditingController();
  final numController = TextEditingController();
  final linksController = TextEditingController();

  File? image;
  var uploadimage;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      uploadimage = File(image.path);
      setState(() => this.image = uploadimage);
    } on PlatformException catch (e) {
      // //print('Failed to pick image: $e');
    }
  }

  String base64String = "";
  Future<void> uploadImage() async {
    String uploadurl = "https://tabaskimood.com/lac/feishola/spots_upload.php";

    Uint8List _bytes = await uploadimage.readAsBytes();

    String _base64String = base64.encode(_bytes);
    setState(() {
      base64String = _base64String;
      ////print(base64String);
    });
    var response = await http.post(Uri.parse(uploadurl),
        body: {'image': base64String, 'mail': numController.text});
    if (response.statusCode == 200) {
      // //print(response.body);
      var jsondata = json.decode(response.body);
      if (jsondata["error"]) {
        // //print(jsondata["msg"]);
      } else {
        ////print("Upload successful");
      }
    } else {
      //print("Error during connection to server");
    }
  }

  String photoLink = "https://tabaskimood.com/lac/feishola/spots_upload/";
  String? temps;

  bool show = false;
  inscription() async {
    setState(() {
      show = true;
    });
    var url =
        "https://tabaskimood.com/lac/feishola/spots.php?nomPrenoms=${nomPrenomController.text}&numero=${linksController.text}&linkss=https://tabaskimood.com/lac/feishola/spots/${numController.text}${".jpg"}";
    var response = await http.post(Uri.parse(url));
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');

    if (response.body == "OK") {
      setState(() {
        show = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color.fromARGB(255, 18, 133, 22),
          content: Text(
            "Inscription Réussie",
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          )));
      uploadImage();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MesSpots(),
          ),
          (route) => false);
    } else {
      setState(() {
        show = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Erreur : ",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )));
      });
    }
  }

  String dropdownvalue = 'Chambre salon sanitaire';
  final List<String> items = [
    'Chambre salon sanitaire',
    'Chambre salon simple',
    'Boutique',
    'Villa',
    '2 Chambres salons simples',
    'Maison',
    '2 Chambres salons sanitaires',
    'Studio',
    'Mini Studio',
    "Appartement Meublé",
    'Chambre Simple',
    'Chambre Toilette',
    'Chambre Cuisine',
    'Chambre Meublée',
    'Immeuble',
    'Villa',
    'Bureau et commerce',
    'Terrain',
  ];
  String pays = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAB(
          context,
          Text("")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Formulaire de Publication d'un Spot",
              style: TextStyle(fontSize: 16, fontFamily: 'normal'),
            ),
            h(20),
            Text(
              "1- Nom & Prénoms",
              style: TextStyle(fontSize: 14, fontFamily: 'normal'),
            ),
            h(20),
            Container(
              padding: EdgeInsets.only(left: 20, top: 15),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: Container(
                height: 50,
                width: 230,
                child: TextFormField(
                  controller: nomPrenomController,
                  decoration: InputDecoration.collapsed(
                      hintText: "Ex : John Doe",
                      hintStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            h(20),
            Text(
              "2- Numéro de Téléphone",
              style: TextStyle(fontSize: 14, fontFamily: 'normal'),
            ),
            h(10),
            Container(
              padding: EdgeInsets.only(left: 20, top: 15),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: Container(
                height: 50,
                width: 230,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: numController,
                  decoration: InputDecoration.collapsed(
                      hintText: "Ex : John Doe",
                      hintStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            h(20),
            Text(
              "3- Lien vers l'un de vos réseaux",
              style: TextStyle(fontSize: 14, fontFamily: 'normal'),
            ),
            h(20),
            Container(
              padding: EdgeInsets.only(left: 20, top: 15),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: Container(
                height: 50,
                width: 230,
                child: TextFormField(
                  controller: linksController,
                  decoration: InputDecoration.collapsed(
                      hintText: "Ex : John Doe",
                      hintStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            h(20),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: Colors.black38)),
              child: InkWell(
                onTap: () {
                  pickImage();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ajouter une photo claire"),
                    Icon(Icons.photo)
                  ],
                ),
              ),
            ),
            h(20),
            Container(
                //show image here after choosing image
                child: uploadimage == null
                    ? Container()
                    : //if uploadimage is null then show empty container
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              //elese show image here
                              child: SizedBox(
                                  height: 150,
                                  child: Image.file(
                                      uploadimage!) //load image from file
                                  )),
                        ],
                      )),
            h(15),
            show
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        show = true;
                      });
                      inscription();
                    },
                    child: Text("Ajouter le spot"))
          ],
        ),
      ),
    );
  }
}
