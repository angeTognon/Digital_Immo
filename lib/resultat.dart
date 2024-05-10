import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:app_feishola/wid.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

bool ok = false;
final villeController = TextEditingController();

class Resultat extends StatefulWidget {
  String titre = "";
  Resultat({required this.titre});
  @override
  State<Resultat> createState() => _ResultatState();
}

class _ResultatState extends State<Resultat> {
  String dropdownvalue = 'FILTER PAR';
  bool dropDownOpened = false;
  String selectedValue = 'FILTER PAR';
  // List of items in our dropdown menu
  var items = [
    'FILTER PAR',
    'Le plus cher',
    'Le moins cher',
    'Ville',
  ];
  bool plusCher = false;
  bool moinsCher = false;
  bool ville = false;
  bool ville2 = false;

  @override
  Widget build(BuildContext context) {
    String endPoint =
        "getData.php?titre=${widget.titre}"; //filterByPriceDesc.php?titre=${widget.titre}
    search(String e) async {
      var url = "https://tabaskimood.com/lac/feishola/$e";
      var response = await http.get(Uri.parse(url));
      // print(response.statusCode);
      // print(response.body);
      var pub = await json.decode(response.body);
      return pub;
    }

    @override
    void initState() {
      // print(ok);
      super.initState();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MAB(context, Text("")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          h(20),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Résultats de recherche",
                  style: TextStyle(fontFamily: 'normal', fontSize: 16),
                ),
                DropdownButton(
                  style: TextStyle(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                  // dropdownColor: mainColor2,
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: TextStyle(
                            fontFamily: 'normal2',
                            fontSize: 15,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                      if (dropdownvalue == "Le plus cher") {
                        setState(() {
                          plusCher = true;
                          moinsCher = false;
                          ville = false;
                        });
                      } else if (dropdownvalue == "Le moins cher") {
                        setState(() {
                          plusCher = false;
                          moinsCher = true;
                          ville = false;
                        });
                      }
                      if (dropdownvalue == "Ville") {
                        setState(() {
                          plusCher = false;
                          moinsCher = false;
                          ville = true;
                        });
                      } else if (dropdownvalue == "FILTER PAR") {
                        setState(() {
                          plusCher = false;
                          moinsCher = false;
                          ville = false;
                        });
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          h(10),
          ville
              ? Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 10),
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 255, 255, 255)),
                        child: Container(
                          height: 50,
                          width: 230,
                          child: TextFormField(
                            onFieldSubmitted: (value) {
                              setState(() {
                                ville2 = true;
                                print(ville2);
                              });
                            },
                            controller: villeController,
                            decoration: InputDecoration.collapsed(
                                hintText: "Nom de la ville",
                                hintStyle: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : h(5),
          h(10),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(bottom: 150),
            child: FutureBuilder(
              future: plusCher
                  ? search("filterByPriceDesc.php?titre=${widget.titre}")
                  : moinsCher
                      ? search("filterByPriceAsc.php?titre=${widget.titre}")
                      : ville2
                          ? search(
                              "filtre.php?titre=${widget.titre}&ville=${villeController.text}")
                          : search("getData.php?titre=${widget.titre}"),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                        "Erreur de chargement. Veuillez relancer l'application"),
                  );
                }
                if (snapshot.hasData) {
                  // print(vv.text + " ddd*****dddddddddddddd");
                  return snapshot.data.isEmpty
                      ? Column(
                          children: [
                            h(20),
                            Icon(
                              Icons.safety_check_rounded,
                              size: 100,
                              color: mainColor,
                            ),
                            h(20),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                "Oups, il n'y a pas encore de contenu pour ce type de logement ",
                                style: TextStyle(fontSize: 17),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )
                      : ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Box2(
                                  context,
                                  "${snapshot.data![index]['linkss']}",
                                  "${snapshot.data![index]['titre']}",
                                  "Publiée le ${snapshot.data![index]['temps']}",
                                  "${snapshot.data![index]['prix']}",
                                  int.parse("${snapshot.data![index]['id']}"),
                                  "${snapshot.data![index]['ville']}",
                                ),
                              ],
                            );
                          });
                }
                return Center(
                    child: Container(
                        height: 150,
                        width: 150,
                        child:
                            Lottie.asset("assets/images/auto_loading.json")));
              },
            ),
          ),
          h(150)
        ],
      ),
    );
  }
}
