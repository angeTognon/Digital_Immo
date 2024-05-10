import 'dart:convert';

import 'package:app_feishola/mp_oublie.dart';
import 'package:flutter/material.dart';
import 'package:app_feishola/bet.dart';
import 'package:app_feishola/inscription.dart';
import 'package:app_feishola/main.dart';
import 'package:app_feishola/wid.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:country_picker/country_picker.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final emailController = TextEditingController();
  final mpController = TextEditingController();
  bool show = false;
  login() async {
    setState(() {
      show = true;
    });
    //print("coucou");

    var url = "https://tabaskimood.com/lac/feishola/connexion.php";
    var response = await http.post(Uri.parse(url),
        body: {'email': emailController.text, 'mp': mpController.text});

    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');

    var data = json.decode(response.body);
    //print(data);
    if (data == "Success") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Color.fromARGB(255, 3, 78, 5),
        content: Text("Connexion Réussie"),
      ));
      final prefs = await SharedPreferences.getInstance();
      eya = true;
      prefs.setBool('isConnected', eya);

      user_email = emailController.text;

      final userPref = await SharedPreferences.getInstance();

      userPref.setString('email', emailController.text);
      show = false;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Bet(),
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
              "L'email ou le mot de passe n'existe pas ! Veuillez réessayer"),
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
                      child: LottieBuilder.asset("assets/images/login.json")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Connexion",
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
                "Email",
                style: TextStyle(fontSize: 14, fontFamily: 'normal'),
              ),
              h(15),
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Container(
                  height: 50,
                  width: 230,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration.collapsed(
                        hintText: "Veuillez entrer votre adresse mail",
                        hintStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              h(10),
              Text(
                "Mot de passe",
                style: TextStyle(fontSize: 14, fontFamily: 'normal'),
              ),
              h(10),
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Container(
                  height: 50,
                  width: 230,
                  child: TextFormField(
                    controller: mpController,
                    obscureText: true,
                    decoration: InputDecoration.collapsed(
                        hintText: "*************",
                        hintStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              h(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Mot de passe oublié ?",
                    style: TextStyle(fontFamily: 'normal2'),
                  ),
                  w(20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MotDePasseOublie()));
                    },
                    child: Text(
                      "Cliquez ici",
                      style: TextStyle(fontFamily: 'normal'),
                    ),
                  ),
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
              show
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    )
                  : InkWell(
                      onTap: () {
                        login();
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "Me Connecter",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'normal2',
                            ),
                          ),
                        ),
                      ),
                    ),
              h(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Vous n'avez pas de compte ?",
                    style: TextStyle(fontFamily: 'normal2'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Inscription()));
                    },
                    child: Text(
                      "S'inscrire",
                      style: TextStyle(fontFamily: 'normal'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
