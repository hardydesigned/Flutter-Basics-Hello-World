import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '14_theme_switch.dart';

//Unter pub.dev gibt es fast jedes Package für Flutter
//Für den provider muss ich das Package davon hinzufügen, mit entweder flutter pub get provider oder ich schreibe in die pubspec.yaml unter dependencies den provider in der richtigen Version
//Um nun ein Theme zu wechseln, brauch ich mit diesem Provider einen Service
class ThemeAnimationPage extends StatelessWidget {
  const ThemeAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Die ThemeDaten als Variable verfügbar machen
    final themeData = Theme.of(context);
    //Dadurch dass ich alles in einen Consumer wrappe, kann ich mein Theme hier verwenden
    return Consumer<ThemeService>(builder: (context, themeServie, child) {
      return Scaffold(
        //Hintergrundfarbe aus dem Theme übernehmen
        backgroundColor: themeData.scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: themeData.appBarTheme.backgroundColor,
          title: const Text("Theme Animation"),
        ),
        body: Center(
          child: Padding(
            //Padding nach oben und unten symmetrisch
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 20,
              //Eine Box der man bestimmte Eigenschaften zuweisen kann, hier um den Container an die komplette Breite anzupassen
              child: ConstrainedBox(
                //Diese Einschränkung wird nun an das child-Element weitergegeben, hier also das es die komplette Breite annimmt
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      //Einen Linearen Gradienten erstellen
                      gradient: LinearGradient(
                          //Die Lisste von Colors erstellen, abhängig davon welches Theme an ist
                          colors: themeServie.isDarkModeOn
                              ? const [
                                  //Anfangsfarbe, Mittelfarbe und Endfarbe
                                  Color(0xFF94A9FF),
                                  Color(0xFF6B66CC),
                                  Color(0xFF200F75),
                                ]
                              : [
                                  //Hier gebe ich den Hexcode an
                                  const Color(0xDDFFFA66),
                                  const Color(0xDDFFA057),
                                  const Color(0xDD940B99)
                                  //Folgendes geht auch als RBG Farbe:
                                  //const Color.fromARGB(100, 12, 12, 100);
                                ],
                          //Hier legt man den Beginn fest
                          begin: Alignment.bottomCenter,
                          //sowie das Ende, wo das also sein soll
                          end: Alignment.topCenter)),
                  child: Stack(
                    children: [
                      //Die einzelnen Sterne positioniere ich nun genau mit dem Positioned Widget
                      Positioned(
                          //Von dem parent Widget nun 70 Pixel nach unten
                          top: 70,
                          //Und von rechts 50px entfernt
                          right: 50,
                          //Hiermit animiere ich die Sichtbarkeit
                          //Sobald sich in dem Element ein Wert ändert, wird die Animation ausgelöst
                          //Mit einem AnimationController kann ich die Animation in Funktionen steuern
                          //Mit dem curve Attribut kann ich der Animation Feintuning geben
                          //Mit einem AnimatedContainer habe ich noch viel mehr Möglichkeiten
                          child: AnimatedOpacity(
                              //Dauer festlegen, hier 200ms
                              duration: const Duration(milliseconds: 200),
                              //Je nach Theme dann den Stern sichtbar bzw. unsichtbar machen
                              opacity: themeServie.isDarkModeOn ? 1 : 0,
                              child: const Star())),
                      //So kann ich jedes einzelne frei positionieren
                      Positioned(
                          top: 150,
                          left: 60,
                          child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: themeServie.isDarkModeOn ? 1 : 0,
                              child: const Star())),
                      Positioned(
                          top: 40,
                          left: 200,
                          child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: themeServie.isDarkModeOn ? 1 : 0,
                              child: const Star())),
                      //Mit Positioned kann ich ein Widget nun genau platzieren
                      Positioned(
                          top: 50,
                          left: 50,
                          child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: themeServie.isDarkModeOn ? 1 : 0,
                              child: const Star())),
                      Positioned(
                          top: 100,
                          right: 200,
                          child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: themeServie.isDarkModeOn ? 1 : 0,
                              child: const Star())),
                      //Hiermit animiere ich nun den Positionswechsel
                      AnimatedPositioned(
                          //Dauer festlegen
                          duration: const Duration(milliseconds: 400),
                          //Hier abhängig vom Dark Mode an, die Position verändern
                          top: themeServie.isDarkModeOn ? 100 : 130,
                          //Wenn ich einfach einen Minus Bereich angebe, verschwindet er aus dem Bild
                          right: themeServie.isDarkModeOn ? 100 : -40,
                          //Um ihn zusätzlich langsam verschwinden zu lassen, fadet er so heraus, also geht aus dem Bild und wird unsichtbar
                          child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 300),
                              opacity: themeServie.isDarkModeOn ? 1 : 0,
                              child: const Moon())),
                      //Das AnimatedPadding ist einfach ein Padding Widget, das animiert werden kann
                      AnimatedPadding(
                        //Zuerst braucht die Animation eine Dauer, die vergibt man hier als Duration
                        //Das Padding ändert sich hier innerhalt von 200ms
                        duration: const Duration(milliseconds: 200),
                        //Was soll sich nun ändern? Das Padding, die Sonne wird nun, je nach Theme Einstellung nach oben oder unten geschoben
                        //Das Widget weiß nun automatisch, wenn sich hier ein Wert ändert (isDarkModeOn)
                        //verschiebt sich die Sonne um 60 Pixel nach oben bzw. unten innerhalb von 200ms
                        padding: EdgeInsets.only(
                            top: themeServie.isDarkModeOn ? 110 : 50),
                        //Hier ist die unten erstellte Sonne
                        child: const Center(child: Sun()),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 225,
                          //Komplette Breite
                          width: double.infinity,
                          decoration: BoxDecoration(
                              //Hiermit setze ich die Farbe wieder abhängig vom ThemeMode
                              //Durch den Consumer, kann ich hier direkt den themeService nutzen
                              color: themeServie.isDarkModeOn
                                  ? themeData.appBarTheme.backgroundColor
                                  : themeData.colorScheme.primary,
                              //Hiermit runde ich die unteren Ecken ab
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Provider.of<ThemeService>(context).isDarkModeOn
                                    ? "Zu dunkel?"
                                    : "Zu hell?",
                                style: themeData.textTheme.headline1!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  height: 0.9,
                                  fontSize: 21,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                Provider.of<ThemeService>(context).isDarkModeOn
                                    ? "Lass die Sonne aufgehen"
                                    : "Lass es Nacht werden",
                                style: themeData.textTheme.bodyText1!.copyWith(
                                  height: 0.9,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const ThemeSwitcher()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

//Diese Klasse würde unter /application kommen, da sie die Anwendung bzw. die presentation steuert
//Diese Klasse erbt von ChangeNotifier, einer Klasse, die ich von der ganzen App aus erreichen kann und ich eine Nachricht bekomme, wenn sich ein Wert in dieser Klasse ändert
class ThemeService extends ChangeNotifier {
  //Das ist der Wert der sich ändern soll, also hier ob es dark oder light Theme ist
  bool isDarkModeOn = false;

  void toggleTheme() {
    //Hiermit wird der Boolean getoggelt, also immer genau umgekehrt
    isDarkModeOn = !isDarkModeOn;
    //Hiermit werden nun alle Listener (alle anderen Klassen, methoden usw) die auf die Werte hier hören, werden nun benachrichtigt
    notifyListeners();
  }
}
//Um den ChangeNotifier, bzw diese Klasse nun verwenden zu können packe ich folgendes in die main.dart:
/*
void main() {
  runApp(ChangeNotifierProvider(
    /Erzeugt nun den ThemeService für den kompletten context der App
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}
/Dazu wrappe ich meine komplette MaterialApp in den folgenden StreamBuilder:
/Ich hab nun meine App in ein Consumer Widget gewrappt, dieser hat einen context (das was gebuilded wird), einen state, das ist mein themeService und ein child, das ist MyApp
  return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp()};
*/

//Hier unten sind die einzelnen Elemente definiert, normalerweise wären das einzelne Dateien unter /widgets

//Den Mond erstellen
class Moon extends StatelessWidget {
  const Moon({Key? key}) : super(key: key);

  //Aussehen ist genauso wie die Sonne, nur andere Farben
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              colors: [Color(0xFF8983F7), Color(0xFFA3DAFB)],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight)),
    );
  }
}

