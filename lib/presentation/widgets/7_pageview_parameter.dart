import 'package:flutter/material.dart';

class PageViewExample extends StatelessWidget {
  const PageViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      //MediaQuery Größe vergeben für die Pageview
      height: size.height * 0.2,
      //PageView ist wie Scrollview, nur in verbesserter Form mit Einrast Funktion
      //Hier aber nur für das horizontale Scrollen
      //Wichtig ist, dass man einer Pageview eine Höhe gibt, sonst geht sie ins unendliche, hier zB mit einer SizedBox
      child: PageView(
        //Im controller kann man mit dem PageController den viewport bestimmen, also hier dann das nächste Widget "anteasern"
        controller: PageController(viewportFraction: 0.95),
        //Hier dann mehere children, als "Slides"
        children: [
          //Padding ist ein Container, der ein padding haben muss
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SinglePage(
              size: size,
              text:
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor ',
              title: 'Title 1',
            ),
          ),
          //Wenn ich nun dieses Widget hinzufüge, muss ich die Parameter für den Konstruktor angeben
          //Und kann jetzt hier einfach einen Text angeben und auch die Screensize
          SinglePage(
            size: size,
            text:
                'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor ',
            title: 'Title 2',
          )
        ],
      ),
    );
  }
}

//Neues Widget erstellen
class SinglePage extends StatelessWidget {
  //Hier definiere ich Parameter
  final Size size;
  final String title;
  final String text;

  //Und gebe im Konstruktor an, dass diese angegeben werden müssen
  //Hier macht required sehr viel Sinn, damit ich auch einen Text habe
  const SinglePage(
      {Key? key, required this.size, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          //Hier kann ich nun auch einfach meine Variablen verwenden, bzw die, die oben übergeben werden
          title,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 15),
          //Hiermit kann ich auch wieder den Text alignen
          textAlign: TextAlign.center,
        ),
        SizedBox(
          //Und auch die size
          width: size.width,
          height: size.height,
        )
      ],
    );
  }
}
