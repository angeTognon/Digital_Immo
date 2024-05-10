import 'package:flutter/material.dart';
import 'package:app_feishola/admin.dart';
import 'package:app_feishola/wid.dart';
import 'package:country_picker/country_picker.dart';

class AdminCode extends StatefulWidget {
  const AdminCode({super.key});

  @override
  State<AdminCode> createState() => _AdminCodeState();
}

class _AdminCodeState extends State<AdminCode> {
  final codeController = TextEditingController();
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
      body: Container(
        margin: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              h(20),
              Text(
                "Code De Confirmation d'Accès",
                style: TextStyle(fontFamily: 'normal', fontSize: 16),
              ),
              h(200),
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
                    obscureText: true,
                    controller: codeController,
                    decoration: InputDecoration.collapsed(
                        hintText: "Code Secret",
                        hintStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              h(20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () {
                    if (codeController.text == "0408@") {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminPage(),
                          ),
                          (route) => false);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor:
                              const Color.fromARGB(255, 142, 36, 29),
                          content: Text("Mauvais code. Veuillez réessayer")));
                    }
                  },
                  child: Text(
                    "Valider",
                    style: TextStyle(fontFamily: 'normal', fontSize: 16),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
