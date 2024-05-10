import 'package:flutter/material.dart';
import 'package:app_feishola/wid.dart';
import 'package:country_picker/country_picker.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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
          context,Text(""),
          ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Qui sommes-nous ?",
                  style: TextStyle(fontFamily: 'normal', fontSize: 16),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/about.png",
                  scale: 2,
                ),
              ],
            ),
            h(10),
            Text(
              "Feishola Immo est une application mobile innovante conçue par l'entreprise FEISHOLA DIGITAL pour simplifier la recherche de logements en Afrique. Que vous cherchiez une chambre, un appartement, un studio ou un mini-studio, Feishola Immo vous offre une plateforme conviviale pour trouver rapidement et facilement votre prochain chez-vous.",
              style: TextStyle(
                fontFamily: 'normal2',
              ),
              textAlign: TextAlign.justify,
            ),
            h(15),
            Text(
              "Notre mission est de faciliter la recherche de logements en mettant en relation les locataires potentiels avec les propriétaires et les agences immobilières de confiance. Nous comprenons les défis et les frustrations associés à la recherche de logements, c'est pourquoi nous nous efforçons de rendre ce processus aussi simple et efficace que possible.",
              style: TextStyle(
                fontFamily: 'normal2',
              ),
              textAlign: TextAlign.justify,
            ),
            h(15),
            Text(
              "Fonctionnalités principales de Feishola Immo :",
              style: TextStyle(
                fontFamily: 'normal',
              ),
              textAlign: TextAlign.justify,
            ),
            h(15),
            Text(
              "1- Recherche avancée : Parcourez une vaste sélection d'annonces de logements au Sénégal et filtrez les résultats en fonction de vos critères spécifiques tels que l'emplacement, le type de logement, le prix, le nombre de chambres, etc..",
              style: TextStyle(
                fontFamily: 'normal2',
              ),
              textAlign: TextAlign.justify,
            ),
            h(15),
            Text(
              "2- Détails complets des logements : Consultez les détails complets de chaque logement, y compris les descriptions, les photos, les caractéristiques, les commodités et les informations de contact du propriétaire ou de l'agence immobilière. .",
              style: TextStyle(
                fontFamily: 'normal2',
              ),
              textAlign: TextAlign.justify,
            ),
            h(15),
            Text(
              "3- Signalement d'annonces : Signalez les annonces suspectes ou inappropriées pour nous aider à maintenir un environnement sûr et fiable pour tous les utilisateurs de Feishola Immo..",
              style: TextStyle(
                fontFamily: 'normal2',
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

/* */