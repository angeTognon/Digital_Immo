import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:app_feishola/wid.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

bool ok = false;
final villeController = TextEditingController();

class ResultatFromNav extends StatefulWidget {
  String titre = "";
  String pays = "";
  String ville = "";
  String type = "";
  ResultatFromNav(
      {required this.titre,
      required this.pays,
      required this.ville,
      required this.type});
  @override
  State<ResultatFromNav> createState() => _ResultatFromNavState();
}

class _ResultatFromNavState extends State<ResultatFromNav> {
  @override
  Widget build(BuildContext context) {
    search() async {
      var url =
          "https://tabaskimood.com/lac/feishola/recherche.php?titre=${widget.titre}&pays=${widget.pays}&ville=${widget.ville}&type=${widget.type}";
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
              ],
            ),
          ),
          h(10),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(bottom: 150),
            child: FutureBuilder(
              future: search(),
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
