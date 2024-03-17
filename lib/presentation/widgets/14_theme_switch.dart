import 'package:flutter/material.dart';
import 'package:helloworld/presentation/widgets/13_theme_animation.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeService>(context);

    final themeData = Theme.of(context);

    final Color backgroundColor = themeData.colorScheme.primaryVariant;

    final Color buttonColor = themeData.colorScheme.onPrimary;

    final Color textColor = themeData.textTheme.headline1!.color!;

    final List<String> values = ["Light", "Dark"];
    //Hiermit baue ich einen eigenen Switch, es gibt schon den vordefinierten Switch, also ein ToggleButton zum Schieben
    //Zusammen mit dem Provider nutze ich das so:
    //Der Value also Wert wird an isDarkModeOn über den Provider gekoppelt
    //Wenn der Switch gedrückt wird, wird auch über den Provider der DarkMode getoggelt
    /*Switch(value: Provider.of<ThemeService>(context).isDarkModeOn, onChanged: (value) {
      Provider.of<ThemeService>(context, listen: false).toggleTheme();
      },)
    */
    return SizedBox(
      width: 200,
      height: 30,
      child: Stack(
        children: <Widget>[
          InkWell(
            onHover: (_) {},
            onTap: () {
              Provider.of<ThemeService>(context, listen: false).toggleTheme();
            },
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          values[0],
                          style: TextStyle(
                            fontFamily: "Open Sans",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          values[1],
                          style: TextStyle(
                            fontFamily: "Open Sans",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          InkWell(
            onHover: (_) {},
            onTap: () {
              Provider.of<ThemeService>(context, listen: false).toggleTheme();
            },
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              curve: Curves.decelerate,
              alignment: !themeProvider.isDarkModeOn
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                width: 100,
                height: 30,
                decoration: ShapeDecoration(
                  color: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  !themeProvider.isDarkModeOn ? values[0] : values[1],
                  style: TextStyle(
                    fontFamily: "Open Sans",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
