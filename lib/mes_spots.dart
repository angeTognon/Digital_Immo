import 'package:flutter/material.dart';
import 'package:app_feishola/wid.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'add.dart';
import 'package:country_picker/country_picker.dart';

class MesSpots extends StatefulWidget {
  const MesSpots({super.key});

  @override
  State<MesSpots> createState() => _MesSpotsState();
}

class _MesSpotsState extends State<MesSpots> {
  @override
  Widget build(BuildContext context) {
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
              "Vos sposts Publiés !",
              style: TextStyle(fontFamily: 'normal', fontSize: 17),
            ),
            h(15),
            Container(
              height: MediaQuery.of(context).size.height,
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
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        print("${snapshot.data![index]['linkss']}"
                            .replaceAll("\\", ""));
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 5,
                              child: Container(
                                padding: EdgeInsets.all(15),
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 150,
                                      /* decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${snapshot.data![index]['linkss']}".replaceAll('\\', '')),
                                        fit: BoxFit.cover)) */
                                    ),
                                    Container(
                                      width: 200,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          h(30),
                                          Text(
                                              "NOM ET PRÉNOM : ${snapshot.data![index]['nomPrenoms']}"),
                                          h(20),
                                          Text(
                                              "Numéro de Téléphone : ${snapshot.data![index]['numero']}"),
                                          h(20),
                                          Text(
                                              "Réseau Social : ${snapshot.data![index]['socialmedia']}"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
