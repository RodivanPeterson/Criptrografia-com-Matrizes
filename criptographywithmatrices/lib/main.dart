import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home.dart';
import 'mediaQuerySize.dart';

double deviceWidth;
final MediaQuerySize mediaQuerySize = MediaQuerySize();

void main(){
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Criptografando',
      home: Home(),
      theme: ThemeData(
        primaryColorDark: Color(0xFF16c878),
        primaryColor: Color(0xFF16c878),
        accentColor: Color(0xFF16c878),
        brightness: Brightness.light,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white
        )
      )
    )
  );
}