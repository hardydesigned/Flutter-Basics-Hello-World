import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  /*In der main.dart kann man nun einfach das Theme angeben:
        return MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          //Mit dem ThemeMode gebe ich an, welches Theme ich verwenden will, hier ist das nun abhängig von der Eigenschaft isDarkModeOn
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,

      //Das Theme kann ich nun in der ganzen App verwenden, muss aber nun jede Farbe so angeben:
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    */

  //Bei color.co kann ich mir zufällige Farben generieren und mir die passende Farbpalette mit Akzenten dazubekommen
  //Diese werden dann hier für das Light und das Dark Theme festgelegt
  static final Color _lightPrimaryColor = Colors.blueGrey.shade50;
  static final Color _lightPrimaryVariantColor = Colors.blueGrey.shade800;
  static final Color _lightOnPrimaryColor = Colors.blueGrey.shade200;
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _appbarColorLight = Colors.blue;

  static final Color _darkPrimaryColor = Colors.blueGrey.shade900;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static final Color _darkOnPrimaryColor = Colors.blueGrey.shade300;
  static const Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.blueGrey.shade800;

  static const Color _iconColor = Colors.white;

  //Man kann auch TextStyles ganz einfach vordefinieren
  static const TextStyle _lightHeadingText =
      TextStyle(color: _lightTextColorPrimary, fontFamily: "Rubik");

  static const TextStyle _lightBodyText = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Rubik",
      fontStyle: FontStyle.italic);

  //Hier werden dann die TextThemes festgelegt
  static const TextTheme _lightTextTheme = TextTheme(
    headline1: _lightHeadingText,
    bodyText1: _lightBodyText,
  );

  static final TextStyle _darkThemeHeadingTextStyle =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodyeTextStyle =
      _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    headline1: _darkThemeHeadingTextStyle,
    bodyText1: _darkThemeBodyeTextStyle,
  );

  //In der ThemeData kann ich dann mein light und dark Theme definieren
  static final ThemeData lightTheme = ThemeData(
      //Hier der Scaffold Hintergrund
      scaffoldBackgroundColor: _lightPrimaryColor,
      //Dann die Appbar und die Icons darin
      appBarTheme: const AppBarTheme(
          color: _appbarColorLight,
          iconTheme: IconThemeData(color: _iconColor)),
      bottomAppBarColor: _appbarColorLight,
      //Dann das generelle ColorScheme, also was die Primär, Sekundär und Highlight Farbe ist
      colorScheme: ColorScheme.light(
          primary: _lightPrimaryColor,
          onPrimary: _lightOnPrimaryColor,
          primaryVariant: _lightPrimaryVariantColor),
      //Auch das Text Theme
      textTheme: _lightTextTheme);

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: _darkPrimaryColor,
      appBarTheme: AppBarTheme(
          color: _appbarColorDark,
          iconTheme: const IconThemeData(color: _iconColor)),
      bottomAppBarColor: _appbarColorDark,
      colorScheme: ColorScheme.dark(
        primary: _darkPrimaryColor,
        onPrimary: _darkOnPrimaryColor,
        primaryVariant: _darkPrimaryVariantColor,
      ),
      textTheme: _darkTextTheme);
}
