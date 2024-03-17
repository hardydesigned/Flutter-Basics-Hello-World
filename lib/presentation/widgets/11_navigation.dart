import 'package:flutter/material.dart';
import 'package:helloworld/presentation/widgets/8_buttons_callback.dart';

import '10_bottomNavBar_indexedStack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Um zwischen verschiedenen Screens zu navigieren, kann man routes verwenden
    //Man definiert hier eine Map, also ein Namen (string zb "/root") und einen Key, hier die entsprechende Seite
    //Der Navigator funktioniert wie der Stack, die einzelnen Pfade werden einfach übereinander gelegt
    return MaterialApp(routes: <String, WidgetBuilder>{
      //Hier wird root festgelegt, muss dafür oben importiert werden
      "/root": (BuildContext countext) => const RootWidget(),
      "/screen1": (BuildContext countext) => const Screen1(),
      "/screen2": (BuildContext countext) => const Screen2(),
    }, home: const RootWidget());
  }
}

//Kompletter Screen mit Scaffold
class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
            onPressed: () {
              //Mit pop wird die oberste Seite entfernt, und die letzte wieder angezeigt
              Navigator.of(context).pop();
              //mit popUntil kann man beliebige Routes entfernen, bis auf diejenige, die man als Parameter angibt
            },
            text: "Navigate Back",
            buttonColor: Colors.green),
      ),
    );
  }
}

//Navigiert man per Navigator zu einem anderen Screen, erscheint oben im Scaffold ein Zurückpfeil, mit dem man zurückkommt
class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 2"),
      ),
      body: CustomButton(
          onPressed: () {
            //Mit push packt man nun den übergebenen route auf den Screen drauf, dieser ist dann ganz oben
            //Mit pushNamed wird es übereinander gelegt
            //mit pushReplacementNamed wird die aktuelle route ersetzt, man kommt dann also nicht mehr auf die vorherige zurück
            Navigator.of(context).pushReplacementNamed("/screen1");
          },
          text: "Go to Screen 1",
          buttonColor: Colors.yellow),
    );
  }
}
