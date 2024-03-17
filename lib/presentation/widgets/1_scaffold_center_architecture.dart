import 'package:flutter/material.dart';

//Kürzel stless
//Statelesswidgets sind statisch, dh nicht veränderbar und damit sehr performant
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Scaffold ist der Hintergrund einer App
      //Dieses hat Eigenschaften wie AppBar, body und BottomNavBar
      home: Scaffold(
        //Die AppBar ist eine Leiste oben
        appBar: AppBar(
          //Mit leading kann man ein Widget vor den Title legen
          //Hier kann dann Text, ein Bild oder ein Icon rein
          //Hier wird dann das Widget Icon hinzugefügt
          leading: const Icon(
            //Hier kann man direkt aus der Material Bibliothek ein Icon auswählen
            Icons.home,
            //Und die Größe in Pixel angeben
            size: 20,
          ),
          //Diese kann einen Titel haben, das kann ein beliebiges Widget sein, hier Text
          title: const Text("My App"),
          //Den Titel zentrieren (ist in der Appbar schon so vorgegeben, sonst kann mit Lampe - Wrap with center
          //Das Text Widget zentrieren - Das Center Widget zentriert sein child-widget
          //title: Center(child: Text("My App"),
          centerTitle: true,
          //Die Hintergrundfarbe festlegen
          //Bei den colors kann man in den eckigen Klammern eine Schattierung angeben
          backgroundColor: Colors.grey[900],
        ),
        //Placeholder sind einfach Platzhalter Widgets wo nichts drin ist, bzw ein Kreuz wird angezeigt
        //Bsp: body: Placeholder()
        //Der body ist der Körper unter der AppBar, wie in HTML
        //Hier kann man entweder sofort ein Widget hinzufügen oder eine andere Klasse
        //wie zB ein Widget aus presentations/widgets
        body: const Center(
          child: Text("Hello World!"),
        ),
      ),
    );
  }
}
