import 'package:flutter/material.dart';

class ContainerTextExample extends StatelessWidget {
  const ContainerTextExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Der Container ist das Allround Tool, damit kann man alles mögliche machen
    return Container(
      //Dem Container Höhe und Breite geben
      height: 180,
      width: 300,
      //Hiermit kann man das Child-Widget alignen
      alignment: Alignment.center,
      //Ein Container kann auch padding und margin haben
      //Man legt dafür auch ein Widget fest, EdgeInsets liegt die Seiten fest, all = alle
      padding: const EdgeInsets.all(0),
      //symmetric heißt auf beiden Seiten gleich, zB vertikal oder horizontal
      //padding: const EdgeInsets.symmetric(vertical:10),
      //Nur eine Seite wäre:
      margin: const EdgeInsets.only(bottom: 0),
      //Mit color legt man die Hintergrundfarbe fest
      //color: Colors.grey,
      //Mit decoration kann man den Container individueller stylen
      //Bei einem Container ist es immer eine Boxdecoration
      decoration: BoxDecoration(
          //Diese color überschreibt nun die Hintergrundfarbe, die color oben führt zum Fehler
          //Alles dekorative soll also hierdrin sein
          color: Colors.grey,
          //Hiermit kann man einen Rand festlegen
          border: Border.all(
            //Farbe des Randes
            color: Colors.black,
            //Randdicke
            width: 4,
          ),
          //Hier legt man dann den Borderradius fest
          borderRadius: BorderRadius.circular(16)),
      //Der Container kann ein child-widget haben
      //Mit Center kommt ein Widget rein, das das nächste zentriert
      child: Center(
        //Das child-widget vom Center
        //Material ist ein Widget, welches einen Schatten haben kann, sozusagen ein besserer Container
        child: Material(
          //Borderradius festlegen für das Material Widget
          borderRadius: BorderRadius.circular(10),
          //Mit elevation "hebt man es an" und bekommt einen Schatten, 3D Look
          elevation: 8,
          //Child-widget ist ein Container
          //Welcher über decorations besonders gestylt werden kann, denn Material hat das nicht
          //das wurde nur für 3D Effekt genutzt
          child: Container(
            //Mit alignment kann man es zB zentrieren
            alignment: Alignment.center,
            //padding: EdgeInsets.only(bottom: 20),
            //Höhe und Größe festlegen
            height: 100,
            width: 200,
            //Container decorations festlegen
            decoration: BoxDecoration(
                //Blau schattierte Hintergrundfarbe
                //color: Colors.blue[200],
                //geht auch mit Opacity 30%
                color: Colors.blue.withOpacity(0.3),
                //Borderradius wie Material, damit es gleich ist und nicht übersteht
                borderRadius: BorderRadius.circular(10)),
            //Child vom Container ist Text
            child: const Text(
              "Text Example",
              //Hier kann man Style, Size, Weight und Fontfamily festlegen
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: "Rubik",
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
