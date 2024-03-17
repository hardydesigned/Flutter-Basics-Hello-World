import 'package:flutter/material.dart';

class ContainerTextExample extends StatelessWidget {
  const ContainerTextExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Column, eine Spalte, aber ohne Scrollleiste
    return Column(
        //Entweder setzt man die Größe, lässt man sie weg, wird die width auf Bildschirmweite gesetzt
        //width: 100,
        //Und die height auf die Minimalgröße der Widgets darin
        //height: 100,
        //Hiermit richtet man die children auf der Main (Y) Axis aus, also start, center, end
        mainAxisAlignment: MainAxisAlignment.center,
        //Hiermit richtet man die children auf der Cross (X) Axis aus, also start, center, end
        crossAxisAlignment: CrossAxisAlignment.start,
        //Statt einem child, hat man bei einer column eine Liste an Widgets, die man darein packen kann
        children: [
          const ContainerTextExample(),
          //SicedBox nutzt man als Seperator, also eine leere Box mit Höhe und Größe
          const SizedBox(height: 10),
          Container(color: Colors.grey, width: 100, height: 100),
          const SizedBox(height: 10),
          //statische Widgets kann man auch so einfach mehrfach verwenden
          const ContainerTextExample(),
        ]);
  }
}
