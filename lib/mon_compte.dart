import 'dart:convert';
import 'dart:io';
import 'package:country_picker/country_picker.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:app_feishola/main.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:app_feishola/wid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class MonCompte extends StatefulWidget {
  const MonCompte({super.key});

  @override
  State<MonCompte> createState() => _MonCompteState();
}

class _MonCompteState extends State<MonCompte> {
  check(String id) async {
    final prefss = await SharedPreferences.getInstance();
    if (id == "Je veux publier des logements") {
      clientC = false;
      prefss.setBool('isClient', clientC);
    } else {
      clientC = true;
      prefss.setBool('isClient', clientC);
      //print(clientC);
    }
  }

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
    String uploadurl = "https://tabaskimood.com/lac/feishola/up8.php";

    Uint8List _bytes = await uploadimage.readAsBytes();

    String _base64String = base64.encode(_bytes);
    base64String = _base64String;
    //print(base64String);

    var response = await http.post(Uri.parse(uploadurl),
        body: {'image': base64String, 'mail': "$user_email"});
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

  /* @override
  void dispose() {
    // TODO: implement dispose
    darkNotifier.dispose();
    super.dispose();
  } */
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
      /*  floatingActionButton: FloatingActionButton(
        onPressed: () {
          isDark = !isDark;
          darkNotifier.value = isDark;
        },
        tooltip: 'Increment',
        child: Icon(isDark ? Icons.wb_sunny_outlined : Icons.bubble_chart),
      ), */
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
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 120,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  left: 20,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: uploadimage == null
                                            ? Colors.white
                                            : Colors.white),
                                    child: Center(
                                      child: uploadimage == null
                                          ? Container(
                                              height: 80,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  border: Border.all(
                                                      color: mainColor,
                                                      width: 3)
                                                  // image: DecorationImage(image: NetworkImage("https://tabaskimood.com/lac/feishola/profile/$user_email.jpg"),fit: BoxFit.cover)
                                                  ),
                                              child: Icon(Icons.person,
                                                  size: 40, color: mainColor),
                                            )
                                          : Container(
                                              height: 80,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  image: DecorationImage(
                                                      image: FileImage(
                                                          uploadimage!),
                                                      fit: BoxFit.cover)),
                                            ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 20,
                                  child: InkWell(
                                    onTap: () {
                                      pickImage();
                                      Future.delayed(
                                        Duration(seconds: 10),
                                        () {
                                          uploadImage();
                                        },
                                      );
                                    },
                                    child: CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(144, 0, 0, 0),
                                        radius: 22,
                                        child: Center(
                                            child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 30,
                                        ))),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      h(10),
                      Text(
                        "${snapshot.data![index]['nomPrenoms']}",
                        style: TextStyle(
                            fontFamily: 'normal',
                            fontSize: 18,
                            color: Colors.black87),
                      ),
                      h(5),
                      Text(
                        snapshot.data![index]['email'],
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'normal',
                            color: mainColor),
                      ),
                      h(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Informations suplémentaires",
                            style:
                                TextStyle(fontFamily: 'normal', fontSize: 15),
                          )
                        ],
                      ),
                      h(15),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                      ),
                      h(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.phone,
                                  color: Color.fromARGB(150, 0, 0, 0),
                                  size: 30),
                              w(20),
                              Text(
                                "Numéro de téléphone : ",
                                style: TextStyle(
                                    fontFamily: 'normal',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color.fromARGB(150, 0, 0, 0)),
                              ),
                            ],
                          ),
                          Text(
                            snapshot.data![index]['num'],
                            style: TextStyle(
                                fontFamily: 'normal',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: mainColor),
                          ),
                        ],
                      ),
                      h(15),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                      ),
                      h(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.place,
                                  color: Color.fromARGB(150, 0, 0, 0),
                                  size: 30),
                              w(20),
                              Text(
                                "Pays : ",
                                style: TextStyle(
                                    fontFamily: 'normal',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color.fromARGB(150, 0, 0, 0)),
                              ),
                            ],
                          ),
                          Text(
                            snapshot.data![index]['pays'],
                            style: TextStyle(
                                fontFamily: 'normal',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: mainColor),
                          ),
                        ],
                      ),
                      h(15),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                      ),
                      /*  h(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Paramètre",
                            style:
                                TextStyle(fontFamily: 'normal', fontSize: 15),
                          )
                        ],
                      ),
                      h(15),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                      ), */
                      /* CupertinoSwitch(
                        
                        value: isDark,
                        onChanged: (bool val) {
                           isDark = !isDark;
          darkNotifier.value = isDark;
                        },
                  ), */
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
    );
  }
}
