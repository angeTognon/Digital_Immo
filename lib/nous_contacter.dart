import 'dart:io';

import 'package:flutter/material.dart';
import 'package:app_feishola/wid.dart';
import 'package:url_launcher/url_launcher.dart';

class NousContacter extends StatefulWidget {
  const NousContacter({super.key});

  @override
  State<NousContacter> createState() => _NousContacterState();
}

class _NousContacterState extends State<NousContacter> {
  final nomController = TextEditingController();
  final emailController = TextEditingController();
  final msgController = TextEditingController();

  whatsapp() async {
    var contact = "+22967316832";
    var androidUrl =
        "whatsapp://send?phone=$contact&text=Bonjour Feishola Digital. Je m'appelle ${nomController.text}. ${msgController.text}";
    var iosUrl =
        "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      //  EasyLoa.showError('WhatsApp is not installed.');
    }
  }

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
                  "Formulaire de contact",
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
              "1- Nom et prénom",
              style: TextStyle(fontSize: 14, fontFamily: 'normal'),
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
                  controller: nomController,
                  decoration: InputDecoration.collapsed(
                      hintText: "Ex : John Doe",
                      hintStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            h(20),
            Text(
              "2- Email",
              style: TextStyle(fontSize: 14, fontFamily: 'normal'),
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
                  controller: emailController,
                  decoration: InputDecoration.collapsed(
                      hintText: "Ex : exemple@gmail.com",
                      hintStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            h(20),
            Text(
              "3- Message",
              style: TextStyle(fontSize: 14, fontFamily: 'normal'),
            ),
            h(10),
            Container(
              padding: EdgeInsets.only(left: 20, top: 15),
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: Container(
                height: 100,
                width: 230,
                child: TextFormField(
                  maxLines: 15,
                  controller: msgController,
                  decoration: InputDecoration.collapsed(
                      hintText: "Cliquez ici pour écrire",
                      hintStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            h(20),
            InkWell(
              onTap: () {
                whatsapp();
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    "Envoyer",
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
      ),
    );
  }
}
