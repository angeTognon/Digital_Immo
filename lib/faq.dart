import 'package:flutter/material.dart';
import 'package:app_feishola/wid.dart';
import 'package:lottie/lottie.dart';
import 'package:country_picker/country_picker.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Foire Aux Questions",
                  style: TextStyle(fontFamily: 'normal', fontSize: 16),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 150,
                    width: 150,
                    child: LottieBuilder.asset("assets/images/faq.json")),
              ],
            ),
            h(15),
            Text(
              "Q1. Comment fonctionne Feishola Immo ?",
              style: TextStyle(fontFamily: 'normal', fontSize: 15),
            ),
            h(10),
            Text(
              "R1. Feishola Immo est une application mobile conviviale conçue pour vous aider à rechercher et à trouver facilement des logements en Afrique. Vous pouvez utiliser les filtres de recherche pour spécifier vos critères tels que le type de logement, la localisation, le prix, les commodités, etc. L'application affichera ensuite les listes de logements correspondantes à vos critères de recherche",
              style: TextStyle(
                fontFamily: 'normal2',
              ),
              textAlign: TextAlign.justify,
            ),
            h(15),
            Text(
              "Q2. Comment puis-je télécharger Feishola Immo ?",
              style: TextStyle(fontFamily: 'normal', fontSize: 15),
            ),
            h(10),
            Text(
              "R2. Pour télécharger Feishola Immo, veuillez visiter le magasin d'applications de votre appareil ( Google Play Store pour les appareils Android) et recherchez 'Feishola Immo'. Cliquez sur le bouton de téléchargement et l'application sera installée sur votre appareil.",
              style: TextStyle(
                fontFamily: 'normal2',
              ),
              textAlign: TextAlign.justify,
            ),
            h(15),
            Text(
              "Q3. Désengagement",
              style: TextStyle(fontFamily: 'normal', fontSize: 15),
            ),
            h(10),
            Text(
              "R3. LES CLIENTS SONT RESPONSABLES DE TOUTES LES PUBLICATIONS SUR NOTRE PLATEFOME. NOUS ENCOURAGEONS NOS CLIENTS A FOURNIR DES INFORMATIONS PRÉCISE ET NON DIFAMATOIRES EN CAS DE CONTENU INNAPROPRIÉ, NOUS NOUS RÉSERVONS LE DROIT DE LE RETIRER DE NOTRE PLATEFORME ",
              style: TextStyle(
                fontFamily: 'normal2',
              ),
              textAlign: TextAlign.justify,
            ),
            h(15),
            Text(
              "Q4. Comment puis-je effectuer une recherche sur l'application ?",
              style: TextStyle(fontFamily: 'normal', fontSize: 15),
            ),
            h(10),
            Text(
              "R4. La recherche d'un logement sur l'application se fait de 2 manières : La première en utilisant la zone de recherche sur l'écran d'accueil et la deuxième manière en cliquant sur l'une des catégories de logement",
              style: TextStyle(
                fontFamily: 'normal2',
              ),
              textAlign: TextAlign.justify,
            ),
            h(15),
            Text(
              "Q5. Puis-je contacter directement les propriétaires des logements ?",
              style: TextStyle(fontFamily: 'normal', fontSize: 15),
            ),
            h(10),
            Text(
              "R5. Oui, on peut directement contacter un propriétaire ou un démarcheur" /* "R5.Avant de contacter le propriétaire d'un logement ou un courtier, il est nécessaire de payer 1% du montant du logement. Une fois le paiement effectué, vous avez accès au numéro de téléphone de prestataire, ainsi que son nom et prénom." */,
              style: TextStyle(
                fontFamily: 'normal2',
              ),
              textAlign: TextAlign.justify,
            ),
            h(15),
            Text(
              "Q6. Comment puis-je signaler une annonce frauduleuse ou inappropriée ?",
              style: TextStyle(fontFamily: 'normal', fontSize: 15),
            ),
            h(10),
            Text(
              "R6. Si vous rencontrez une annonce frauduleuse ou inappropriée sur Feishola Immo, nous vous encourageons à nous en informer immédiatement. Vous pouvez utiliser la fonction de signalement disponible dans l'application pour nous faire part de vos préoccupations. Nous prendrons les mesures nécessaires pour enquêter sur le problème et prendre les mesures appropriées.",
              style: TextStyle(
                fontFamily: 'normal2',
              ),
              textAlign: TextAlign.justify,
            ),

            /* h(15),
            Text("Q7. Les types de compte sur notre application ",style: TextStyle(fontFamily: 'normal',fontSize: 15),),
            h(10),
            Text("R7. Les utilisateurs de l'application ont le choix entre 3 types de compte : \n\n1- Compte Coutier/Propriétaire (requiert un abonnement de 3 mois)\n\nPour un abonnement de 1 mois, Montant d'abonnement = 3500 FCFA,\n\n3 mois, Montant d'abonnement = 5.000FCFA\n\n6 mois, Montant d'abonnement = 6500FCFA \n\nPour un abonnement de 1an, Montant d'abonnement = 1 0.000 FCFA\n\n2- Compte utilisateur : Aucun abonnement n'est requis. Les paiements se font uniquement lors de la prise de contact avec le propriétaire ou le courtier. Le montant varie de 1 à 2% du prix de logement\n\n3- Compte Partenaire\n\n Les utilisateurs possédant ce compte, donne l'autorisation à Feishola Immo de Gérer leurs biens.",style: TextStyle(fontFamily: 'normal2',),textAlign: TextAlign.justify,),
 */
          ],
        ),
      ),
    );
  }
}
