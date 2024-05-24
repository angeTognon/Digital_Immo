// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:app_feishola/about.dart';
import 'package:app_feishola/bet.dart';
import 'package:app_feishola/code.dart';
import 'package:app_feishola/connexion.dart';
import 'package:app_feishola/faq.dart';
import 'package:app_feishola/mespub.dart';
import 'package:app_feishola/mon_compte.dart';
import 'package:app_feishola/nous_contacter.dart';
import 'package:app_feishola/politique.dart';
import 'package:app_feishola/publier_logement.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:app_feishola/details.dart';
import 'package:app_feishola/googleMaps/search_with_map.dart';
import 'package:app_feishola/main.dart';
import 'package:app_feishola/resultat_from_nav.dart';
import 'package:app_feishola/wid.dart';
import 'package:flutter/material.dart';
import 'package:app_feishola/resultat.dart';
import 'package:app_feishola/chat.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final List<String> searchElements = [
    'Entré couché simple',
    'Entré couché sanitaire',
    'Chambre salon simple',
    'Chambre salon sanitaire',
    '2 Chambres salons simples',
    '2 Chambres salons sanitaires',
    '3 Chambres salons simple',
    '3 Chambres salons sanitaires',
   'Boutique',
    'Bureau',
    "Appartement Meublé",
    'Maison',
    'Villa',
    'Immeuble',
    'Parcelle',
  ];

  String selectedElement = '';
  int place = 0;
  int i = 0;

  var items = <Widget>[
    Icon(Icons.home, size: 35, color: Colors.white),
    Icon(Icons.account_box, size: 35, color: Colors.white),
    Icon(Icons.upload_rounded, size: 35, color: Colors.white),
  ];
  int indexx = 1;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late int position;
  final key = UniqueKey();
  doneLoading(String A) {
    setState(() {
      position = 1;
    });
  }

  startLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  bool hide = false;
  late TabController tabController;

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => setState(() {}));
    position = 1;
    Future.delayed(
      Duration(seconds: 15),
      () {
        setState(() {
          hide = true;
        });
      },
    );
    // TODO: implement initState
    super.initState();
  }

  addFav(int id_logement) async {
    setState(() {
      favorisOn = !favorisOn;
      print(favorisOn);
    });
    var url =
        "https://tabaskimood.com/lac/feishola/favoris/add_favoris.php?id_logement=$id_logement&ue=$user_email";
    var response = await http.post(Uri.parse(url));
    //print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.body == "OK") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color.fromARGB(255, 18, 133, 22),
          content: Text(
            "OK",
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          )));
    } else {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Erreur ",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )));
      });
    }
  }

  int? nbrs = 5;
  List<bool> favorisList = List.generate(20, (index) => false);
  String dropdownvalue = 'Chambre salon sanitaire';

  bool doucheInterneOui = false;
  bool doucheInterneNon = false;

  String pays = "";
  String doucheInterne = "";
  String collocation = "";

  final villeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      /* floatingActionButton: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chat(),
                    )),
                child: Container(
                    height: 70,
                    width: 70,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(200)),
                    child: SvgPicture.asset("assets/images/robot.svg")),
              ),
            ),
            hide
                ? Text("")
                : Positioned(
                    right: 30,
                    top: 10,
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chat(),
                          )),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 60,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: mainColor),
                        child: Text(
                          "Vous avez des questions ou préoccupations ? Cliquez ici pour les poser !",
                          style: TextStyle(
                              fontFamily: 'normal2', color: Colors.white),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
      */
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      InkWell(
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
                      child: StatefulBuilder(
            builder: (context, setState) => DefaultTabController(
              length: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                       onTap: (value) {
                        if (value == 1) {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchWithMap(),
                              ));
                        }
                      },
                      tabs: [
                        Tab(
                          text: "Formulaire de recherche",
                          icon: Icon(
                            Icons.search,
                          ),
                        ),
                        Tab(
                          text: "Recherche Google Maps",
                          icon: Icon(Icons.place),
                        ),
                      ]),
                  Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: TabBarView(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          h(20),
                          Text(
                            "1. Type de Propriété",
                            style: TextStyle(
                                fontFamily: 'normal',
                                fontSize: 14,
                                color: Colors.black),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: DropdownButton(
                              menuMaxHeight: 400,
                              underline: Text(""),
                              isExpanded: true,
                              value: dropdownvalue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items:
                                  searchElements.map((String searchElements) {
                                return DropdownMenuItem(
                                  value: searchElements,
                                  child: Text(
                                    searchElements,
                                    style: TextStyle(
                                        fontSize: 13, fontFamily: 'normal2'),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "2. Pays : ",
                                style: TextStyle(
                                    fontFamily: 'normal',
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                              // h(15),
                              InkWell(
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    onSelect: (Country country) {
                                      setState(() {
                                        pays = country.name;
                                      });
                                      //print('Select country: ${country.displayName}');
                                    },
                                  );
                                },
                                child: Container(
                                    margin:
                                        EdgeInsets.only(left: 30, right: 30),
                                    padding: EdgeInsets.only(left: 10, top: 10),
                                    width: 200,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black38),
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    child: Text(
                                      pays == ""
                                          ? "Cliquez ici pour choisir"
                                          : pays,
                                      style: TextStyle(
                                          fontFamily: 'normal', fontSize: 13),
                                    )),
                              ),
                            ],
                          ),
                          h(15),
                          Row(
                            children: [
                              Text(
                                "3. Ville",
                                style: TextStyle(
                                    fontFamily: 'normal',
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                              w(75),
                              Container(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                child: Container(
                                  height: 40,
                                  width: 230,
                                  child: TextFormField(
                                    controller: villeController,
                                    decoration: InputDecoration.collapsed(
                                        hintText: "Nom de la ville",
                                        hintStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          h(12),
                          Text(
                            "4. Type de compteur ",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'normal',
                              color: Colors.black,
                            ),
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
                          h(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: mainColor,
                                      padding: EdgeInsets.all(15)),
                                  onPressed: () {
                                    if (doucheInterne == "" ||
                                        villeController.text == "" ||
                                        pays == "" ||
                                        dropdownvalue == "") {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 122, 26, 19),
                                              content: Text(
                                                  "Veuillez remplir tous les champs")));
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ResultatFromNav(
                                                    titre: dropdownvalue,
                                                    pays: pays,
                                                    ville: villeController.text,
                                                    type: doucheInterne),
                                          ));
                                    }
                                  },
                                  child: Text(
                                    "Lancer la Recherche",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
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
      ),
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
            ),
      w(15),
    ],
  ),
      body: WillPopScope(
        onWillPop: () async {
          final value = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              content: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    "Êtes vous sûr de vouloir quitter l'application ?",
                    style: TextStyle(fontSize: 15, fontFamily: 'normal'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              actions: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text("Non")),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: mainColor2),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text("Oui")),
              ],
            ),
          );
          if (value != null) {
            return Future.value(value);
          } else {
            return Future.value(false);
          }
        },
        child: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(
              Duration(seconds: 3),
              () {
                WidgetsBinding.instance
                    .addPostFrameCallback((timeStamp) => setState(() {}));
              },
            );
          },
          child: DefaultTabController(
            length: 2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // color: mainColor,
                    height: 265,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 0,
                            child: Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/chambre2.jpg"),
                                      fit: BoxFit.cover,
                                      opacity: 1)),
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 70, right: 20, left: 20),
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                color: Color.fromARGB(177, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Trouvez le ",
                                      style: TextStyle(
                                          fontSize: 27,
                                          fontFamily: 'normal',
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                    Text(
                                      "Logement Parfait",
                                      style: TextStyle(
                                          fontSize: 27,
                                          fontFamily: 'normal',
                                          color: const Color.fromARGB(
                                              255, 255, 135, 7)),
                                    ),
                                    h(15),
                                    Text(
                                      "Depuis votre smartphone, et à moindre coût !",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'normal2',
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: 5,
                    width: 120,
                    color: mainColor2,
                  ),
                  /* Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Recherche par Carte",
                          style: TextStyle(fontFamily: "normal"),
                        ),
                      ],
                    ),
                  ), */
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Recherche par catégorie",
                          style: TextStyle(fontFamily: "normal"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Box1("assets/images/cssi.jpg", "Entré couché simple"),
                        Box1("assets/images/cssi.jpg", "Entré couché sanitaire"),
                        Box1("assets/images/cssa.jpg", "Chambre salon simple"),
                        Box1("assets/images/cssa.jpg", "Chambre salon sanitaire"),
                        Box1("assets/images/studio.png","2 Chambres salons sanitaires"),
                        Box1("assets/images/studio.png","3 Chambres salons sanitaires"),
                        Box1("assets/images/maison.png", "Boutique"),
                        Box1("assets/images/x1.png", "Bureau"),
                        Box1("assets/images/appart.png", "Appartement Meublé"),
                        Box1("assets/images/villa.png", "Villa"),
                        Box1("assets/images/terrain.png", "Parcelle"),
                        w(20),
                      ],
                    ),
                  ),
                  h(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Publications Récentes",
                        style: TextStyle(fontFamily: "normal", fontSize: 15),
                      ),
                    ],
                  ),
                  h(20),
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder(
                      future: flashVente(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                                "Erreur de chargement. Veuillez relancer l'application"),
                          );
                        }
                        if (snapshot.hasData) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            // shrinkWrap: true,
                            //reverse : true,
                            itemBuilder: (context, index) {
                              indexx = index;
                              return Container(
                                // padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(left: 15, right: 15),
                                height: 300, //200
                                width: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    // color: Colors.black,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          snapshot.data![index]['linkss'],
                                        ),
                                        fit: BoxFit.cover)),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 300, //200
                                      width: 250,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color.fromARGB(90, 0, 0, 0),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      top: 20,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [

                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                favorisList[index] =
                                                    !favorisList[index];

                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  color: mainColor2),
                                              child: Center(
                                                  child: Icon(
                                                favorisList[index]
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                size: 30,
                                                color: favorisList[index]
                                                    ? const Color.fromARGB(
                                                        255, 158, 33, 24)
                                                    : const Color.fromARGB(
                                                        255, 255, 255, 255),
                                              )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 20,
                                      top: 20,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: mainColor2),
                                            child: Center(
                                              child: Text(
                                                snapshot.data![index]['ville'],
                                                style: TextStyle(
                                                    fontFamily: 'normal',
                                                    color: Color.fromARGB(
                                                        226, 255, 255, 255)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    h(12),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        height: 70,
                                        width: 250,
                                        decoration: BoxDecoration(
                                            color: mainColor2.withOpacity(0.8),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20))),
                                      ),
                                    ),
                                    Positioned(
                                      top: 90,
                                      left: 20,
                                      child: Container(
                                        height: 50,
                                        width: 200,
                                        child: Text(
                                          snapshot.data![index]['titre'],
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'normal',
                                              color: Colors.white),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      left: 20,
                                      child: Container(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: FutureBuilder(
                                          future: getMoyenneAvis(int.parse(
                                              snapshot.data![index]['id'])),
                                          builder: (BuildContext context,
                                              AsyncSnapshot snapshot) {
                                            if (snapshot.hasError) {
                                              return Center(
                                                child: Text("chargement ..."),
                                              );
                                            }
                                            if (snapshot.hasData) {
                                              return ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: 1,
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  return nbre == '"erreur"'
                                                      ? Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .star_border_outlined,
                                                              color: Color
                                                                  .fromARGB(
                                                                      252,
                                                                      0,
                                                                      255,
                                                                      42),
                                                              size: 20,
                                                            ),
                                                            Icon(
                                                                Icons
                                                                    .star_border_outlined,
                                                                color: Color
                                                                    .fromARGB(
                                                                        252,
                                                                        0,
                                                                        255,
                                                                        42),
                                                                size: 20),
                                                            Icon(
                                                                Icons
                                                                    .star_border_outlined,
                                                                color: Color
                                                                    .fromARGB(
                                                                        252,
                                                                        0,
                                                                        255,
                                                                        42),
                                                                size: 20),
                                                            Icon(
                                                                Icons
                                                                    .star_border_outlined,
                                                                color: Color
                                                                    .fromARGB(
                                                                        252,
                                                                        0,
                                                                        255,
                                                                        42),
                                                                size: 20),
                                                            Icon(
                                                                Icons
                                                                    .star_border_outlined,
                                                                color: Color
                                                                    .fromARGB(
                                                                        252,
                                                                        0,
                                                                        255,
                                                                        42),
                                                                size: 20),
                                                          ],
                                                        )
                                                      : divisionResult == 1
                                                          ? Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          252,
                                                                          0,
                                                                          255,
                                                                          42),
                                                                  size: 20,
                                                                ),
                                                                Icon(
                                                                    Icons
                                                                        .star_border_outlined,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            252,
                                                                            0,
                                                                            255,
                                                                            42),
                                                                    size: 20),
                                                                Icon(
                                                                    Icons
                                                                        .star_border_outlined,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            252,
                                                                            0,
                                                                            255,
                                                                            42),
                                                                    size: 20),
                                                                Icon(
                                                                    Icons
                                                                        .star_border_outlined,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            252,
                                                                            0,
                                                                            255,
                                                                            42),
                                                                    size: 20),
                                                                Icon(
                                                                    Icons
                                                                        .star_border_outlined,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            252,
                                                                            0,
                                                                            255,
                                                                            42),
                                                                    size: 20),
                                                              ],
                                                            )
                                                          : divisionResult == 2
                                                              ? Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .star,
                                                                      color: Color.fromARGB(
                                                                          252,
                                                                          0,
                                                                          255,
                                                                          42),
                                                                      size: 20,
                                                                    ),
                                                                    Icon(
                                                                        Icons
                                                                            .star,
                                                                        color: Color.fromARGB(
                                                                            252,
                                                                            0,
                                                                            255,
                                                                            42),
                                                                        size:
                                                                            20),
                                                                    Icon(
                                                                        Icons
                                                                            .star_border_outlined,
                                                                        color: Color.fromARGB(
                                                                            252,
                                                                            0,
                                                                            255,
                                                                            42),
                                                                        size:
                                                                            20),
                                                                    Icon(
                                                                        Icons
                                                                            .star_border_outlined,
                                                                        color: Color.fromARGB(
                                                                            252,
                                                                            0,
                                                                            255,
                                                                            42),
                                                                        size:
                                                                            20),
                                                                    Icon(
                                                                        Icons
                                                                            .star_border_outlined,
                                                                        color: Color.fromARGB(
                                                                            252,
                                                                            0,
                                                                            255,
                                                                            42),
                                                                        size:
                                                                            20),
                                                                  ],
                                                                )
                                                              : divisionResult ==
                                                                      3
                                                                  ? Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .star,
                                                                          color: Color.fromARGB(
                                                                              252,
                                                                              0,
                                                                              255,
                                                                              42),
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        Icon(
                                                                            Icons
                                                                                .star,
                                                                            color: Color.fromARGB(
                                                                                252,
                                                                                0,
                                                                                255,
                                                                                42),
                                                                            size:
                                                                                20),
                                                                        Icon(
                                                                            Icons
                                                                                .star,
                                                                            color: Color.fromARGB(
                                                                                252,
                                                                                0,
                                                                                255,
                                                                                42),
                                                                            size:
                                                                                20),
                                                                        Icon(
                                                                            Icons
                                                                                .star_border_outlined,
                                                                            color: Color.fromARGB(
                                                                                252,
                                                                                0,
                                                                                255,
                                                                                42),
                                                                            size:
                                                                                20),
                                                                        Icon(
                                                                            Icons
                                                                                .star_border_outlined,
                                                                            color: Color.fromARGB(
                                                                                252,
                                                                                0,
                                                                                255,
                                                                                42),
                                                                            size:
                                                                                20),
                                                                      ],
                                                                    )
                                                                  : divisionResult ==
                                                                          4
                                                                      ? Row(
                                                                          children: [
                                                                            Icon(
                                                                              Icons.star,
                                                                              color: Color.fromARGB(252, 0, 255, 42),
                                                                              size: 20,
                                                                            ),
                                                                            Icon(Icons.star,
                                                                                color: Color.fromARGB(252, 0, 255, 42),
                                                                                size: 20),
                                                                            Icon(Icons.star,
                                                                                color: Color.fromARGB(252, 0, 255, 42),
                                                                                size: 20),
                                                                            Icon(Icons.star,
                                                                                color: Color.fromARGB(252, 0, 255, 42),
                                                                                size: 20),
                                                                            Icon(Icons.star_border_outlined,
                                                                                color: Color.fromARGB(252, 0, 255, 42),
                                                                                size: 20),
                                                                          ],
                                                                        )
                                                                      : divisionResult ==
                                                                              5
                                                                          ? Row(
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.star,
                                                                                  color: Color.fromARGB(252, 0, 255, 42),
                                                                                  size: 20,
                                                                                ),
                                                                                Icon(Icons.star, color: Color.fromARGB(252, 0, 255, 42), size: 20),
                                                                                Icon(Icons.star, color: Color.fromARGB(252, 0, 255, 42), size: 20),
                                                                                Icon(Icons.star, color: Color.fromARGB(252, 0, 255, 42), size: 20),
                                                                                Icon(Icons.star, color: Color.fromARGB(252, 0, 255, 42), size: 20),
                                                                              ],
                                                                            )
                                                                          : Text(
                                                                              "");
                                                },
                                              );
                                            }
                                            return Container(
                                                height: 50,
                                                width: 50,
                                                child: Center(
                                                    child: Lottie.asset(
                                                        "assets/images/auto_loading.json",
                                                        height: 150)));
                                          },
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Details(
                                                        imgPath: snapshot
                                                                .data![index]
                                                            ['linkss'],
                                                        type: snapshot
                                                                .data![index]
                                                            ['titre'],
                                                        id: int.parse(snapshot
                                                                .data![index]
                                                            ['id']),
                                                        ville: snapshot
                                                                .data![index]
                                                            ['ville'],
                                                        fav: favorisList[index],
                                                      )));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(0),
                                          height: 40,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white),
                                          child: Center(
                                            child: Text(
                                              "Voir",
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontFamily: 'normal2'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }
                        return Container(
                            height: 50,
                            width: 50,
                            child: Center(
                                child: Lottie.asset(
                                    "assets/images/auto_loading.json",
                                    height: 150)));
                      },
                    ),
                  ),
                  h(50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Spots publicitaires",
                        style: TextStyle(fontFamily: "normal", fontSize: 15),
                      ),
                    ],
                  ),
                  h(20),
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder(
                      future: getSpots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                                "Erreur de chargement. Veuillez relancer l'application"),
                          );
                        }
                        if (snapshot.hasData) {
                          return CarouselSlider.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index, realIndex) {
                                return snapshot.data.length == 0
                                    ? Text("00")
                                    : InkWell(
                                        onTap: () {
                                          launchUrl(Uri.parse(
                                              "${snapshot.data![index]['numero']}"));
                                        },
                                        child: Image.network(
                                            "${snapshot.data![index]['linkss']}"
                                                .replaceAll('\\', '')),
                                      );
                              },
                              options: CarouselOptions(
                                height: 300,
                                aspectRatio: 1.0,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.3,
                                scrollDirection: Axis.horizontal,
                              ));
                        }
                        return Container(
                            height: 50,
                            width: 50,
                            child: Center(
                                child: Lottie.asset(
                                    "assets/images/auto_loading.json",
                                    height: 150)));
                      },
                    ),
                  ),
                  h(40)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Box1(String path, titre) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Resultat(
                titre: titre,
              ),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(left: 15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 214, 214, 214)),
        height: 50,
        child: Text(
          titre,
          style: TextStyle(fontFamily: 'normal2'),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  /* Box1(String path, titre) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Resultat(
                titre: titre,
              ),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(left: 15),
        height: 140,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 235, 235, 235),
        ),
        child: Column(
          children: [
            Container(
              height: 110,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(path), fit: BoxFit.cover)),
            ),
            h(10),
            Text(
              titre,
              style: TextStyle(fontFamily: 'normal2'),textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  } */
}

class MyModalBottomSheet extends StatefulWidget {
  @override
  _MyModalBottomSheetState createState() => _MyModalBottomSheetState();
}

class _MyModalBottomSheetState extends State<MyModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Add your desired styling to the container
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Content for Tab 1
                Center(child: Text('Tab 1 Content')),
                // Content for Tab 2
                Center(child: Text('Tab 2 Content')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
