import 'package:app_feishola/about.dart';
import 'package:app_feishola/accueil.dart';
import 'package:app_feishola/connexion.dart';
import 'package:app_feishola/faq.dart';
import 'package:app_feishola/main.dart';
import 'package:app_feishola/mon_compte.dart';
import 'package:app_feishola/nous_contacter.dart';
import 'package:app_feishola/publier_logement.dart';
import 'package:app_feishola/wid.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Bet extends StatefulWidget {
  const Bet({super.key});

  @override
  State<Bet> createState() => _BetState();
}

class _BetState extends State<Bet> {
    String selectedElement = '';
  int place=0;
  int i=0;
  final pages = [
   eya? MonCompte() : Connexion(),
   NousContacter(),
   Accueil(),
   About(),
   FAQ(),
  ];
  int index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      bottomNavigationBar : CurvedNavigationBar(

        onTap: (index) => setState(() {
          this.index=index;
        }),
        index: index,
        backgroundColor: Colors.transparent,
        color: mainColor,
        height: 60,
        items: [
    eya ? Icon(Icons.account_box,size: 35,color: Colors.white) : Icon(Icons.person,size: 35,color: Colors.white),
          Icon(Icons.phone,size: 35,color: Colors.white),
           Icon(Icons.home,size: 35,color: Colors.white),
          Icon(Icons.info,size: 35,color: Colors.white),
          Icon(Icons.question_mark_outlined,size: 35,color: Colors.white),
        ]
        ),
      backgroundColor: Colors.white,
      body: pages[index],
    );
  }
}