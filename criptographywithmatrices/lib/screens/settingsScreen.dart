import 'package:flutter/material.dart';
import '../mediaQuerySize.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool switchValue;
bool switchValueDecimalNumbers;
int dropdownButtonValue;

updateSettingsOptions() async {
  final prefs = await SharedPreferences.getInstance();
  dropdownButtonValue = prefs.getInt('dropdownButtonValue') != null ? prefs.getInt('dropdownButtonValue') : 1;
  switchValue = prefs.getBool('switchValue') != null ? prefs.getBool('switchValue') : false;
  switchValueDecimalNumbers = prefs.getBool('switchValueDecimalNumbers') != null ? prefs.getBool('switchValueDecimalNumbers') : false;
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  MediaQuerySize mediaQuerySize = MediaQuerySize();

  saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('dropdownButtonValue', dropdownButtonValue);
    await prefs.setBool('switchValue', switchValue);
    await prefs.setBool('switchValueDecimalNumbers', switchValueDecimalNumbers);
  }

  @override
  Widget build(BuildContext context) {

    double deviceData = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0f0f0f),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF343837),
              Color(0xFF0f0f0f),
            ],
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: mediaQuerySize.setMargin(deviceData)*2.0,
                child: Text(
                  "Configurações",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Orbitron',
                    letterSpacing: 1.0,
                    fontSize: mediaQuerySize.setFontSize(deviceData)*0.8,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  )
                ),
              ),
              Container(
                padding: mediaQuerySize.setPadding(deviceData),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: deviceData >= 1000.0 ? 800.0 : deviceData),
                    child: SwitchListTile(
                      activeColor: Color(0xFF16c878).withOpacity(0.9),
                    title: Text(
                      "Mostrar números decimais",
                      style: TextStyle(
                        fontFamily: 'Orbitron',
                        letterSpacing: 1.0,
                        fontSize: mediaQuerySize.setFontSize(deviceData)*0.5,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      )
                    ),
                    value: switchValueDecimalNumbers,
                    onChanged: (value){
                      setState(() {
                        switchValueDecimalNumbers = value;
                      });
                    },
                    
                  ),
                ),
              ),
              Container(
                padding: mediaQuerySize.setPadding(deviceData),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: deviceData >= 1000.0 ? 800.0 : deviceData),
                  child: ListTile(
                    title: DropdownButton(
                      isExpanded: true,
                      dropdownColor: Color(0xFF16c878).withOpacity(0.9),
                      value: dropdownButtonValue,
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            "Matriz 2x2",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Orbitron',
                              letterSpacing: 1.0,
                              fontSize: mediaQuerySize.setFontSize(deviceData)*0.55,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            )
                          ),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Matriz 3x3",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Orbitron',
                              letterSpacing: 1.0,
                              fontSize: mediaQuerySize.setFontSize(deviceData)*0.55,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            )
                          ),
                          value: 2,
                        ),
                      ],
                      
                      onChanged: (int value) {
                        setState(() {
                          dropdownButtonValue = value;
                        });
                      },
                      hint: Text(
                        "Selecione uma matriz",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Orbitron',
                          letterSpacing: 1.0,
                          fontSize: mediaQuerySize.setFontSize(deviceData)*0.45,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        )
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: mediaQuerySize.setPadding(deviceData)*3.0,
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 20),
                  width: mediaQuerySize.setFontSize(deviceData)*3.0,
                  height: mediaQuerySize.setFontSize(deviceData)*1.1,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0.1,
                        color: Color(0xFF16c878),
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(7.0)
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0f0f0f),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)
                      ),
                    ),
                    child: Text(
                      "Salvar",
                      strutStyle: StrutStyle(
                        fontSize: 1.0
                      ),
                      style: TextStyle(
                        fontFamily: 'Orbitron',
                        letterSpacing: 1.0,
                        fontSize: mediaQuerySize.setFontSize(deviceData)*0.45,
                        fontWeight: FontWeight.w900,
                        color: Colors.white
                      ),
                    ),
                    onPressed: ()=> saveSettings()
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}