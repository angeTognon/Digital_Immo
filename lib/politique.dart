import 'package:flutter/material.dart';
import 'package:app_feishola/wid.dart';

class Politique extends StatefulWidget {
  const Politique({super.key});

  @override
  State<Politique> createState() => _PolitiqueState();
}

class _PolitiqueState extends State<Politique> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAB(context, Text("")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Politique de confidentialité",
                  style: TextStyle(fontFamily: 'normal', fontSize: 17),
                ),
              ],
            ),
            h(20),
            Text(
              "La protection de vos données personnelles est d'une importance capitale pour nous. Cette politique de confidentialité vise à vous informer sur la collecte, l'utilisation et la protection des données que vous nous fournissez lors de l'utilisation de notre application de location immobilière et de paiement au en Afrique. Nous vous recommandons de lire attentivement cette politique avant d'utiliser notre application.",
              style: TextStyle(fontFamily: 'normal2', fontSize: 15),
              textAlign: TextAlign.justify,
            ),
            h(20),
            Text(
              "1/ Collecte des données personnelles",
              style: TextStyle(fontFamily: 'normal', fontSize: 15),
              textAlign: TextAlign.justify,
            ),
            h(10),
            Text(
              "Nous collectons les données personnelles suivantes lorsque vous utilisez notre application : \n\n-> Informations d'identification : nom, adresse e-mail, numéro de téléphone.\n\n-> Informations de localisation : pour faciliter la recherche de biens immobiliers dans votre région. \n\n-> Informations financières : détails de paiement, historique des transactions. \n\n-> Informations sur les biens recherchés : critères de recherche, type de bien, budget, etc. \n\n-> Informations sur les biens proposés : descriptions, photos, prix, localisation, etc.\n\n-> Historique des interactions : favoris, demandes de renseignements, réservations, etc.",
              style: TextStyle(fontFamily: 'normal2', fontSize: 15),
              textAlign: TextAlign.justify,
            ),
            h(20),
            Text(
              "2/ Utilisation des données personnelles",
              style: TextStyle(fontFamily: 'normal', fontSize: 15),
              textAlign: TextAlign.justify,
            ),
            h(10),
            Text(
              "Nous utilisons les données personnelles collectées dans le but de :\n\n-> Faciliter la recherche et la réservation de biens immobiliers.\n\n-> Traiter les paiements et les transactions financières.\n\n-> Vous fournir des informations pertinentes sur les biens immobiliers disponibles.\n\n-> Communiquer avec vous concernant vos demandes, réservations et paiements.\n\n-> Améliorer notre application et nos services en fonction de vos préférences et de vos commentaires.\n\n-> Respecter nos obligations légales et réglementaires.",
              style: TextStyle(fontFamily: 'normal2', fontSize: 15),
              textAlign: TextAlign.justify,
            ),
            h(20),
            Text(
              "3/ Protection des données personnelles ",
              style: TextStyle(fontFamily: 'normal', fontSize: 15),
              textAlign: TextAlign.justify,
            ),
            h(10),
            Text(
              "Nous mettons en œuvre des mesures techniques et organisationnelles appropriées pour protéger vos données personnelles contre tout accès non autorisé, toute divulgation, toute altération ou toute destruction. Nous utilisons des protocoles sécurisés de cryptage des données lors des transactions financières. Nous limitons l'accès à vos données personnelles aux seuls membres de notre équipe qui ont besoin d'y accéder pour fournir nos services.",
              style: TextStyle(fontFamily: 'normal2', fontSize: 15),
              textAlign: TextAlign.justify,
            ),
            h(20),
            Text(
              "4/ Partage des données personnelles",
              style: TextStyle(fontFamily: 'normal', fontSize: 15),
              textAlign: TextAlign.justify,
            ),
            h(10),
            Text(
              "Nous ne partageons pas vos données personnelles avec des tiers sans votre consentement explicite, sauf dans les cas suivants :\n\n->Avec les propriétaires des biens immobiliers pour faciliter les demandes de renseignements et les réservations.\n\n->Avec les prestataires de services tiers qui nous aident à fournir et à améliorer notre application, y compris les fournisseurs de services de paiement sécurisé.\n\n->Lorsque requis par la loi ou dans le cadre d'une procédure légale..",
              style: TextStyle(fontFamily: 'normal2', fontSize: 15),
              textAlign: TextAlign.justify,
            ),
            h(20),
            Text(
              "5/ Conservation des données personnelles ",
              style: TextStyle(fontFamily: 'normal', fontSize: 15),
              textAlign: TextAlign.justify,
            ),
            h(10),
            Text(
              "Nous conservons vos données personnelles aussi longtemps que nécessaire pour fournir nos services, traiter les paiements et respecter nos obligations légales. Si vous souhaitez supprimer vos données personnelles de notre système, veuillez nous contacter aux coordonnées fournies ci-dessous.",
              style: TextStyle(fontFamily: 'normal2', fontSize: 15),
              textAlign: TextAlign.justify,
            ),
            h(20),
            Text(
              "6/ Vos droits ",
              style: TextStyle(fontFamily: 'normal', fontSize: 15),
              textAlign: TextAlign.justify,
            ),
            h(10),
            Text(
              "Vous avez le droit d'accéder, de corriger, de mettre à jour ou de supprimer vos données personnelles. Vous pouvez également vous opposer au traitement de vos données personnelles ou demander la limitation de leur utilisation. Pour exercer ces droits, veuillez nous contacter aux coordonnées fournies ci-dessous.",
              style: TextStyle(fontFamily: 'normal2', fontSize: 15),
              textAlign: TextAlign.justify,
            ),
            h(20),
            Text(
              "7/ Modifications de la politique de confidentialité ",
              style: TextStyle(fontFamily: 'normal', fontSize: 15),
              textAlign: TextAlign.justify,
            ),
            h(10),
            Text(
              "Nous nous réservons le droit de modifier cette politique de confidentialité à tout moment. Toute modification sera publiée dans notre application. Nous vous encourageons à consulter régulièrement cette politique pour rester informé des mises à jour.",
              style: TextStyle(fontFamily: 'normal2', fontSize: 15),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
