import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ptut_game/cards/cardobject.dart';
import 'package:ptut_game/delayed_animation.dart';
import 'package:ptut_game/iu/game_settings.dart';
import 'package:ptut_game/main.dart';

class MainMenu extends StatelessWidget{


  static List _card = [];
  static List<Cardobject> cardlist = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/cards.json');
    final data = await json.decode(response);
      _card = data["cards"];
    print(_card.length.toString()+" cartes de dispo");
    for(int i = 0; i < _card.length; i++){
      List<String> effect = new List<String>.from(_card[i]["effect"]);
      cardlist.add(new Cardobject( _card[i]["name"],  _card[i]["description"], _card[i]["type"],  effect));
    }

  }

  @override
  Widget build(BuildContext contect){
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: SingleChildScrollView(child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 60,
          horizontal: 30,
        ),
        child: Column(
          children:  [
            DelayedAnimation(
              delay: 500,
                child: Container(
                  height: 150,
                  child: FlutterLogo(size:100),
                ),
            ),
            /*DelayedAnimation(
              delay: 1000,
              child: Container(
                height: 400,
                child: FlutterLogo(size:200),
              ),
            ),*/
            DelayedAnimation(
              delay: 1500,
              child: Container(
                margin: EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                ),
                child: Text('Application réalisée pour le PTut S3-S3 ',
                  textAlign: TextAlign.center, 
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 15,
                    ),),
              ),
            ),
            DelayedAnimation(
              delay: 2500,
              child: Container(
                margin: EdgeInsets.only(top:20, bottom: 20),
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: d_red,
                    shape:StadiumBorder(),
                    padding: EdgeInsets.all(13)
                  ),
                  child: Text('Commencer'),
                  onPressed: () {
                    readJson();
                    print(_card.toString());
                    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
                    Navigator.push(contect, MaterialPageRoute(builder: (contect) => GameMenuSettingsState()));
                  },
                ),
              ),
            ),
            DelayedAnimation(
              delay: 2500,
              child: Container(
                margin: EdgeInsets.only(top:20, bottom: 20),
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: d_red,
                      shape:StadiumBorder(),
                      padding: EdgeInsets.all(13)
                  ),
                  child: Text('Règles'),
                  onPressed: () {},
                ),
              ),
            ),
            DelayedAnimation(
              delay: 2500,
              child: Container(
                margin: EdgeInsets.only(top:20, bottom: 20),
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: d_red,
                      shape:StadiumBorder(),
                      padding: EdgeInsets.all(13)
                  ),
                  child: Text('Options'),
                  onPressed: () {
                    print("Nombre de carte recup : ");
                        },
                ),
              ),
            ),
          ],
        )
      ),)
    );
  }
}