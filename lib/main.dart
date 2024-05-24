import 'package:app_feishola/bet.dart';
import 'package:app_feishola/inscription2.dart';
import 'package:app_feishola/wid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:app_feishola/accueil.dart';
import 'package:app_feishola/add.dart';
import 'package:app_feishola/admin.dart';
import 'package:app_feishola/splash.dart';
import 'package:app_feishola/onBoarding.dart';
import 'package:app_feishola/resultat.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';

bool isFirstRun = false;
bool isFirstCall = false;

String currentUserId = "";
bool eya = false;
bool clientC = false;
bool etatCompte = false;
String currentUserEmail = "";
String userName = "";
String imagPath = "";
String user_email = "";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefss = await SharedPreferences.getInstance();
  final isClient = prefss.getBool('isClient') ?? false;

  final prefsss = await SharedPreferences.getInstance();
  final isActivated = prefsss.getBool('isActivated') ?? false;

  final prefs = await SharedPreferences.getInstance();
  final isConnected = prefs.getBool('isConnected') ?? false;

  final userPref = await SharedPreferences.getInstance();
  user_email = userPref.getString('email') ?? "";

  final userNamePref = await SharedPreferences.getInstance();
  userName = userNamePref.getString('userName') ?? "";

  //print("ds"+user_email);
  eya = isConnected;
  clientC = isClient;
  etatCompte = isActivated;
  // print('etatCompte');
  //print(etatCompte);
  // await Firebase.initializeApp();
  runApp(Phoenix(child: MyApp(isConnected: isConnected)));
}

final darkNotifier = ValueNotifier<bool>(false);
bool isDark = darkNotifier.value;

class MyApp extends StatefulWidget {
  final isConnected;
  MyApp({required this.isConnected});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _checkFirstRun() async {
    // verifier si l'utlisateur est connecté ou pas

    bool ifr = await IsFirstRun.isFirstRun();
    setState(() {
      isFirstRun = ifr;
    });
  }

  void _checkFirstCall() async {
    bool ifc = await IsFirstRun.isFirstCall();
    setState(() {
      isFirstCall = ifc;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _checkFirstRun();
    _checkFirstCall();
    // print(isFirstCall);
    // print(isFirstRun);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ValueListenableBuilder<bool>(
        valueListenable: darkNotifier,
        builder: (BuildContext context, bool isDark, Widget? child) {
          return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
              theme: ThemeData(primaryColor: mainColor),
              darkTheme: ThemeData.dark(),
              home: isFirstCall ? Bet() : Bet());
        }); /* MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: const Color(0xFF202328),
            backgroundColor: const Color(0xFF121710)),
        home: isFirstCall? OnBoarding() : Splash() ); */
    // home: isFirstCall? OnBoarding() : Inscription2(email: "herve5@gmail.com",) );
  }
}
