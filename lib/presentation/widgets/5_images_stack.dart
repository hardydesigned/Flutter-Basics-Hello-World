import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Stack ist fast das gleich wie Column, aber ich kann die Widgets auch übereinander positionieren
    //Das geht mit Align und Positioned
    return Stack(
      children: [
        //Mit ClipRRect kann man ein eckiges, oder mit Borderradius auch rundes Bild einfügen
        ClipRRect(
          //BorderRadius vergeben
          borderRadius: BorderRadius.circular(10),
          //Per Child gibt man das Bild an und wie es ausfüllen soll, zB mit der Art Cover (füllt das parent-widget aus)
          child: Image.asset(
            "assets/images/profilbild.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        //Mit CircleAvatar kann man ein rundes Bild einfügen
        const CircleAvatar(
          //Hier braucht man einen Radius
          radius: 200,
          //Hier bei backgroundImage nun das Bild angeben
          backgroundImage: AssetImage("assets/images/profilbild.jpeg"),
        ),
        //Mit Align kann man gut Widgets in einem anderen Widget ausrichten, da man diesen Container alignen kann
        const Align(
          //Hier wird es auf Unten Mitte gesetzt
          alignment: Alignment.bottomCenter,
        )
      ],
    );
  }
}
