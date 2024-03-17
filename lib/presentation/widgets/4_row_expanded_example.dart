import 'package:flutter/material.dart';

class RowExpandedExample extends StatelessWidget {
  const RowExpandedExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Row, eine Zeile, aber ohne Scrollleiste
    return Row(
      //MainAxisAlignment richtet wieder in Y Richtung aus
      //Bei spaceBeetween sind die child-widgets gleichmäßg am Rand verteilt, also ganz außen
      //Bei spacearound haben alle child widgets den gleichen Abstand zueinander und zum Rand
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      //Hat wie Column auch wieder eine Liste von child-widgets
      children: [
        //In einer Row muss jedes widget mindestens eine width haben
        Container(color: Colors.yellow, height: 100, width:  50,),
        //Seperator, diesmal in der Breite
        const SizedBox(width:  10,),
        //Expanded ist ein Container, der sich je nach verfügbarem Platz anpasst
        //Dieser wird nach den statischen Widgets wie Container ausgewertet, da es dann den übrigen Platz einnimmt
        Expanded(flex: 2, child: Container(color: Colors.green, height: 100, )),
        const SizedBox(width:  10,),
        //Zwei Expanded nebeneinander teilen sich den Platz dann gleichmäßig auf
        //Mit flex kann ich bestimmen wie das Verhältnis ist, dh der erste nimmt 2/3, der zweite 1/3 ein
        Expanded(flex: 1, child: Container(color: Colors.red, height: 100, )),
        const SizedBox(width:  10,),
        Container(color: Colors.yellow, height: 100, width:  50,)

      ],
    );
  }
}
