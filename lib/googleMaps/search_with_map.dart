 import 'dart:async';
import 'dart:math';
import 'package:app_feishola/wid.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:label_marker/label_marker.dart';

class SearchWithMap extends StatefulWidget {
  const SearchWithMap({super.key});

  @override
  State<SearchWithMap> createState() => _SearchWithMapState();
}

//AIzaSyBxg7DeKtn1o_V4VKWtE7BprIw9d-KLMnA
//AIzaSyAjPVTxvUFaLNyXuXbB9Mor2z1edNbCwkg

/* Pour trouver la clé API google maps, voici le lien de la video youtube : 
  https://www.youtube.com/watch?v=xwJVkaCkNws */
class _SearchWithMapState extends State<SearchWithMap> {
  Completer<GoogleMapController> _controller = Completer();
  bool showMarkers = false;
  LocationData? currentLocation;
  late GoogleMapController controller2;

  List SchoolLat = [
    6.35828750,
    6.37028750, //École maternelle Publique Agla Nord
    6.37031250, //Complexe Scolaire Saint ADOLPHE
    6.37028750, //Les Lapins Bleus - Mat./Elem.
    6.37031250, //Csb Avenir sûr 2
    6.35556250, //École Les Tisserins
    6.36843750, //Ecole primaire Vodje Sud
    6.39018750, //Ecole Maternelle Primaire La Ronde
    6.37753750, //Ecole Primaire Privée La Tutrice
    6.36951250, //LA REFERENCE ecole et college
    6.38971250, //École saint Charlemagne
    6.39111250, //École maternelle et primaire Émilie de Villeneu
    6.37818750, //ECOLE PRIMAIRE PUBLIQUE SIKE NORD
    6.38276250, //École Notre Dame De Laurette
    6.35743750, //École maternelle publique de Fidjrossè
    6.35193750, //École Internationale Claire Fontaine
    6.34758750, //ECOLE MATERNELLE ET PRIMAIRE PRIVÉE LE JOYEUX LUTIN
    6.37318750, //Complexe Scolaire Éveil & Vie maternelle, primaire et secondaire
    6.35218750, //École Primaire Bon Berger
    6.39168750, //Écoles Maternelle et Primaire Catholiques Padre PIO
    6.36103750, //Ecole Primaire Catholique Les Neems
    6.39206250, //École Maternelle Publique de Fifadji
    6.36821250, //Complexe Scolaire "CLE DE LA REUSSITE"
    6.37028750, //Garderie-Ecole maternelle-Sainte Famille
    6.36143750, //École supérieure de Génie Civil Verechaguine AK.
    6.35643750, //Mille pates
    6.36826250, //École Saint-Joseph
    6.37411250 //Ecole Primaire publique IRÉDÉ
  ];
  List SchoolLong = [
    2.37754690,
    2.39123440,
    2.39118750,
    2.39123440,
    2.39118750,
    2.40564060,
    2.40539060,
    2.37910940,
    2.39560940,
    2.39167190,
    2.39448440,
    2.37945310,
    2.41479690,
    2.37007810,
    2.37423440,
    2.38906250,
    2.41717190,
    2.42043750,
    2.36901560,
    2.37868750,
    2.41651560,
    2.39656250,
    2.40485940,
    2.39123440,
    2.40756250,
    2.40156250,
    2.40942190,
    2.45648440
  ];

  void getCurrentLocation() {
    Location location = Location();

    location.getLocation().then((location) {
      setState(() {
        currentLocation = location;
        print(currentLocation!.altitude);
        print(currentLocation!.longitude);
      });
    });
  }

  Set<Marker> markers = <Marker>{};

//><2.3723499,  6.3623065

  @override
  void initState() {
    getCurrentLocation();
    for (int i = 0; i < 24; i++) {
      final loca = Marker(
          visible: true,
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
          // infoWindow: InfoWindow(title: 'nomEcole', snippet: "cou"),
          markerId: MarkerId('$i'),
          position: LatLng(SchoolLat[i], SchoolLong[i]));
      markers.add(loca);
      /* markers.addLabelMarker(LabelMarker(
          backgroundColor: mainColor,
          onTap: () {},
          label: schoolName[i],
          markerId: MarkerId('$i'),
          position: LatLng(SchoolLat[i], SchoolLong[i]))); */
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: currentLocation == null
          ? const Center(
              child: Text(
                "Chargement en cours\nNous récupérons votre position actuelle",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            )
          : GoogleMap(
              zoomControlsEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: /* _myLocation */
                  CameraPosition(
                      zoom: 15,
                      target: LatLng(currentLocation!.latitude!,
                          currentLocation!.longitude!)),
              mapType: MapType.hybrid,
              onMapCreated: (GoogleMapController controller) async {
                controller2 = controller;
                _controller.complete(controller);
                controller2.showMarkerInfoWindow(MarkerId('22'));
                controller.showMarkerInfoWindow(MarkerId('2'));
                for (int i = 0; i < 22; i++) {
                  controller.showMarkerInfoWindow(MarkerId('$i'));
                }
              },
              markers: markers, //><
            ),
    );
  }

  CustomMarker(String id, nomEcole, double lat, long) {
    return Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        markerId: MarkerId(id),
        visible: true,
        infoWindow: InfoWindow(title: nomEcole),
        position: LatLng(lat, long));
  }
}

List schoolName = [
  "École maternelle\nPublique Agla Nord",
  "Complexe Scolaire\nSaint ADOLPHE",
  "Les Lapins Bleus - Mat./Elem.",
  "Csb Avenir sûr 2",
  "École Les Tisserins",
  "Ecole primaire Vodje Sud",
  "Ecole Maternelle\nPrimaire La Ronde",
  "Ecole Primaire\nPrivée La Tutrice"
      "LA REFERENCE\necole et college",
  "École saint Charlemagne",
  "École maternelle et\nprimaire Émilie de Villeneu",
  "ECOLE PRIMAIRE\nPUBLIQUE SIKE NORD",
  "École Notre Dame\nDe Laurette",
  "École maternelle\npublique de Fidjrossè",
  "École Internationale\nClaire Fontaine",
  "ECOLE MATERNELLE ET\nPRIMAIRE PRIVÉE LE JOYEUX LUTIN",
  "Complexe Scolaire Éveil &\nVie maternelle, primaire et secondaire",
  "École Primaire Bon Berger",
  "Écoles Maternelle et\nPrimaire Catholiques Padre PIO",
  "Ecole Primaire\nCatholique Les Neems",
  "École Maternelle\nPublique de Fifadji",
  "Complexe Scolaire\nCLE DE LA REUSSITE",
  "Garderie-Ecole\nmaternelle-Sainte Famille",
  "École supérieure de\nGénie Civil Verechaguine AK.",
  "Mille pates",
  "École Saint-Joseph",
  "Ecole Primaire\npublique IRÉDÉ",
];