import 'package:app_feishola/googleMaps/search_with_map.dart';
import 'package:app_feishola/wid.dart';
import 'package:flutter/material.dart';
import 'package:app_feishola/accueil.dart';
import 'package:app_feishola/bet.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 7),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Bet(),
          )),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor2,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          height: 250,
          width: 250,
          child: Image.asset(
            "assets/images/AF.png",
            scale: 2,
          ),
        ),
      ),
    );
  }
}
