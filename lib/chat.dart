import 'package:app_feishola/wid.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:country_picker/country_picker.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  int position = 0;
  final key = UniqueKey();
  String url = "https://tawk.to/chat/66118a0da0c6737bd12906e2/1hqq86hvh";
  bool ok = false;

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
      body: Stack(
        children: [
          WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            key: key,
            onPageFinished: (url) {
              setState(() {
                position = 1;
                Future.delayed(
                  Duration(seconds: 5),
                  () {
                    setState(() {
                      ok = true;
                    });
                  },
                );
                //print(position);
              });
            },
            onPageStarted: (url) {
              setState(() {
                position = 0;
                //print(position);
              });
            },
          ),
          ok
              ? Text("")
              : IndexedStack(
                  index: position,
                  children: [
                    Container(),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
