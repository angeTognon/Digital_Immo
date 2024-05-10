import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_feishola/bet.dart';
import 'package:app_feishola/connexion.dart';
import 'package:country_picker/country_picker.dart';
import 'package:app_feishola/main.dart';
import 'package:app_feishola/wid.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class Publier extends StatefulWidget {
  const Publier({super.key});

  @override
  State<Publier> createState() => _PublierState();
}

class _PublierState extends State<Publier> {
  final publierController = TextEditingController();
  final prixController = TextEditingController();
  final numController = TextEditingController();
  String Pays = "";
  final villeController = TextEditingController();
  final quartierController = TextEditingController();
  final descriptionController = TextEditingController();
  String doucheInterne = "";
  String collocation = "";

  bool doucheInterneOui = false;
  bool doucheInterneNon = false;
  bool collocationOui = false;
  bool collocationNon = false;

  bool show = false;

  String dropdownvalue = 'Cliquez ici';
  final List<String> items = [
    'Cliquez ici',
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

  final phoneController = TextEditingController();

  File? image;
  var uploadimage;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      uploadimage = File(image.path);
      setState(() => this.image = uploadimage);
    } on PlatformException catch (e) {
      //print('Failed to pick image: $e');
    }
  }

  String base64String = "";

  Future<void> uploadImage() async {
    String uploadurl =
        "https://tabaskimood.com/lac/feishola/article_image_upload.php";

    Uint8List _bytes = await uploadimage.readAsBytes();

    String _base64String = base64.encode(_bytes);
    base64String = _base64String;
    //print(base64String);

    var response = await http.post(Uri.parse(uploadurl), body: {
      'image': base64String,
      'mail': "$dropdownvalue" + "$randomNumber"
    });
    if (response.statusCode == 200) {
      // //print(response.body);
      var jsondata = json.decode(response.body);
      if (jsondata["error"]) {
        //print(jsondata["msg"]);
      } else {
        //print("Upload successful");
      }
    } else {
      //print("Error during connection to server");
    }
  }

  /* ****************************************** */
  File? image2;
  var uploadimage2;
  Future pickImage2() async {
    try {
      final image2 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image2 == null) return;
      uploadimage2 = File(image2.path);
      setState(() => this.image2 = uploadimage2);
    } on PlatformException catch (e) {
      //print('Failed to pick image: $e');
    }
  }

  String base64String2 = "";

  Future<void> uploadImage2() async {
    String uploadurl2 = "https://tabaskimood.com/lac/feishola/up.php";

    Uint8List _bytes2 = await uploadimage2.readAsBytes();

    String _base64String2 = base64.encode(_bytes2);
    base64String2 = _base64String2;
    //print(base64String2);

    var response = await http.post(Uri.parse(uploadurl2), body: {
      'image': base64String2,
      'mail': "$dropdownvalue" + "$randomNumber" + "2"
    });
    if (response.statusCode == 200) {
      // //print(response.body);
      var jsondata = json.decode(response.body);
      if (jsondata["error"]) {
        //print(jsondata["msg"]);
      } else {
        //print("Upload successful");
      }
    } else {
      //print("Error during connection to server");
    }
  }
  /* ****************************************** */

  /* ****************************************** */
  File? image3;
  var uploadimage3;
  Future pickImage3() async {
    try {
      final image3 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image3 == null) return;
      uploadimage3 = File(image3.path);
      setState(() => this.image3 = uploadimage3);
    } on PlatformException catch (e) {
      //print('Failed to pick image: $e');
    }
  }

  String base64String3 = "";

  Future<void> uploadImage3() async {
    String uploadurl3 = "https://tabaskimood.com/lac/feishola/upp.php";
    Uint8List _bytes3 = await uploadimage3.readAsBytes();
    String _base64String3 = base64.encode(_bytes3);
    base64String3 = _base64String3;
    //print(base64String3);

    var response = await http.post(Uri.parse(uploadurl3), body: {
      'image': base64String3,
      'mail': "$dropdownvalue" + "$randomNumber" + "3"
    });
    if (response.statusCode == 200) {
      // //print(response.body);
      var jsondata = json.decode(response.body);
      if (jsondata["error"]) {
        //print(jsondata["msg"]);
      } else {
        //print("Upload successful");
      }
    } else {
      //print("Error during connection to server");
    }
  }

  /* ****************************************** */
  /* ****************************************** */
  File? image4;
  var uploadimage4;
  Future pickImage4() async {
    try {
      final image4 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image4 == null) return;
      uploadimage4 = File(image4.path);
      setState(() => this.image4 = uploadimage3);
    } on PlatformException catch (e) {
      //print('Failed to pick image: $e');
    }
  }

  String base64String4 = "";

  Future<void> uploadImage4() async {
    String uploadurl4 = "https://tabaskimood.com/lac/feishola/upp.php";
    Uint8List _bytes4 = await uploadimage4.readAsBytes();
    String _base64String4 = base64.encode(_bytes4);
    base64String4 = _base64String4;
    //print(base64String4);

    var response = await http.post(Uri.parse(uploadurl4), body: {
      'image': base64String4,
      'mail': "$dropdownvalue" + "$randomNumber" + "4"
    });
    if (response.statusCode == 200) {
      // //print(response.body);
      var jsondata = json.decode(response.body);
      if (jsondata["error"]) {
        //print(jsondata["msg"]);
      } else {
        //print("Upload successful");
      }
    } else {
      //print("Error during connection to server");
    }
  }

  /* ****************************************** */

  /* ****************************************** */
  File? image5;
  var uploadimage5;
  Future pickImage5() async {
    try {
      final image5 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image5 == null) return;
      uploadimage5 = File(image5.path);
      setState(() => this.image5 = uploadimage3);
    } on PlatformException catch (e) {
      //print('Failed to pick image: $e');
    }
  }

  String base64String5 = "";

  Future<void> uploadImage5() async {
    String uploadurl5 = "https://tabaskimood.com/lac/feishola/upp.php";
    Uint8List _bytes5 = await uploadimage5.readAsBytes();
    String _base64String5 = base64.encode(_bytes5);
    base64String5 = _base64String5;
    //print(base64String5);

    var response = await http.post(Uri.parse(uploadurl5), body: {
      'image': base64String5,
      'mail': "$dropdownvalue" + "$randomNumber" + "5"
    });
    if (response.statusCode == 200) {
      // //print(response.body);
      var jsondata = json.decode(response.body);
      if (jsondata["error"]) {
        //print(jsondata["msg"]);
      } else {
        //print("Upload successful");
      }
    } else {
      //print("Error during connection to server");
    }
  }

  /* ****************************************** */

  /* ****************************************** */
  File? image6;
  var uploadimage6;
  Future pickImage6() async {
    try {
      final image6 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image6 == null) return;
      uploadimage6 = File(image6.path);
      setState(() => this.image6 = uploadimage3);
    } on PlatformException catch (e) {
      //print('Failed to pick image: $e');
    }
  }

  String base64String6 = "";

  Future<void> uploadImage6() async {
    String uploadurl6 = "https://tabaskimood.com/lac/feishola/upp.php";
    Uint8List _bytes6 = await uploadimage6.readAsBytes();
    String _base64String6 = base64.encode(_bytes6);
    base64String6 = _base64String6;
    //print(base64String6);

    var response = await http.post(Uri.parse(uploadurl6), body: {
      'image': base64String6,
      'mail': "$dropdownvalue" + "$randomNumber" + "6"
    });
    if (response.statusCode == 200) {
      // //print(response.body);
      var jsondata = json.decode(response.body);
      if (jsondata["error"]) {
        //print(jsondata["msg"]);
      } else {
        //print("Upload successful");
      }
    } else {
      //print("Error during connection to server");
    }
  }

  /* ****************************************** */

  /* ****************************************** */
  File? image7;
  var uploadimage7;
  Future pickImage7() async {
    try {
      final image7 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image7 == null) return;
      uploadimage7 = File(image7.path);
      setState(() => this.image7 = uploadimage3);
    } on PlatformException catch (e) {
      //print('Failed to pick image: $e');
    }
  }

  String base64String7 = "";

  Future<void> uploadImage7() async {
    String uploadurl7 = "https://tabaskimood.com/lac/feishola/upp.php";
    Uint8List _bytes7 = await uploadimage7.readAsBytes();
    String _base64String7 = base64.encode(_bytes7);
    base64String7 = _base64String7;
    //print(base64String7);

    var response = await http.post(Uri.parse(uploadurl7), body: {
      'image': base64String7,
      'mail': "$dropdownvalue" + "$randomNumber" + "7"
    });
    if (response.statusCode == 200) {
      // //print(response.body);
      var jsondata = json.decode(response.body);
      if (jsondata["error"]) {
        //print(jsondata["msg"]);
      } else {
        //print("Upload successful");
      }
    } else {
      //print("Error during connection to server");
    }
  }

  /* ****************************************** */

  String photoLink = "https://tabaskimood.com/lac/feishola/article/";
  String? temps;

  publier() async {
    setState(() {
      show = true;
    });
    var url =
        "https://tabaskimood.com/lac/feishola/publier.php?titre=$dropdownvalue&prix=${prixController.text}&pays=$Pays&ville=${villeController.text}&quartier=${quartierController.text}&disponible=Oui&descriptionn=${descriptionController.text}&doucheInterne=$doucheInterne&collocationDispo=$collocation&mailss=$user_email&linkss=$photoLink$dropdownvalue$randomNumber${".jpg"}&temps=$temps&phone=${phoneController.text}";
    var response = await http.post(Uri.parse(url));
    //print('Response status: ****** ${response.statusCode}');
    //print('Response body:****** ${response.body}');

    if (response.body == "OK") {
      setState(() {
        show = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color.fromARGB(255, 18, 133, 22),
          content: Text(
            "Publication Réussie",
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          )));
      uploadImage();
      uploadImage2();
      uploadImage3();
      uploadImage4();
      uploadImage5();
      uploadImage6();
      uploadImage7();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Bet(),
          ),
          (route) => false);
    } else {
      setState(() {
        //print(response.body);
        show = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Erreur : Réessayez svp",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )));
      });
    }
  }

  Random random = new Random();
  int? randomNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAB(
          context,
          Text("")),
      body: Container(
        margin: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: getUserData(user_email),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Erreur de chargement. Veuillez relancer l'application"),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return /* snapshot.data![index]['etat'] == "Non Active"
                                    ?  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      h(50),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Votre compte n'est pas activé",style: TextStyle(
                            fontFamily: 'normal',fontSize: 17
                          ),),
                        ],
                      ),
                      h(30),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(width: 300,
                            child: Text("Veuillez l'activer dans l'espace mon compte au niveau du menu",style: TextStyle(
                              fontFamily: 'normal2',fontSize: 17
                            ),textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                    ],
                  ) */
                      Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/publier.png"),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                      h(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Publier un logement",
                            style:
                                TextStyle(fontSize: 16, fontFamily: 'normal'),
                          )
                        ],
                      ),
                      h(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.orange,
                            height: 4,
                            width: 70,
                          ),
                        ],
                      ),
                      h(20),
                      Text(
                        "1- Que voulez-vous publier ?",
                        style: TextStyle(fontSize: 14, fontFamily: 'normal'),
                      ),
                      h(10),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 13),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 255, 255, 255)),
                        child: DropdownButton(
                          value: dropdownvalue,
                          isDense: true,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                      /*  */
                      h(20),
                      Text(
                        "2- Prix du logement",
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
                            controller: prixController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration.collapsed(
                                hintText: "Ex : 50000",
                                hintStyle: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      /*  */
                      h(10),
                      Text(
                        "3- Pays Actuelle (ne pas utiliser les accents)",
                        style: TextStyle(fontSize: 14, fontFamily: 'normal'),
                      ),
                      h(15),
                      Text(
                        "Exemple : Senegal ou Benin",
                        style: TextStyle(fontSize: 14, fontFamily: 'normal2'),
                      ),
                      h(10),
                      InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            onSelect: (Country country) {
                              setState(() {
                                Pays = "${country.name}";
                              });
                              //print('Select country: ${country.displayName}');
                            },
                          );
                        },
                        child: Container(
                            padding: EdgeInsets.only(left: 20, top: 15),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black38),
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 255, 255, 255)),
                            child: Text(
                              Pays == "" ? "Cliquez ici pour choisir" : Pays,
                              style: TextStyle(fontFamily: 'normal'),
                            )),
                      ),
                      h(10),
                      /*  */
                      Text(
                        "4- Ville",
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
                            controller: villeController,
                            decoration: InputDecoration.collapsed(
                                hintText: "Ex : Cotonou",
                                hintStyle: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      h(10),
                      /*  */
                      Text(
                        "5- Quartier",
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
                            controller: quartierController,
                            decoration: InputDecoration.collapsed(
                                hintText: "Ex : Grand Yoff",
                                hintStyle: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      h(10),
                      /*  */
                      Text(
                        "6- Votre numéro de téléphone",
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
                            controller: phoneController,
                            decoration: InputDecoration.collapsed(
                                hintText: "Ex : Grand Yoff",
                                hintStyle: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      h(10),
                      Text(
                        "7- Petite Description de la location",
                        style: TextStyle(fontSize: 14, fontFamily: 'normal'),
                      ),
                      h(10),
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 0),
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 255, 255, 255)),
                        child: Container(
                          height: 150,
                          width: 200,
                          margin: EdgeInsets.only(top: 16, left: 5),
                          child: TextFormField(
                            maxLines: 100,
                            controller: descriptionController,
                            decoration: InputDecoration.collapsed(
                                hintText:
                                    "Décrivez par exemple l'emplacement\ndu logement, ses caractéristiques clées...",
                                hintStyle: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      h(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.orange,
                            height: 4,
                            width: 70,
                          ),
                        ],
                      ),
                      h(10),
                      Text(
                        "8-Type de compteur ",
                        style: TextStyle(fontSize: 14, fontFamily: 'normal'),
                      ),
                      h(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                doucheInterneOui = true;
                                doucheInterneNon = false;
                                doucheInterne = "Personnel";
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  doucheInterneOui
                                      ? Icons.circle
                                      : Icons.circle_outlined,
                                  color: doucheInterneOui
                                      ? Colors.orange
                                      : Colors.black,
                                ),
                                w(20),
                                Text(
                                  "Personnel",
                                  style: TextStyle(fontFamily: 'normal2'),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                doucheInterneNon = true;
                                doucheInterneOui = false;
                                doucheInterne = "Commun";
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  doucheInterneNon
                                      ? Icons.circle
                                      : Icons.circle_outlined,
                                  color: doucheInterneNon
                                      ? Colors.orange
                                      : Colors.black,
                                ),
                                w(20),
                                Text(
                                  "Commun",
                                  style: TextStyle(fontFamily: 'normal2'),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

                      /*  */

                      h(10),
                      Text(
                        "9- Peut on faire une collocation dans votre logement ?",
                        style: TextStyle(fontSize: 14, fontFamily: 'normal'),
                      ),
                      h(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                collocationOui = true;
                                collocationNon = false;
                                collocation = "Oui";
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  collocationOui
                                      ? Icons.circle
                                      : Icons.circle_outlined,
                                  color: collocationOui
                                      ? Colors.orange
                                      : Colors.black,
                                ),
                                w(20),
                                Text(
                                  "Oui",
                                  style: TextStyle(fontFamily: 'normal2'),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                collocationNon = true;
                                collocationOui = false;
                                collocation = "Non";
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  collocationNon
                                      ? Icons.circle
                                      : Icons.circle_outlined,
                                  color: collocationNon
                                      ? Colors.orange
                                      : Colors.black,
                                ),
                                w(20),
                                Text(
                                  "Non",
                                  style: TextStyle(fontFamily: 'normal2'),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      h(10),
                      Text(
                        "10- Importez une photo du logement\n(PHOTO n°1)",
                        style: TextStyle(fontSize: 14, fontFamily: 'normal'),
                      ),
                      h(15),
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
                              Text("Cliquez ici pour importer"),
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
                      h(10),
                      Text(
                        "11- PHOTO n°2",
                        style: TextStyle(fontSize: 14, fontFamily: 'normal'),
                      ),
                      h(15),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(color: Colors.black38)),
                        child: InkWell(
                          onTap: () {
                            pickImage2();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Cliquez ici pour importer"),
                              Icon(Icons.photo)
                            ],
                          ),
                        ),
                      ),
                      h(20),
                      Container(
                          //show image here after choosing image
                          child: uploadimage2 == null
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
                                                uploadimage2!) //load image from file
                                            )),
                                  ],
                                )),
                      h(10),
