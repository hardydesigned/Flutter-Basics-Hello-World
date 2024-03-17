import 'package:flutter/material.dart';

//In lib/main.dart ist der Haupteinstiegspunkt für die App
//Hiermit startet man einfach die App (MyApp)
//Um diese App nun zu starten:
//flutter emulator -> zeigt verfügbare Emulatoren an (Mein Pixel 4)
//flutter emulator --launch Pixel_4 -> Hiermit starte ich nun den Emulator
//flutter run -> Startet nun die App im Emulator
//q -> Quit = Schließt die App
void main() {
  runApp(const MyApp());
}

//In der main ist immer ein Grundwidget, mit dem Grundlegende Dinge beim Start machen kann
//Hier soll nur die MainMethode und das base Widget rein!
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //MaterialApp heißt ich will eine App mit Material Komponenten erstellen
    return MaterialApp(
      //Hiermit deaktiviert man den "Debug" Banner oben rechts
      debugShowCheckedModeBanner: false,
      //Mit home: legt man die Startseite/Homepage fest, zB eine Klasse in /presentations
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My App"),
        ),
        body: const Center(
          child: Text("Hello World!"),
        ),
      ),
    );
  }
}
