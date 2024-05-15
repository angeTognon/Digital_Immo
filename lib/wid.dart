// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:app_feishola/about.dart';
import 'package:app_feishola/bet.dart';
import 'package:app_feishola/admin.dart';
import 'package:app_feishola/code.dart';
import 'package:app_feishola/connexion.dart';
import 'package:app_feishola/details.dart';
import 'package:app_feishola/faq.dart';
import 'package:app_feishola/main.dart';
import 'package:app_feishola/mespub.dart';
import 'package:app_feishola/mon_compte.dart';
import 'package:app_feishola/nous_contacter.dart';
import 'package:app_feishola/politique.dart';
import 'package:app_feishola/publier_logement.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';

bool favorisOn = false;

getUserData(String email) async {
  var url =
      "https://tabaskimood.com/lac/feishola/getUserData.php?email=$user_email";
  var response = await http.get(Uri.parse(url));
  // print(response.statusCode);
  // print(response.body);
  var pub = await json.decode(response.body);
  return pub;
}

flashVente() async {
  var url = "https://tabaskimood.com/lac/feishola/flashvente.php";
  var response = await http.get(Uri.parse(url));
  // print(response.statusCode);
  // print(response.body);
  var pub = await json.decode(response.body);
  return pub;
}

remove(int id) async {
  var url = "https://tabaskimood.com/lac/feishola/favoris/remove.php?id=$id";
  var response = await http.get(Uri.parse(url));
  // print(response.statusCode);
  // print(response.body);
  var pub = await json.decode(response.body);
  return pub;
}

mesPubs() async {
  var url =
      "https://tabaskimood.com/lac/feishola/mesPub.php?mailss=$user_email";
  var response = await http.get(Uri.parse(url));
  // print(response.statusCode);
  // print(response.body);
  var pub = await json.decode(response.body);
  return pub;
}

int divisionResult = 1;
String nbre = "";

Future<int> getMoyenneAvis(id) async {
  var url =
      "https://tabaskimood.com/lac/feishola/nombre_d_avis.php?id_logement=$id";
  var response = await http.get(Uri.parse(url));
  // print(response.body);

  nbre = response.body;
  if (nbre == '"erreur"') {
    return 0;
  } else {
    Map<String, dynamic> jsonMap = json.decode(response.body);
    divisionResult = jsonMap['division_result'];
    // print(divisionResult);

    if (divisionResult != null) {
      return divisionResult;
    } else {
      // Gérer le cas où la valeur est nulle
      throw Exception(
          "La valeur 'division_result' est nulle dans la réponse JSON");
    }
  }
}

getAllUsers() async {
  var url = "https://tabaskimood.com/lac/feishola/getAllUsers.php";
  var response = await http.get(Uri.parse(url));
  // print(response.statusCode);
  // print(response.body);
  var pub = await json.decode(response.body);
  return pub;
}

getSpots() async {
  var url = "https://tabaskimood.com/lac/feishola/getspots.php";
  var response = await http.get(Uri.parse(url));
  // print(response.statusCode);
  // print(response.body);
  var pub = await json.decode(response.body);
  return pub;
}

getfavoris() async {
  var url =
      "https://tabaskimood.com/lac/feishola/favoris/getfavoris.php?ue=$user_email";
  var response = await http.get(Uri.parse(url));
  // print(response.statusCode);
  print(response.body);
  var pub = await json.decode(response.body);
  return pub;
}

getComments(int id) async {
  var url = "https://tabaskimood.com/lac/feishola/getComments.php?id=$id";
  var response = await http.get(Uri.parse(url));
  // print(response.statusCode);
  // print(response.body);
  var pub = await json.decode(response.body);
  return pub;
}

getpub(int id, i) async {
  var url = "https://tabaskimood.com/lac/feishola/getpub.php?id=$id";
  var response = await http.get(Uri.parse(url));
  // print(response.statusCode);
  // print(response.body);
  var pub = await json.decode(response.body);
  return pub;
}

/* payment3(var fraisContact) async {
  var url =
      "https://tabaskimood.com/lac/feishola/payment.php?montant=$fraisContact";
  var response = await http.get(Uri.parse(url));
  // print(response.statusCode);
  // print(response.body);
  var pub = await json.decode(response.body);
  return pub;
} */
// $fraisContact
h(double h) {
  return SizedBox(
    height: h,
  );
}