/* ******************************************** */
                      h(10),
                      Text(
                        "12- PHOTO n°3",
                        style: TextStyle(fontSize: 14, fontFamily: 'normal'),
                      ),
                      h(15),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(color: Colors.black38)),
                        child: InkWell(
                          onTap: () {
                            pickImage3();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Cliquez ici pour importer"),
                              Icon(Icons.photo)
                            ],
                          ),
                        ),
                      ),
                      h(20),
                      Container(
                          //show image here after choosing image
                          child: uploadimage3 == null
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
                                                uploadimage3!) //load image from file
                                            )),
                                  ],
                                )),
                      h(10),

                      /* ******************************************** */
                      h(10),
                      Text(
                        "13- PHOTO n°4",
                        style: TextStyle(fontSize: 14, fontFamily: 'normal'),
                      ),
                      h(15),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(color: Colors.black38)),
                        child: InkWell(
                          onTap: () {
                            pickImage4();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Cliquez ici pour importer"),
                              Icon(Icons.photo)
                            ],
                          ),
                        ),
                      ),
                      h(20),
                      Container(
                          //show image here after choosing image
                          child: uploadimage4 == null
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
                                                uploadimage4!) //load image from file
                                            )),
                                  ],
                                )),
                      h(10),

                      /* ******************************************** */
                      h(10),
                      Text(
                        "14- PHOTO n°5",
                        style: TextStyle(fontSize: 14, fontFamily: 'normal'),
                      ),
                      h(15),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(color: Colors.black38)),
                        child: InkWell(
                          onTap: () {
                            pickImage5();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Cliquez ici pour importer"),
                              Icon(Icons.photo)
                            ],
                          ),
                        ),
                      ),
                      h(20),
                      Container(
                          //show image here after choosing image
                          child: uploadimage5 == null
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
                                                uploadimage5!) //load image from file
                                            )),
                                  ],
                                )),
                      h(10),
                      /* ******************************************** */
                      h(10),
                      Text(
                        "15- PHOTO n°6",
                        style: TextStyle(fontSize: 14, fontFamily: 'normal'),
                      ),
                      h(15),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(color: Colors.black38)),
                        child: InkWell(
                          onTap: () {
                            pickImage6();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Cliquez ici pour importer"),
                              Icon(Icons.photo)
                            ],
                          ),
                        ),
                      ),
                      h(20),
                      Container(
                          //show image here after choosing image
                          child: uploadimage6 == null
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
                                                uploadimage6!) //load image from file
                                            )),
                                  ],
                                )),
                      h(10),
                      /* ******************************************** */
                      h(10),
                      Text(
                        "16- PHOTO n°7",
                        style: TextStyle(fontSize: 14, fontFamily: 'normal'),
                      ),
                      h(15),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(color: Colors.black38)),
                        child: InkWell(
                          onTap: () {
                            pickImage7();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Cliquez ici pour importer"),
                              Icon(Icons.photo)
                            ],
                          ),
                        ),
                      ),
                      h(20),
                      Container(
                          //show image here after choosing image
                          child: uploadimage7 == null
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
                                                uploadimage7!) //load image from file
                                            )),
                                  ],
                                )),
                      h(10),
                      h(20),
                      show
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                              ],
                            )
                          : InkWell(
                              onTap: () {
                                //print(descriptionController.text);
                                // uploadImage();
                                if (dropdownvalue == "" ||
                                    prixController.text == "" ||
                                    // dropdownvalueVille == "" ||
                                    quartierController.text == "" ||
                                    descriptionController.text == "" ||
                                    villeController.text == "" ||
                                    Pays == "" ||
                                    phoneController.text == "" ||
                                    doucheInterne == "" ||
                                    collocation == "" ||
                                    uploadimage == null ||
                                    uploadimage2 == null ||
                                    uploadimage3 == null ||
                                    uploadimage4 == null ||
                                    uploadimage5 == null ||
                                    uploadimage6 == null ||
                                    uploadimage7 == null) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "Veuillez remplir tous les champs !",
                                      style: TextStyle(
                                          fontFamily: 'normal',
                                          color: Colors.white),
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(255, 147, 36, 28),
                                  ));
                                } else {
                                  setState(() {
                                    randomNumber = random.nextInt(100000);
                                    //print("Generated Random Number Between 0 to 9: $randomNumber");
                                    temps = DateFormat('d/M/y')
                                        .format(DateTime.now());
                                  });
                                  publier();
                                }
                              },
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                  child: Text(
                                    "Publier",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'normal2',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  );
                },
              );
            }
            return Container(
                height: 50,
                width: 50,
                child: Center(
                    child: Lottie.asset("assets/images/auto_loading.json",
                        height: 150)));
          },
        ),
      ),
      /* body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: ,
        ) */
    );
  }
}
