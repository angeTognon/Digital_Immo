import 'package:flutter/material.dart';
import 'package:app_feishola/mes_spots.dart';
import 'package:app_feishola/wid.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'add.dart';
import 'package:country_picker/country_picker.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Activer(int id) async {
    var url =
        "http://agk007s.000webhostapp.com/comeup_location/activer.php?id=$id";
    var response = await http.post(Uri.parse(url));
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
  }

  Desactiver(int id) async {
    var url =
        "http://agk007s.000webhostapp.com/comeup_location/non_active.php?id=$id";
    var response = await http.post(Uri.parse(url));
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
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
              "Bienvenue Chef !",
              style: TextStyle(fontFamily: 'normal', fontSize: 17),
            ),
            h(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Add(),
                          ));
                    },
                    child: Text("Ajouter Spots")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MesSpots(),
                          ));
                    },
                    child: Text("Voir Spots Publiée")),
              ],
            ),
            h(10),
            Text(
              "Tableau de Bord des Utilisateurs",
              style: TextStyle(
                  fontFamily: 'normal', fontSize: 15, color: mainColor),
            ),
            h(20),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: getAllUsers(),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 120,
                                  child: Text(
                                    "${snapshot.data![index]['nomPrenoms']}",
                                    style: TextStyle(
                                        fontSize: 15, fontFamily: 'normal2'),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 50, 102, 166)),
                                  height: 30,
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Center(
                                    child: Text(
                                      "${snapshot.data![index]['etat']}",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'normal2',
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      //print("${snapshot.data![index]['id']}");
                                      Activer(int.parse(
                                          "${snapshot.data![index]['id']}"));
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AdminPage(),
                                          ),
                                          (route) => false);
                                    },
                                    child: Icon(Icons.check)),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AdminPage(),
                                          ),
                                          (route) => false);
                                      Desactiver(int.parse(
                                          "${snapshot.data![index]['id']}"));
                                    },
                                    child: Icon(Icons.highlight_remove_rounded))
                              ],
                            ),
                            h(20)
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
          ],
        ),
      ),
    );
  }
}
