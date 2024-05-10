import 'package:flutter/material.dart';
import 'package:app_feishola/bet.dart';
import 'package:app_feishola/wid.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = PageController();
  bool dernierPage = false;
  int mainIndex = 0;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 130,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /* UN */
                TextButton(
                    onPressed: () => controller.jumpToPage(3),
                    child: const Text("",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey))),
                /* DEUX */
                Center(
                    child: SmoothPageIndicator(
                  count: 3,
                  controller: controller,
                )),

                /* 3 */
                dernierPage
                    ? TextButton(
                        onPressed: () => {
                              dernierPage = true,
                            },
                        child: const Text("",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.blueGrey)))
                    : //SInon afficher bouton suivant
                    TextButton(
                        onPressed: () => controller.jumpToPage(2),
                        child: const Text("",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey))),

                /**/
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: dernierPage?(){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Bet(),), (route) => false);
                  } : () {
                    
                    controller.jumpToPage(mainIndex+1);
                    mainIndex++;
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    height: 36,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: mainColor,
                    ),
                    child: dernierPage?Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      
                        Text(
                          "Commencer",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'normal2',
                              fontSize: 14),
                        )
                      ],
                    ) :  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        w(10),
                        Text(
                          "Suivant",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'normal2',
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: Container(
        
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
          print(index);
            // setState(() => index == 2);
            setState(() => dernierPage = index == 2);
          },
          children: [
            Box("assets/images/myy.png",
                "Bienvenue sur DigitalImmo",
                "Découvrez une large gamme d'options de logement, comprenant des appartements, des studios, des chambres simples, des chambres avec toilettes, des appartements meublés et des colocations."),
            Box("assets/images/intro2.png", "Explorer les annonces disponibles",
                "Trouvez rapidement le logement parfait dans l'emplacement souhaité. Chaque annonce fournit des détails complets, y compris des photos, des descriptions, des prix, des conditions et les coordonnées du propriétaire ou du courtier."),
            Box("assets/images/intro3.png", "Réservation sécurisée et paiement",
                "Réservez votre logement choisi en ligne en toute simplicité. Notre application offre des options de paiement sécurisées pour faciliter les transactions. Simplifiez votre recherche et votre processus de réservation de logement dès aujourd'hui.")
          ],
        ),
      ),
    );
  }
}
