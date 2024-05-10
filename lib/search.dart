/* import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:app_feishola/wid.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
      appBar: MAB(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
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
        ),
      ),
    );
  }
}
 */