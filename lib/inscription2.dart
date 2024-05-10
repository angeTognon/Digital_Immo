import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_feishola/connexion.dart';
import 'package:country_picker/country_picker.dart';
import 'package:app_feishola/wid.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Inscription2 extends StatefulWidget {
  String? email;

  Inscription2({required this.email});

  @override
  State<Inscription2> createState() => _Inscription2State();
}

class _Inscription2State extends State<Inscription2> {
  final codeController = TextEditingController();
  bool show = false;

  login() async {
    setState(() {
      show = true;
    });
    var url = "https://tabaskimood.com/lac/feishola/verification.php";
    var response = await http.post(Uri.parse(url),
        body: {'email': widget.email, 'codee': codeController.text});

    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');

    var data = json.decode(response.body);
    //print(data);
    if (data == "Success") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Color.fromARGB(255, 3, 78, 5),
        content: Text("Votre compte a été validé!!"),
      ));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Connexion(),
          ),
          (route) => false);
    } else {
      setState(() {
        show = false;
      });
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Attention"),
          content: Text(
              "Code incorrecte. Veuillez vérifier à nouveau votre boîte mail"),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text("Ok"))
          ],
        ),
      );
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 150,
                      width: 150,
                      child:
                          LottieBuilder.asset("assets/images/register.json")),
                ],
              ),
              h(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Vérification de votre adresse mail",
                    style: TextStyle(fontSize: 18, fontFamily: 'normal'),
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
                "Veuillez taper le code de vérification à 6 chiffres que vous avez reçu dans votre boîte mail.",
                style: TextStyle(fontSize: 15, fontFamily: 'normal'),
                textAlign: TextAlign.center,
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
                    controller: codeController,
                    decoration: InputDecoration.collapsed(
                        hintText: "Code de vérification ",
                        hintStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
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
              show
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    )
                  : InkWell(
                      onTap: () {
                        // uploadImage();

                        if (codeController.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "Veuillez remplir tous les champs !",
                              style: TextStyle(
                                  fontFamily: 'normal', color: Colors.white),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 147, 36, 28),
                          ));
                        } else {
                          login();
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
                            "Valider Inscription",
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
          ),
        ));
  }
}