w(double w) {
  return SizedBox(
    width: w,
  );
}

String passwordEncrypted = "";
String passwordDeEncrypted = "";
String villeSelectionnee = "";
String destinationSelectionnee = "";

Color mainColor = Color.fromARGB(255, 158, 82, 0);
Color mainColor2 = Color.fromARGB(255, 50, 108, 188);
// Color mainColor = Color.fromARGB(255, 148, 84, 0);

Box(String path, Titre, description) {
  return Container(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        h(40),
        Container(height: 259, width: 311, child: Image.asset(path)),
        h(60),
        //Ajout du titre :
        Text(
          Titre,
          style: TextStyle(
            fontFamily: 'normal',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 60),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'normal2', fontSize: 15),
        )
      ],
    ),
  );
}

MAB(BuildContext context, Widget wid) {
  return AppBar(
    elevation: 0,
    backgroundColor: mainColor,
    title: InkWell(
      onLongPress: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminCode(),
            ));
      },
      onTap: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Bet(),
            ),
            (route) => false);
      },
      child: Row(
        children: [
          Text(
            "Feishola",
            style: TextStyle(
                fontSize: 17,
                fontFamily: 'normal',
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          Text(
            "Immo",
            style: TextStyle(
                fontSize: 17,
                fontFamily: 'normal',
                color: Color.fromARGB(255, 79, 152, 255)),
          ),
        ],
      ),
    ),
    actions: [
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => eya ? Publier() : Connexion(),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            color: Color.fromARGB(
                255, 50, 108, 188), // Couleur verte pour le bouton
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            eya ? "Publier" : "Connexion",
            style: TextStyle(
              color: Colors.white, // Texte blanc
              fontFamily: 'normal',
            ),
          ),
        ),
      ),
      /* InkWell(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      height: MediaQuery.of(context).size.height / 1.4,
                      child: wid,
                    );
                  },
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.search,
          size: 30,
          color: Colors.white,
        ),
      ), */
      w(10),
      eya
          ? InkWell(
              onTap: () {
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(500, 60, 0, 0),
                    items: [
                      PopupMenuItem<String>(
                          value: '1',
                          onTap: () {
                            launchUrl(
                                Uri.parse('https://www.feisholadigital.com'));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Visiter notre site',
                                style: TextStyle(
                                    fontFamily: 'normal2', fontSize: 15),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 190, 7, 56))
                            ],
                          )),
                      clientC
                          ? PopupMenuItem<String>(
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  '',
                                  style: TextStyle(
                                      fontFamily: 'normal2', fontSize: 15),
                                ),
                              ],
                            ))
                          : PopupMenuItem<String>(
                              value: '1',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Publier(),
                                  )),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Publier un logement',
                                    style: TextStyle(
                                        fontFamily: 'normal2', fontSize: 15),
                                  ),
                                  Icon(Icons.arrow_forward_ios,
                                      color: Color.fromARGB(255, 190, 7, 56))
                                ],
                              )),
                      /* PopupMenuItem<String>(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'COMPTE ACTIVE',
                              style: TextStyle(
                                  fontFamily: 'normal2', fontSize: 15),
                            ),
                          ],
                        )), */

                      PopupMenuItem<String>(
                          value: '1',
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MesPubs(),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Mes publications',
                                style: TextStyle(
                                    fontFamily: 'normal2', fontSize: 15),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 190, 7, 56))
                            ],
                          )),
                      PopupMenuItem<String>(
                          value: '1',
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MonCompte(),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Mon compte',
                                style: TextStyle(
                                    fontFamily: 'normal2', fontSize: 15),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 190, 7, 56))
                            ],
                          )),

                      PopupMenuItem<String>(
                          value: '1',
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NousContacter(),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Faire de la publicité',
                                style: TextStyle(
                                    fontFamily: 'normal2', fontSize: 15),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 190, 7, 56))
                            ],
                          )),
                      PopupMenuItem<String>(
                          value: '1',
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FAQ(),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'FAQ',
                                style: TextStyle(
                                    fontFamily: 'normal2', fontSize: 15),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 190, 7, 56))
                            ],
                          )),
                      PopupMenuItem<String>(
                          value: '1',
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => About(),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Qui sommes-nous ?',
                                style: TextStyle(
                                    fontFamily: 'normal2', fontSize: 15),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 190, 7, 56))
                            ],
                          )),
                      PopupMenuItem<String>(
                          value: '1',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NousContacter(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Nous contacter',
                                style: TextStyle(
                                    fontFamily: 'normal2', fontSize: 15),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 190, 7, 56))
                            ],
                          )),
                      PopupMenuItem<String>(
                          value: '1',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Politique(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Politique de Confidentialité',
                                style: TextStyle(
                                    fontFamily: 'normal2', fontSize: 15),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 190, 7, 56))
                            ],
                          )),
                      PopupMenuItem<String>(
                          value: '1',
                          onTap: () async {
                            final prefs = await SharedPreferences.getInstance();
                            eya = false;
                            prefs.setBool('isConnected', eya);

                            Phoenix.rebirth(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor:
                                const Color.fromARGB(255, 11, 71, 13),
                                content: Text(
                                  "Déconnexion réussie",
                                  style: TextStyle(
                                      fontFamily: 'normal2',
                                      color: Colors.white),
                                )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Déconnexion',
                                style: TextStyle(
                                    fontFamily: 'normal2', fontSize: 15),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 190, 7, 56))
                            ],
                          )),
                    ]);
              },
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: 25,
              ),
            )
          : InkWell(
              onTap: () {
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(500, 60, 0, 0),
                    items: [
                      PopupMenuItem<String>(
                          value: '1',
                          onTap: () {
                            launchUrl(
                                Uri.parse('https://www.feisholadigital.com'));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Visiter notre site',
                                style: TextStyle(
                                    fontFamily: 'normal2', fontSize: 15),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 190, 7, 56))
                            ],
                          )),
                      PopupMenuItem<String>(
                          value: '1',
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FAQ(),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'FAQ',
                                style: TextStyle(
                                    fontFamily: 'normal2', fontSize: 15),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 190, 7, 56))
                            ],
                          )),
                      PopupMenuItem<String>(
                          value: '1',
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => About(),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Qui sommes-nous ?',
                                style: TextStyle(
                                    fontFamily: 'normal2', fontSize: 15),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 190, 7, 56))
                            ],
                          )),
                      PopupMenuItem<String>(
                          value: '1',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NousContacter(),
                                ));
                            // launchUrl(Uri.parse("https://wa.me/+221761435791"));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Nous Contacter',
                                style: TextStyle(
                                    fontFamily: 'normal2', fontSize: 15),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 190, 7, 56))
                            ],
                          )),
                      PopupMenuItem<String>(
                          value: '1',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Politique(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Politique de Confidentialité',
                                style: TextStyle(
                                    fontFamily: 'normal2', fontSize: 15),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 190, 7, 56))
                            ],
                          ))
                    ]);
              },
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: 25,
              ),
            ),
      w(15),
    ],
  );
}

Box2(BuildContext context, String path, titre, titre2, montant, int id,
    String ville) {
  return Container(
    margin: EdgeInsets.only(left: 18, right: 18, bottom: 40),
    height: 360,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange)),
    child: Column(
      children: [
        Container(
          height: 240,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(path), fit: BoxFit.cover)),
          child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(ville,
                style: TextStyle(
                    fontFamily: 'normal',
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 17)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    child: Text(
                      titre,
                      style: TextStyle(fontFamily: 'normal'),
                    ),
                  ),
                  /*  h(10),
                 
                  ), */
                  h(10),
                  Container(
                    width: 150,
                    child: Text(
                      titre2,
                      style: TextStyle(fontFamily: 'normal2'),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(137, 255, 153, 0),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        montant + " FCFA",
                        style: TextStyle(fontSize: 14, fontFamily: 'normal'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  h(5),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(
                              imgPath: path,
                              type: titre,
                              id: id,
                              ville: ville,
                              fav: false,
                            ),
                          ));
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      height: 30,
                      decoration: BoxDecoration(color: mainColor),
                      child: Center(
                        child: Text(
                          "Consulter",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'normal2'),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
