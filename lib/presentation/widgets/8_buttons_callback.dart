import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Stack ist fast das gleich wie Column, aber ich kann die Widgets auch übereinander positionieren
    //Das geht mit Align und Positioned
    return Stack(
      children: [
        //Ein einfacher Button mit einem Icon
        IconButton(
            //Hier kann ich nun Code in diese Methode reinschreiben, also was passieren soll wenn ich auf den Button draufdrücke
            //Hier kann ich auch eine vordefinierte Funktion reinschreiben
            onPressed: () {
              print("Button pressed");
            },
            //Hiermit lege ich die Farbe fest, die als Hintergrund beim Drücken kurz aufleuchtet
            icon: const Icon(Icons.home)),
        //Ein Button mit Text drin
        TextButton(
            onPressed: () {
              print("Haii");
            },
            //Hier nun ein beliebiges Child Element, bsp. ein Text
            child: const Text("Halllo")),
        //Mein eigener Button, mit der einzutragenden Methode, Text und color
        CustomButton(
            onPressed: () {
              print("Hak");
            },
            text: "Lol",
            //Falls Material diese Farbe nicht findet, kommt ein ! ans Ende, das heißt dieser Wert wird nie null sein
            buttonColor: Colors.blue[200]!),
        //Jetzt kann ich diesen wiederverwenden mit neuer Methode, neuem Text usw
        CustomButton(
            onPressed: () {
              print("Hakiiiiii");
            },
            text: "Lolol",
            buttonColor: Colors.green),
      ],
    );
  }
}

//Einen eigenen Button erstellen
class CustomButton extends StatelessWidget {
  //Hiermit erstelle ich die Callback Funktion
  final Function onPressed;
  final String text;
  final Color buttonColor;
  //Und das alles in den Konstruktor
  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Das Widget InkWell hat eine onTap Funktion, die ich als onPressed nutzen kann
        InkWell(
          //Hiermit verweise ich mit der onTap auf die übergebene onPressed Funktion, als Kurzschreibweise
          //Wichtig sind am Ende die Klammern zum Ausführen
          onTap: () => onPressed(),
          //Den Button kann ich nun ganz individuell stylen und unten einen Text vergeben
          child: Material(
            elevation: 26,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: buttonColor),
              child: Center(
                  child: Text(
                text,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
