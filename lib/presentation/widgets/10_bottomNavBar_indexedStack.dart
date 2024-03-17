import 'package:flutter/material.dart';
import 'package:helloworld/presentation/widgets/1_scaffold_center_architecture.dart';

//In der root Datei macht man die Navigation, also zb mit der Bottom NavBar werden hierrüber die verschiedenen Seiten angezeigt
//Diese muss ich dann auch in der main.dart als home festlegen:
//home: RootWidget(),

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  //Den aktuellen Index auf 0 setzen, also Item 1
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Um nun die richtige Page zum Index anzuzeigen, kann man folgende Dinge tun (eher unklug)
      //body: _currentIndex == 0 ? Page1 : Page2,
      //Man kann aber auch eine Methode schreiben, die dies übernimmt
      //Problem hierbei ist, dass keine Eingaben gespeichert werden oder zB der Scrollzustand
      //Lösung ist der IndexedStack, ein spezielles Widget, das den state von jedem einzelnen Wigget hält und das jeweils richtige anzeigt
      //Hier sind die children als Stack angelegt, sodass immer das mit dem aktuellen Index oben liegt
      body: IndexedStack(
        //Wieder einen Index festlegen, bezieht sich auf die children
        index: _currentIndex,
        //Die children sind nun meine einzelnen Seiten, die je nach Index angezeigt werden und dabei der komplette State gespeichert
        children: const [MyWidget(), MyWidget(), MyWidget()],
      ),
      //Über die bottomNavBar wird nun zwischen den einzelnen Seiten navigiert
      bottomNavigationBar: BottomNavigationBar(
          //Um nun den state zu verändern braucht man wieder einen setState, hier über die onTap Methode
          //Die einen Parameter übernimmt, also hier den index und so kann man direkt den currentIndex setzen
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          //Hiermit legt man fest, welches Item gerade selektiert ist, bzw was gerade unten gedrückt ist
          currentIndex: _currentIndex,
          //Farben festlegen des selektierten/nicht selektierten Items
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          //Items sind die Links für die Unterseiten
          items: const [
            //Erstellen eines Icons bzw. Items zur Navigation
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "examples"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "counter"),
            BottomNavigationBarItem(
                icon: Icon(Icons.color_lens), label: "theme"),
          ]),
    );
  }
}
