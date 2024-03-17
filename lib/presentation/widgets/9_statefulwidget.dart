import 'package:flutter/material.dart';

//Bei einem statelesswidget ändert sich der aktive Zustand des Widgets nicht
//Wenn sich dynamisch etwas dran ändern los, braucht man ein stateful widget
class CounterAppPage extends StatefulWidget {
  const CounterAppPage({Key? key}) : super(key: key);
  //In dem Beispiel hier ist es eine App die auf Buttondruck einen Counter erhöht, bei 20 die Farbe wechselt und dies resetten kann

  @override
  //Hiermit erstelle ich einen dynamischen State
  _CounterAppPageState createState() => _CounterAppPageState();
}

class _CounterAppPageState extends State<CounterAppPage> {
  //Counter
  int _counter = 0;

  void _incrementCounter() {
    //Mit setState wird der State jedes mal neu gesetzt, hier kann ich also meine Werte verändern
    //Hiermit wird also dieses Widget jedes mal neu gebaut (build Methode ausgeführt), somit der Text und die Farbe neu gesetzt
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            //Hier kann ich auch binäre Operatoren direkt benutzen:
            //Solange der Counter unter 20 ist, ist die Farbe grau, darüber blau
            color: _counter < 20 ? Colors.grey : Colors.blue,
            child: Text(
              //Hier wird der counter benutzt
              _counter.toString(),
            )),
      ),
      //Standard beim Scaffold ist ein Button unten der floatet und eine gewissen Aktion ausführen kann
      //Pro Scaffold gibt es nur einen Button, für zwei packe ich das in eine Row und habe damit zwei
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              //So ein Button braucht einen Herotag, sozusagen einen eindeutigen Identifiert sonst kommt es zu Fehlern
              heroTag: "btn1",
              //Nun dem Button die oben definierte Funktion übergeben
              onPressed: () => _decrementCounter(),
            ),
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: () => _incrementCounter(),
            ),
          ],
        ),
      ),
      //Hiermit lege ich fest, wo dieser floatingbutton positioniert ist
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
