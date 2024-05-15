// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, sort_child_properties_last

import 'dart:convert';
import 'dart:io';

import 'package:app_feishola/main.dart';
import 'package:flutter/material.dart';
import 'package:app_feishola/wid.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:feda/feda.dart';
import 'package:feda/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:country_picker/country_picker.dart';

class Details extends StatefulWidget {
  String imgPath = "";
  String type = "";
  String ville = "";
  int id = 0;
  bool fav;
  Details(
      {required this.imgPath,
      required this.type,
      required this.id,
      required this.ville,
      required this.fav});
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  double fraisVisite = 0;
  double fraisContact = 0;
  bool dataDisplayed = false;
  bool onFav = false;
  result() async {
    //print(widget.id);
    var url =
        "https://tabaskimood.com/lac/feishola/getDetail.php?id=${widget.id}";
    var response = await http.get(Uri.parse(url));
    //print(response.statusCode);
    //print(response.body);
    var pub = await json.decode(response.body);
    return pub;
  }

  bool hide2 = false;

  String dateRdv = "";
  DateTime selectedDate = DateTime.now();
  _selectDate(BuildContext context) async {}
  String heureRdv = "";
  TimeOfDay selectedTime = TimeOfDay.now();
  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildCongcontext, child) {
        return MediaQuery(
          child: child ?? Container(),
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        );
      },
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        heureRdv =
            "${selectedTime.hour}h${selectedTime.minute}"; //selectedTime.format(context).toString();
        /// print(heureRdv);
      });
    }
  }

  String temps = "";
  String paymentLink = "";
  payment() async {
    var url =
        "https://arhythmic-extenuati.000webhostapp.com/payment.php?montant=100";
    var response = await http.post(Uri.parse(url));
    paymentLink = "${response.body}";
    //print("**************************** $paymentLink");

    //print('Response body: ${response.body}');
  }

  String startPoint = "";

  whatsapp() async {
    var contact = "+221761435791";
    var androidUrl =
        "whatsapp://send?phone=$contact&text=Bonjour GUIDI IMMO. Je viens de faire un paiement sur votre application mobile. Voici la capture d'écran : ";
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

  int note = 0;

  inscription2() async {
    // EncryptData(mpController.text);
    var url =
        "https://tabaskimood.com/lac/feishola/add_note.php?id=${widget.id}&note=$note";
    var response = await http.post(Uri.parse(url));
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    if (response.body == "OK") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color.fromARGB(255, 18, 133, 22),
          content: Text(
            "Avis ajouté",
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          )));
      // uploadImage();
    }
  }

  final commentairesControllers = TextEditingController();

  ajoutCommentaire() async {
    // EncryptData(mpController.text);
    var url =
        "https://tabaskimood.com/lac/feishola/add_comment.php?id_logement=${widget.id}&commentaires=${commentairesControllers.text}&temps=$temps&nom=$userName";
    var response = await http.post(Uri.parse(url));
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    if (response.body == "OK") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color.fromARGB(255, 18, 133, 22),
          content: Text(
            "Commentaire ajouté",
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          )));
      Navigator.pop(context);
      // uploadImage();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color.fromARGB(255, 187, 20, 11),
          content: Text(
            "Erreur",
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          )));
    }
  }

  bool slide0 = false;
  bool slide1 = false;
  bool slide3 = false;
  bool slide2 = false;
  String startPoint3 = "";
  String startPoint4 = "";
  String startPoint5 = "";
  String startPoint6 = "";
  String startPoint7 = "";

  bool b1 = false;
  bool b2 = false;
  bool b3 = false;
  int i = 0;
  bool envoyer = false;
  /* *************************************************** */
  String phonelink = "";
  createRedirectTransaction() async {
    Map<String, dynamic> transactionData = await Feda.create_transaction(
      FedaTransactionRequest(
          amount: 500,
          clienMail: "tognange@gmail.com",
          description: "Ma premiere trx feda",
          phone_number: {
            'number': "57887411",
            'country': 'bj',
          }),
      redirect: false,
      reseau: 'mtn',
    );
    Future.delayed(Duration(seconds: 20), () {
      // print("**************${transactionData['link']}");
    });
  }

  // Recupération de toute mes transactions
  getAllData() async {
    var data = await Feda.all_transactions();
    print(data);
  }

  /* *************************************************** */

  String mylink = "";
  paymennt3(String fraisContact) async {
    Navigator.pop(context);
    var url = "https://tabaskimood.com/lac/feishola/payment.php?montant=500";
    var response = await http.post(Uri.parse(url));
    // print('Response status: ****** ${response.statusCode}');
    // print('Response body:****** ${response.body}');
    mylink = response.body;
    // print("$mylink");
    launchUrl(Uri.parse(mylink));
  }

  bool etoile1 = false;
  bool etoile2 = false;
  bool etoile3 = false;
  bool etoile4 = false;
  bool etoile5 = false;

  countComments() async {
    var url =
        "https://tabaskimood.com/lac/feishola/check_number_comment.php?nom=$userName";
    var response = await http.get(Uri.parse(url));
    // print(response.statusCode);
    // print(response.body);
    var pub = await json.decode(response.body);
    return pub;
  }

  @override
  void initState() {
    // TODO: implement initState
    //countComments();
    print(widget.fav);
    super.initState();
  }

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
            Column(
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
            )),
        bottomNavigationBar: Container(
          height: 55,
          width: MediaQuery.of(context).size.width,
          color: mainColor2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  launchUrl(Uri(
                    scheme: 'tel',
                    path: phonelink,
                  ));
                },
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: mainColor2,
                        ),
                        w(10),
                        Text(
                          "Contacter",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'normal2',
                              color: mainColor2,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(242, 255, 255, 255),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
            future: result(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Erreur de chargement. Veuillez relancer l'application"),
                );
              }
              if (snapshot.hasData) {
                // print(snapshot.data);
                return snapshot.data.isEmpty
                    ? Column(
                        children: [
                          h(20),
                          Icon(
                            Icons.safety_check_rounded,
                            size: 100,
                            color: mainColor,
                          ),
                          h(20),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              "Oups, il n'y a pas encore de contenu pour ce type de logement ",
                              style: TextStyle(fontSize: 17),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        padding: EdgeInsets.all(20),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          dataDisplayed = true;
                          phonelink = "${snapshot.data![index]['phone']}";
                          print("***********$phonelink");
                          fraisVisite =
                              double.parse(snapshot.data![index]['prix']) *
                                  0.02;
                          fraisContact =
                              double.parse(snapshot.data![index]['prix']) *
                                  0.01;
                          // print(fraisVisite);
                          return Column(
                            children: [
                              Container(
                                height: 350,
                                width: MediaQuery.of(context).size.width,
                                child: FutureBuilder(
                                  future: i == 0
                                      ? getpub(widget.id, i)
                                      : i == 1
                                          ? getpub(widget.id, i)
                                          : i == 3
                                              ? getpub(widget.id, i)
                                              : getpub(widget.id, i),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasError) {
                                      return Center(
                                        child: Text(
                                            "Erreur de chargement. Veuillez relancer l'application"),
                                      );
                                    }
                                    if (snapshot.hasData) {
                                      // print(widget.id);
                                      return i == 0
                                          ? ListView.builder(
                                              itemCount: 1,
                                              itemBuilder: (context, index) {
                                                startPoint =
                                                    "${snapshot.data![0]['linkss']}"
                                                            .substring(
                                                                0,
                                                                "${snapshot.data![0]['linkss']}"
                                                                    .indexOf(
                                                                        '.jpg')) +
                                                        "2.jpg";
                                                startPoint3 =
                                                    "${snapshot.data![0]['linkss']}"
                                                            .substring(
                                                                0,
                                                                "${snapshot.data![0]['linkss']}"
                                                                    .indexOf(
                                                                        '.jpg')) +
                                                        "3.jpg";
                                                return Container(
                                                    height: 350,
                                                    width: 250,
                                                    child: Stack(
                                                      children: [
                                                        CircularProgressIndicator(
                                                          color: const Color
                                                              .fromARGB(
                                                              50, 255, 193, 7),
                                                        ),
                                                        Positioned(
                                                          right: 20,
                                                          top: 20,
                                                          child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                widget.fav =
                                                                    !widget.fav;
                                                              });
                                                            },
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 10,
                                                                      right:
                                                                          10),
                                                              height: 50,
                                                              width: 50,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100),
                                                                  color:
                                                                      mainColor2),
                                                              child: Center(
                                                                  child: Icon(
                                                                widget.fav
                                                                    ? Icons
                                                                        .favorite
                                                                    : Icons
                                                                        .favorite_border,
                                                                size: 30,
                                                                color: widget
                                                                        .fav
                                                                    ? const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        158,
                                                                        33,
                                                                        24)
                                                                    : const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        255),
                                                              )),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              "${snapshot.data![0]['linkss']}"),
                                                          fit: BoxFit.cover,
                                                        )));
                                              },
                                            )
                                          : i == 1
                                              ? ListView.builder(
                                                  itemCount: 1,
                                                  itemBuilder:
                                                      (context, index) {
                                                    startPoint = "${snapshot.data![0]['linkss']}"
                                                            .substring(
                                                                0,
                                                                "${snapshot.data![0]['linkss']}"
                                                                    .indexOf(
                                                                        '.jpg')) +
                                                        "2.jpg";
                                                    startPoint3 =
                                                        "${snapshot.data![0]['linkss']}"
                                                                .substring(
                                                                    0,
                                                                    "${snapshot.data![0]['linkss']}"
                                                                        .indexOf(
                                                                            '.jpg')) +
                                                            "3.jpg";
                                                    return Container(
                                                        height: 350,
                                                        width: 250,
                                                        child: Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                          color: const Color
                                                              .fromARGB(
                                                              50, 255, 193, 7),
                                                        )),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    startPoint),
                                                                fit: BoxFit
                                                                    .cover)));
                                                    ;
                                                  },
                                                )
                                              : i == 2
                                                  ? ListView.builder(
                                                      itemCount: 1,
                                                      itemBuilder:
                                                          (context, index) {
                                                        startPoint = "${snapshot.data![0]['linkss']}"
                                                                .substring(
                                                                    0,
                                                                    "${snapshot.data![0]['linkss']}"
                                                                        .indexOf(
                                                                            '.jpg')) +
                                                            "2.jpg";
                                                        startPoint3 = "${snapshot.data![0]['linkss']}"
                                                                .substring(
                                                                    0,
                                                                    "${snapshot.data![0]['linkss']}"
                                                                        .indexOf(
                                                                            '.jpg')) +
                                                            "3.jpg";
                                                        startPoint4 = "${snapshot.data![0]['linkss']}"
                                                                .substring(
                                                                    0,
                                                                    "${snapshot.data![0]['linkss']}"
                                                                        .indexOf(
                                                                            '.jpg')) +
                                                            "4.jpg";
                                                        startPoint5 = "${snapshot.data![0]['linkss']}"
                                                                .substring(
                                                                    0,
                                                                    "${snapshot.data![0]['linkss']}"
                                                                        .indexOf(
                                                                            '.jpg')) +
                                                            "5.jpg";
                                                        startPoint6 = "${snapshot.data![0]['linkss']}"
                                                                .substring(
                                                                    0,
                                                                    "${snapshot.data![0]['linkss']}"
                                                                        .indexOf(
                                                                            '.jpg')) +
                                                            "6.jpg";
                                                        startPoint7 = "${snapshot.data![0]['linkss']}"
                                                                .substring(
                                                                    0,
                                                                    "${snapshot.data![0]['linkss']}"
                                                                        .indexOf(
                                                                            '.jpg')) +
                                                            "7.jpg";
                                                        return Container(
                                                            height: 350,
                                                            width: 250,
                                                            child: Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                              color: const Color
                                                                  .fromARGB(50,
                                                                  255, 193, 7),
                                                            )),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        20),
                                                                image: DecorationImage(
                                                                    image: NetworkImage(
                                                                        startPoint3),
                                                                    fit: BoxFit
                                                                        .cover)));
                                                        ;
                                                      },
                                                    )
                                                  : i == 3
                                                      ? ListView.builder(
                                                          itemCount: 1,
                                                          itemBuilder:
                                                              (context, index) {
                                                            startPoint = "${snapshot.data![0]['linkss']}".substring(
                                                                    0,
                                                                    "${snapshot.data![0]['linkss']}"
                                                                        .indexOf(
                                                                            '.jpg')) +
                                                                "2.jpg";
                                                            startPoint3 = "${snapshot.data![0]['linkss']}".substring(
                                                                    0,
                                                                    "${snapshot.data![0]['linkss']}"
                                                                        .indexOf(
                                                                            '.jpg')) +
                                                                "3.jpg";
                                                            startPoint4 = "${snapshot.data![0]['linkss']}".substring(
                                                                    0,
                                                                    "${snapshot.data![0]['linkss']}"
                                                                        .indexOf(
                                                                            '.jpg')) +
                                                                "4.jpg";
                                                            startPoint5 = "${snapshot.data![0]['linkss']}".substring(
                                                                    0,
                                                                    "${snapshot.data![0]['linkss']}"
                                                                        .indexOf(
                                                                            '.jpg')) +
                                                                "5.jpg";
                                                            startPoint6 = "${snapshot.data![0]['linkss']}".substring(
                                                                    0,
                                                                    "${snapshot.data![0]['linkss']}"
                                                                        .indexOf(
                                                                            '.jpg')) +
                                                                "6.jpg";
                                                            startPoint7 = "${snapshot.data![0]['linkss']}".substring(
                                                                    0,
                                                                    "${snapshot.data![0]['linkss']}"
                                                                        .indexOf(
                                                                            '.jpg')) +
                                                                "7.jpg";
                                                            return Container(
                                                                height: 350,
                                                                width: 250,
                                                                child: Center(
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                  color: const Color
                                                                      .fromARGB(
                                                                      50,
                                                                      255,
                                                                      193,
                                                                      7),
                                                                )),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    image: DecorationImage(
                                                                        image: NetworkImage(
                                                                            startPoint4),
                                                                        fit: BoxFit
                                                                            .cover)));
                                                            ;
                                                          },
                                                        )
                                                      : i == 4
                                                          ? ListView.builder(
                                                              itemCount: 1,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                startPoint =
                                                                    "${snapshot.data![0]['linkss']}".substring(
                                                                            0,
                                                                            "${snapshot.data![0]['linkss']}".indexOf('.jpg')) +
                                                                        "2.jpg";
                                                                startPoint3 =
                                                                    "${snapshot.data![0]['linkss']}".substring(
                                                                            0,
                                                                            "${snapshot.data![0]['linkss']}".indexOf('.jpg')) +
                                                                        "3.jpg";
                                                                startPoint4 =
                                                                    "${snapshot.data![0]['linkss']}".substring(
                                                                            0,
                                                                            "${snapshot.data![0]['linkss']}".indexOf('.jpg')) +
                                                                        "4.jpg";
                                                                startPoint5 =
                                                                    "${snapshot.data![0]['linkss']}".substring(
                                                                            0,
                                                                            "${snapshot.data![0]['linkss']}".indexOf('.jpg')) +
                                                                        "5.jpg";
                                                                startPoint6 =
                                                                    "${snapshot.data![0]['linkss']}".substring(
                                                                            0,
                                                                            "${snapshot.data![0]['linkss']}".indexOf('.jpg')) +
                                                                        "6.jpg";
                                                                startPoint7 =
                                                                    "${snapshot.data![0]['linkss']}".substring(
                                                                            0,
                                                                            "${snapshot.data![0]['linkss']}".indexOf('.jpg')) +
                                                                        "7.jpg";
                                                                return Container(
                                                                    height: 350,
                                                                    width: 250,
                                                                    child:
                                                                        Center(
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                      color: const Color
                                                                          .fromARGB(
                                                                          50,
                                                                          255,
                                                                          193,
                                                                          7),
                                                                    )),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                20),
                                                                        image: DecorationImage(
                                                                            image:
                                                                                NetworkImage(startPoint5),
                                                                            fit: BoxFit.cover)));
                                                                ;
                                                              },
                                                            )
                                                          : i == 5
                                                              ? ListView
                                                                  .builder(
                                                                  itemCount: 1,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    startPoint = "${snapshot.data![0]['linkss']}".substring(
                                                                            0,
                                                                            "${snapshot.data![0]['linkss']}".indexOf('.jpg')) +
                                                                        "2.jpg";
                                                                    startPoint3 = "${snapshot.data![0]['linkss']}".substring(
                                                                            0,
                                                                            "${snapshot.data![0]['linkss']}".indexOf('.jpg')) +
                                                                        "3.jpg";
                                                                    startPoint4 = "${snapshot.data![0]['linkss']}".substring(
                                                                            0,
                                                                            "${snapshot.data![0]['linkss']}".indexOf('.jpg')) +
                                                                        "4.jpg";
                                                                    startPoint5 = "${snapshot.data![0]['linkss']}".substring(
                                                                            0,
                                                                            "${snapshot.data![0]['linkss']}".indexOf('.jpg')) +
                                                                        "5.jpg";
                                                                    startPoint6 = "${snapshot.data![0]['linkss']}".substring(
                                                                            0,
                                                                            "${snapshot.data![0]['linkss']}".indexOf('.jpg')) +
                                                                        "6.jpg";
                                                                    startPoint7 = "${snapshot.data![0]['linkss']}".substring(
                                                                            0,
                                                                            "${snapshot.data![0]['linkss']}".indexOf('.jpg')) +
                                                                        "7.jpg";
                                                                    return Container(
                                                                        height:
                                                                            350,
                                                                        width:
                                                                            250,
                                                                        child:
                                                                            Center(
                                                                                child:
                                                                                    CircularProgressIndicator(
                                                                          color: const Color
                                                                              .fromARGB(
                                                                              50,
                                                                              255,
                                                                              193,
                                                                              7),
                                                                        )),
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            image: DecorationImage(image: NetworkImage(startPoint6), fit: BoxFit.cover)));
                                                                    ;
                                                                  },
                                                                )
                                                              : ListView
                                                                  .builder(
                                                                  itemCount: 1,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    startPoint = "${snapshot.data![0]['linkss']}".substring(
                                                                            0,
                                                                            "${snapshot.data![0]['linkss']}".indexOf('.jpg')) +
                                                                        "2.jpg";
                                                                    startPoint3 = "${snapshot.data![0]['linkss']}".substring(
                                                                            0,
                                                                            "${snapshot.data![0]['linkss']}".indexOf('.jpg')) +
                                                                        "3.jpg";
                                                                    // print("*******ddd*******" +"$startPoint");
                                                                    return Container(
                                                                        height:
                                                                            350,
                                                                        width:
                                                                            250,
                                                                        child:
                                                                            Center(
                                                                                child:
                                                                                    CircularProgressIndicator(
                                                                          color: const Color
                                                                              .fromARGB(
                                                                              50,
                                                                              255,
                                                                              193,
                                                                              7),
                                                                        )),
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            image: DecorationImage(image: NetworkImage(startPoint3), fit: BoxFit.cover)));
                                                                    ;
                                                                    ;
                                                                  },
                                                                );
                                    }
                                    //ici c'est la page d'accueil
                                    return Container(
                                        height: 50,
                                        width: 50,
                                        child: Center(
                                            child: Lottie.asset(
                                                "assets/images/auto_loading.json",
                                                height: 150)));
                                  },
                                ),
                              ),
                              h(10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          i = (i - 1) % 7;
                                          // print("*****$i");
                                          i == 1;
                                          i == 2;
                                          i == 3;
                                          i == 4;
                                          i == 5;
                                          i == 6;
                                          i == 7;
                                        });
                                      },
                                      child: Container(
                                          height: 50,
                                          width: 50,
                                          padding: EdgeInsets.only(left: 10),
                                          decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(
                                              child: Icon(
                                            Icons.arrow_back_ios,
                                            color: Colors.white,
                                            size: 30,
                                          )))),
                                  w(35),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            color: i == 0
                                                ? mainColor
                                                : Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                      ),
                                      w(8),
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            color: i == 1
                                                ? mainColor
                                                : Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                      ),
                                      w(8),
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            color: i == 2
                                                ? mainColor
                                                : Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                      ),
                                      w(8),
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            color: i == 3
                                                ? mainColor
                                                : Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                      ),
                                      w(8),
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            color: i == 4
                                                ? mainColor
                                                : Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                      ),
                                      w(8),
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            color: i == 5
                                                ? mainColor
                                                : Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                      ),
                                      w(8),
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            color: i == 6
                                                ? mainColor
                                                : Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                      ),
                                    ],
                                  ),
                                  w(35),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          i = (i + 1) % 7;
                                          // print("*****$i");
                                          i == 0;
                                          i == 1;
                                          i == 2;
                                          i == 3;
                                          i == 4;
                                          i == 5;
                                          i == 6;
                                          i == 7;
                                        });
                                      },
                                      child: Container(
                                          height: 50,
                                          width: 50,
                                          padding: EdgeInsets.only(right: 0),
                                          decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(
                                              child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 30,
                                          )))),
                                ],
                              ),
                              envoyer ? h(0) : h(10),
                              envoyer
                                  ? Text("")
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Donnez nous votre avis sur la chambre",
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                              envoyer ? h(0) : h(10),
                              envoyer
                                  ? Text("")
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    note = 1;
                                                    etoile1 = true;
                                                    etoile2 = etoile3 =
                                                        etoile4 =
                                                            etoile5 = false;
                                                  });
                                                },
                                                child: etoile1
                                                    ? Icon(
                                                        Icons.star,
                                                        size: 30,
                                                        color: mainColor,
                                                      )
                                                    : Icon(
                                                        Icons.star_border,
                                                        size: 30,
                                                      )),
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    note = 2;
                                                    etoile1 = etoile2 = true;
                                                    etoile3 = etoile4 =
                                                        etoile5 = false;
                                                  });
                                                },
                                                child: etoile2
                                                    ? Icon(
                                                        Icons.star,
                                                        size: 30,
                                                        color: mainColor,
                                                      )
                                                    : Icon(
                                                        Icons.star_border,
                                                        size: 30,
                                                      )),
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    note = 3;
                                                    etoile1 = etoile2 =
                                                        etoile3 = true;
                                                    etoile4 = etoile5 = false;
                                                  });
                                                },
                                                child: etoile3
                                                    ? Icon(
                                                        Icons.star,
                                                        size: 30,
                                                        color: mainColor,
                                                      )
                                                    : Icon(
                                                        Icons.star_border,
                                                        size: 30,
                                                      )),
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    note = 4;
                                                    etoile1 = etoile2 =
                                                        etoile3 =
                                                            etoile4 = true;
                                                    etoile5 = false;
                                                  });
                                                },
                                                child: etoile4
                                                    ? Icon(
                                                        Icons.star,
                                                        size: 30,
                                                        color: mainColor,
                                                      )
                                                    : Icon(
                                                        Icons.star_border,
                                                        size: 30,
                                                      )),
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    note = 5;
                                                    etoile1 = etoile2 =
                                                        etoile3 = etoile4 =
                                                            etoile5 = true;
                                                  });
                                                },
                                                child: etoile5
                                                    ? Icon(
                                                        Icons.star,
                                                        size: 30,
                                                        color: mainColor,
                                                      )
                                                    : Icon(
                                                        Icons.star_border,
                                                        size: 30,
                                                      )),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (etoile1 = etoile2 = etoile3 =
                                                etoile4 = etoile5 = false) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                backgroundColor: Color.fromARGB(
                                                    255, 78, 3, 3),
                                                content: Text(
                                                    "Veuillez choisir au moins une étoile"),
                                              ));
                                            } else {
                                              if (eya) {
                                                setState(() {
                                                  inscription2();
                                                  envoyer = true;
                                                });
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                144, 29, 21),
                                                        content: Text(
                                                            "Veuillez d'abord vous connecter avant d'ajouter un commentaire")));
                                              }
                                            }
                                          },
                                          child: Container(
                                              height: 40,
                                              padding: EdgeInsets.only(
                                                  left: 15, right: 15),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: mainColor),
                                              child: Center(
                                                  child: Text(
                                                "Envoyer",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))),
                                        )
                                      ],
                                    ),
                              h(10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Détails",
                                    style: TextStyle(
                                        fontFamily: 'normal', fontSize: 17),
                                  ),
                                ],
                              ),
                              h(15),
                              Column(
                                children: [
                                  Card(
                                    elevation: 10,
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Prix : ",
                                                style: TextStyle(
                                                    fontFamily: 'normal',
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                "${snapshot.data![index]['prix']} FCFA / Mois",
                                                style: TextStyle(
                                                    fontFamily: 'normal',
                                                    color: mainColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          h(15),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Pays : ",
                                                style: TextStyle(
                                                    fontFamily: 'normal',
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                "${snapshot.data![index]['pays']}",
                                                style: TextStyle(
                                                    fontFamily: 'normal2',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          h(15),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Ville : ",
                                                style: TextStyle(
                                                    fontFamily: 'normal',
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                "${snapshot.data![index]['ville']}",
                                                style: TextStyle(
                                                    fontFamily: 'normal2',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          h(15),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Quartier : ",
                                                style: TextStyle(
                                                    fontFamily: 'normal',
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                "${snapshot.data![index]['quartier']}",
                                                style: TextStyle(
                                                    fontFamily: 'normal2',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  h(10),
                                  Card(
                                      elevation: 12,
                                      child: Container(
                                          padding: EdgeInsets.all(20),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: [
                                              h(10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Description : ",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'normal',
                                                            fontSize: 15),
                                                      ),
                                                      h(15),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.3,
                                                        child: Text(
                                                          "${snapshot.data![index]['descriptionn']}",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'normal2',
                                                              fontSize: 15),
                                                          textAlign:
                                                              TextAlign.justify,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ))),
                                  snapshot.data![index]['titre'] == "Terrain"
                                      ? Text("")
                                      : h(30),
                                  snapshot.data![index]['titre'] == "Terrain"
                                      ? Text("")
                                      : Container(
                                          padding: EdgeInsets.only(
                                              left: 14, right: 14),
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 230, 230, 230),
                                              borderRadius:
                                                  BorderRadius.circular(11)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Type de Compteur",
                                                style: TextStyle(
                                                    fontFamily: 'normal2'),
                                              ),
                                              Text(
                                                "${snapshot.data![index]['doucheInterne']}",
                                                style: TextStyle(
                                                    fontFamily: 'normal',
                                                    color: mainColor),
                                              ),
                                            ],
                                          )),
                                  h(10),
                                  snapshot.data![index]['titre'] == "Terrain"
                                      ? Text("")
                                      : Container(
                                          padding: EdgeInsets.only(
                                              left: 14, right: 14),
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 230, 230, 230),
                                              borderRadius:
                                                  BorderRadius.circular(11)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Collocation disponible ?",
                                                style: TextStyle(
                                                    fontFamily: 'normal2'),
                                              ),
                                              Text(
                                                "${snapshot.data![index]['collocationDispo']}",
                                                style: TextStyle(
                                                    fontFamily: 'normal',
                                                    color: mainColor),
                                              ),
                                            ],
                                          )),
                                  snapshot.data![index]['titre'] == "Terrain"
                                      ? Text("")
                                      : h(15),
                                  Text(
                                    "COMMENTAIRES DES VISITEURS",
                                    style: TextStyle(
                                      color: mainColor,
                                      fontFamily: 'normal',
                                      fontSize: 15,
                                    ),
                                  ),
                                  h(10),
                                  Container(
                                    constraints: BoxConstraints(
                                        maxHeight: double.infinity),
                                    width: MediaQuery.of(context).size.width,
                                    child: FutureBuilder(
                                      future: getComments(widget.id),
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        if (snapshot.hasError) {
                                          return Center(
                                            child: Text(
                                                "Erreur de chargement. Veuillez relancer l'application"),
                                          );
                                        }
                                        if (snapshot.hasData) {
                                          return CarouselSlider.builder(
                                              itemCount: snapshot.data.length,
                                              itemBuilder:
                                                  (context, index, realIndex) {
                                                return snapshot.data.length == 0
                                                    ? Text("")
                                                    : Card(
                                                        elevation: 1,
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width: 3,
                                                                  color:
                                                                      mainColor)),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 10,
                                                                  left: 10),
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child: Row(
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 25,
                                                                    backgroundColor:
                                                                        mainColor,
                                                                    child: Icon(
                                                                      Icons
                                                                          .person,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 30,
                                                                    ),
                                                                  ),
                                                                  h(6),
                                                                  Text(
                                                                    "${snapshot.data![index]['nom']}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontFamily:
                                                                            'normal'),
                                                                  ),
                                                                  h(1),
                                                                  Text(
                                                                    "${snapshot.data![index]['temps']}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontFamily:
                                                                            'normal'),
                                                                  )
                                                                ],
                                                              ),
                                                              w(20),
                                                              SizedBox(
                                                                width: 160,
                                                                child: Text(
                                                                  "${snapshot.data![index]['commentaires']}",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'normal2',
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                              },
                                              options: CarouselOptions(
                                                height:
                                                    snapshot.data.length == 0
                                                        ? 0
                                                        : 130,
                                                aspectRatio: 1.0,
                                                viewportFraction: 1,
                                                initialPage: 0,
                                                enableInfiniteScroll: true,
                                                reverse: false,
                                                autoPlay: true,
                                                autoPlayInterval:
                                                    Duration(seconds: 3),
                                                autoPlayAnimationDuration:
                                                    Duration(milliseconds: 800),
                                                autoPlayCurve:
                                                    Curves.fastOutSlowIn,
                                                enlargeCenterPage: true,
                                                enlargeFactor: 0.3,
                                                scrollDirection:
                                                    Axis.horizontal,
                                              ));
                                        }
                                        return Container(
                                            height: 50,
                                            width: 50,
                                            child: Center(
                                                child: Lottie.asset(
                                                    "assets/images/auto_loading.json",
                                                    height: 150)));
                                      },
                                    ),
                                  ),
                                  hide2 ? Text("") : h(15),
                                  hide2
                                      ? Text("")
                                      : Container(
                                          padding: EdgeInsets.only(
                                              left: 20, top: 20),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: hide2 ? 10 : 160,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black38),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                          child: Container(
                                            height: 160,
                                            width: 230,
                                            child: TextFormField(
                                              controller:
                                                  commentairesControllers,
                                              decoration: InputDecoration.collapsed(
                                                  hintText:
                                                      "Donnez votre appréciation ",
                                                  hintStyle: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        ),
                                  hide2 ? Text("") : h(15),
                                  hide2
                                      ? Text("")
                                      : InkWell(
                                          onTap: () {
                                            if (eya) {
                                              setState(() {
                                                hide2 = true;
                                                temps = DateFormat('d/M/y')
                                                    .format(DateTime.now());
                                                //print(temps);
                                              });
                                              //ajoutCommentaire();
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              255, 144, 29, 21),
                                                      content: Text(
                                                          "Veuillez d'abord vous connecter avant d'ajouter un commentaire")));
                                            }
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 40,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.4,
                                                  padding: EdgeInsets.only(
                                                      left: 15, right: 15),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: mainColor),
                                                  child: Center(
                                                      child: Text(
                                                    "Envoyer Commentaire",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ))),
                                            ],
                                          ),
                                        ),
                                  h(15),
                                  /* InkWell(
                                    onTap: () async {
                                      final Uri launchUri = Uri(
                                        scheme: 'tel',
                                        path:
                                            "${snapshot.data![index]['phone']}",
                                      );
                                     
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor:
                                              Color.fromARGB(255, 14, 117, 201),
                                          radius: 25,
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          ),
                                        ),
                                        w(20),
                                        Column(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: mainColor),
                                              child: Icon(
                                                Icons.phone,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ), */
                                  h(15),
                                ],
                              )
                            ],
                          );
                        },
                      );
              }
              return Center(
                  child: Container(
                      height: 150,
                      width: 150,
                      child: Lottie.asset("assets/images/auto_loading.json")));
            },
          ),
        ));
  }
}
