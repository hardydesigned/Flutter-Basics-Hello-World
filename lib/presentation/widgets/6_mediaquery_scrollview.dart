import 'package:flutter/material.dart';

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({Key? key}) : super(key: key);

  //Widget build ist die Methode die alle Widgets aufbaut, dabei ist in context generelle App Informationen
  //Den context kann ich auch nur in der build methode verwenden
  @override
  Widget build(BuildContext context) {
    //Einen finalen (unveränderbaren) Wert erstellen
    //Man benutzt die MediaQuery - Klasse die Infos über die Screengröße hat
    //Hiermit ruft man die Höhe und Breite des Endgerätes auf und speichert sie als size
    final size = MediaQuery.of(context).size;

    return Container(
      //Nun kann man an das Display angepasste Höhen und Weiten vergeben
      height: size.height * 0.1,
      width: size.width * 0.8,
      color: Colors.green,
      //Hiermit wird nun das Child von diesem Widget scrollable, also alles was in diesem child jetzt drin ist, kann ich scrollen
      //Man muss aufpassen, das hierdrin kein Expanded und kein Center Widget drin ist, denn dieses wird ja dann theoretisch unendlich groß -> Führt zum RenderBox Fehler (Probleme mit der Größe von einem Element)
      child: SingleChildScrollView(
        //Die Scroll-End-Anzeigbalken am Ende wenn man zu weit scrollen will kann man so ändern:
        //Nun kommmt nicht mehr so blaue Farbe, sondern es bounct
        physics: const BouncingScrollPhysics(),
        //Hier dann zB eine Column festlegen
        child: Column(children: [
          Container(),
          Container(),
          Container(),
          Container(),
        ]),
      ),
    );
  }
}
