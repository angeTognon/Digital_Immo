import 'package:flutter/material.dart';
import 'package:app_feishola/connexion.dart';
import 'package:app_feishola/wid.dart';

class Publication extends StatefulWidget {
  const Publication({super.key});

  @override
  State<Publication> createState() => _PublicationState();
}

class _PublicationState extends State<Publication> {
  final emailController = TextEditingController();
  final mpController = TextEditingController();

  bool isClicked1 = false;
  bool isClicked2 = false;
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
                  Container(
                      height: 150,
                      width: 150,
                      child: Image.asset("assets/images/signup.png")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Inscription",
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
                "1- Nom & Prénoms",
                style: TextStyle(fontSize: 14, fontFamily: 'normal'),
              ),
              h(10),
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
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
                    // controller: emailController,
                    decoration: InputDecoration.collapsed(
                        hintText: "Ex : John Doe",
                        hintStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              h(10),
              Text(
                "2- Pays Actuelle",
                style: TextStyle(fontSize: 14, fontFamily: 'normal'),
              ),
              h(10),
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
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
                    // controller: emailController,
                    decoration: InputDecoration.collapsed(
                        hintText: "...",
                        hintStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              h(10),
              Text(
                "3- Numéro de téléphone",
                style: TextStyle(fontSize: 14, fontFamily: 'normal'),
              ),
              h(10),
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
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
                    keyboardType: TextInputType.phone,
                    // controller: emailController,
                    decoration: InputDecoration.collapsed(
                        hintText: "00000000",
                        hintStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              h(15),
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
              Text(
                "4- Email",
                style: TextStyle(fontSize: 14, fontFamily: 'normal'),
              ),
              h(15),
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
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
                    // controller: emailController,
                    decoration: InputDecoration.collapsed(
                        hintText: "exemple@gmail.com",
                        hintStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              h(10),
              Text(
                "5- Type de compte",
                style: TextStyle(fontSize: 14, fontFamily: 'normal'),
              ),
              h(15),
              InkWell(
                onTap: () {
                  setState(() {
                    isClicked1 = true;
                    isClicked2 = false;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isClicked1 ? Icons.circle : Icons.circle_outlined,
                      color: isClicked1 ? Colors.orange : Colors.black,
                    ),
                    w(20),
                    Text(
                      "Je cherche un logement",
                      style: TextStyle(fontFamily: 'normal2'),
                    )
                  ],
                ),
              ),
              h(15),
              InkWell(
                onTap: () {
                  setState(() {
                    isClicked2 = true;
                    isClicked1 = false;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isClicked2 ? Icons.circle : Icons.circle_outlined,
                      color: isClicked2 ? Colors.orange : Colors.black,
                    ),
                    w(20),
                    Text(
                      "Je veux publier des logements\nsur l'application",
                      style: TextStyle(fontFamily: 'normal2'),
                    )
                  ],
                ),
              ),
              h(10),
              Text(
                "6- Importez la photo de votre pièce d'identité",
                style: TextStyle(fontSize: 14, fontFamily: 'normal'),
              ),
              h(15),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: Colors.black38)),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ajouter une photo claire"),
                      Icon(Icons.photo)
                    ],
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
                height: 50,
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
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    "M'inscrire",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'normal2',
                    ),
                  ),
                ),
              ),
              h(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Vous avez déjà de compte ?",
                    style: TextStyle(fontFamily: 'normal2'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Connexion()));
                    },
                    child: Text(
                      "Se connecter",
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
