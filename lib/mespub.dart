import 'package:flutter/material.dart';
import 'package:app_feishola/wid.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:country_picker/country_picker.dart';

class MesPubs extends StatefulWidget {
  const MesPubs({super.key});

  @override
  State<MesPubs> createState() => _MesPubsState();
}

class _MesPubsState extends State<MesPubs> {
  delete(String id) async {
    var url = "https://tabaskimood.com/lac/feishola/delete.php?id=$id";
    var response = await http.post(Uri.parse(url));
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');

    if (response.body == "OK") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color.fromARGB(255, 18, 133, 22),
          content: Text(
            "Suppression Réussie",
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          )));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MesPubs(),
          ));
    } else {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Erreur de suppresion. ",
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Formulaire de Recherche d'un logement",
                        style: TextStyle(
                          fontFamily: 'normal',
                          fontSize: 16,
                        )),
                  ],
                ),
                h(25),
                Text(
                  "Type de Propriété",
                  style: TextStyle(fontFamily: 'normal', fontSize: 16),
                ),
                h(15),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: DropdownButton(
                    menuMaxHeight: 400,
                    underline: Text(""),
                    isExpanded: true,
                    value: dropdownvalue,
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
                h(10),
                Text(
                  "Pays",
                  style: TextStyle(fontFamily: 'normal', fontSize: 16),
                ),
                h(15),
                InkWell(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      onSelect: (Country country) {
                        setState(() {
                          pays = "${country.name}";
                        });
                        //print('Select country: ${country.displayName}');
                      },
                    );
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      padding: EdgeInsets.only(left: 20, top: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 255, 255, 255)),
                      child: Text(
                        pays == "" ? "Cliquez ici pour choisir" : pays,
                        style: TextStyle(fontFamily: 'normal'),
                      )),
                ),
              ],
            )),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: mesPubs(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                        "Erreur de chargement. Veuillez relancer l'application"),
                  );
                }
                if (snapshot.hasData) {
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
                          "Oups, aucune  publication pour l'instant ",
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ): Column(
                    children: [
                      Text(
                        "Cliquez sur le botton SUPPRIMER pour supprimer votre publication.\nAttention !! Cette action est irréversible",
                        style: TextStyle(fontSize: 14, fontFamily: 'normal'),
                        textAlign: TextAlign.center,
                      ),
                      Container(

                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return BoxMesPubs(
                              snapshot.data![index]['linkss'],
                              snapshot.data![index]['pays'],
                              snapshot.data![index]['ville'],
                              snapshot.data![index]['quartier'],
                              snapshot.data![index]['prix'],
                              index,
                              snapshot.data![index]['id'],
                            );
                          },
                        ),
                      ),
                    ],
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
        ));
  }

  BoxMesPubs(String path, pays, ville, quartier, prix, int number, id) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(border: Border.all(color: mainColor)),
      margin: EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        children: [
          Container(
            height: 190,
            width: 170,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(path), fit: BoxFit.cover)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap : (){
      delete(id);

      },
                      child: Container(
                        height: 30,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: mainColor
                        ),
                        child : Center(
                          child: Text("Supprimer",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: 'normal')),
                        )
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
          Card(
            elevation: 2,
            child: Container(
              width: 160,
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Prix : ",
                        style: TextStyle(fontFamily: 'normal', fontSize: 14),
                      ),
                      Text(
                        prix, // "${snapshot.data![index]['prix']} / Mois",
                        style: TextStyle(
                            fontFamily: 'normal',
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  h(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Pays : ",
                        style: TextStyle(fontFamily: 'normal', fontSize: 14),
                      ),
                      Text(
                        pays, // "${snapshot.data![index]['pays']}",
                        style: TextStyle(
                            fontFamily: 'normal2',
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  h(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Ville : ",
                        style: TextStyle(fontFamily: 'normal', fontSize: 14),
                      ),
                      Text(
                        ville, // "${snapshot.data![index]['ville']}",
                        style: TextStyle(
                            fontFamily: 'normal2',
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  h(15),
                  Text(
                    "Quartier : ",
                    style: TextStyle(fontFamily: 'normal', fontSize: 14),
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      quartier,
                      style: TextStyle(
                          fontFamily: 'normal2',
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  h(10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