//Die Sterne bauen
class Star extends StatelessWidget {
  const Star({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //Der innere, weiße Kreis ist sehr klein
      width: 2,
      height: 2,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFC9E9FC),
          //Für den äußeren Blur Effekt, nutzt man einen Boxshadow (Schatten vergeben ohne das Material Widget)
          boxShadow: [
            //Diesem übergibt man eine Liste von BoxShadows
            BoxShadow(
                //Farbe mit Transparenz übergeben
                color: const Color(0xFFC9E9FC).withOpacity(0.5),
                //Größe des Spreads
                spreadRadius: 5,
                //Verschwommenheitsradius
                blurRadius: 7,
                //Bestimmen in welche Richtung es verschoben werden soll (oben/unten), hier direkt dahinter
                offset: const Offset(0, 0))
          ]),
    );
  }
}

class Sun extends StatelessWidget {
  const Sun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Die runde Sonne unten bekommt nun mehrere Sonnenstrahlen um sich herum
    return SunShine(
      radius: 160,
      child: SunShine(
        radius: 120,
        child: SunShine(
          radius: 80,
          //Den runden Kreis mit einem Gradienten drin erstellen
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                //Hiermit wird es rund
                shape: BoxShape.circle,
                //Gradienten festlegen
                gradient: LinearGradient(
                    colors: [Color(0xDDFC554F), Color(0xDDFFF79E)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight)),
          ),
        ),
      ),
    );
  }
}

//Dies erzeugt durch einen runden Kreis, der fast komplett transparent ist
//und somit Sonnenstrahlen um die Sonne herum erstellt
class SunShine extends StatelessWidget {
  //Der Radius soll beim Erstellen immer übergeben werden
  final double radius;
  final Widget child;
  const SunShine({Key? key, required this.radius, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.white.withOpacity(0.1)),
      //Hiermit wird das child Element automatisch zentriert
      child: Center(child: child),
    );
  }
}
