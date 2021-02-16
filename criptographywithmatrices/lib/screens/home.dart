import 'package:flutter/material.dart';
import 'package:windowsteste/mediaQuerySize.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:windowsteste/cryptography.dart';
import 'package:windowsteste/screens/settingsScreen.dart';
import '../widgets/showMainMatrix3.dart';
import '../widgets/showMainMatrix2.dart';
//import 'widget_test.dart';
import 'screenToCodeMessage.dart';
import '../mediaQuerySize.dart';
import 'screenToDecodeMessage.dart';

double deviceWidth;
final MediaQuerySize mediaQuerySize = MediaQuerySize();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  
}

class _HomeState extends State<Home> {

  Widget matrixOpition = Container();
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    final MediaQuerySize mediaQuerySize = MediaQuerySize();
    ScreenToDecodeMessage screenToDecodeMessage = ScreenToDecodeMessage();
    Cryptography cryptography = Cryptography();
    deviceWidth = MediaQuery.of(context).size.width;
    int dropdownButtonValue;
  
    switchMatrices() async {

      final prefs = await SharedPreferences.getInstance();
      dropdownButtonValue = prefs.getInt('dropdownButtonValue');
      
      if(dropdownButtonValue == 1) {
        setState(() {
          matrixOpition= ShowMainMatrix2x2();
        });
      } else {
        setState(() {
          matrixOpition= ShowMainMatrix3x3();
        });
      }
    }

    buttonVerification(screen, contextP){

      var validationFunction;
      var wasTheSaveButtonPressed;
      if(dropdownButtonValue == 1) {
        validationFunction = controllersValidationsMatrix2x2();
        wasTheSaveButtonPressed = boolWasTheSaveButtonPressed2x2;
      } else {
        validationFunction = controllersValidationsMatrix3x3();
        wasTheSaveButtonPressed = boolWasTheSaveButtonPressed3x3;
      }

      if(validationFunction == true && wasTheSaveButtonPressed == false) {
        return Scaffold.of(contextP).showSnackBar(
          SnackBar(
            content: Text(
              'Pressione o botão "Salvar" para continuar.',
              style: TextStyle(
                fontFamily: 'Orbitron',
                letterSpacing: 1.0,
                fontSize: mediaQuerySize.setFontSize(deviceWidth)*0.45,
                color: Color(0xFF0f0f0f),
                fontWeight: FontWeight.w600
              ),
            ),
            backgroundColor: Color(0xFF16c878),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
          )
        );
      } else {
        if(validationFunction == false && wasTheSaveButtonPressed == false) {
          return Scaffold.of(contextP).showSnackBar(
            SnackBar(
              content: Text(
                'Preencha à matriz com números inteiros',
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  letterSpacing: 1.0,
                  fontSize: mediaQuerySize.setFontSize(deviceWidth)*0.45,
                  color: Color(0xFF0f0f0f),
                  fontWeight: FontWeight.w600
                ),
              ),
              backgroundColor: Color(0xFF16c878),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
            )
          );
        } else {
          if(validationFunction == false && wasTheSaveButtonPressed == true) {}
          else {
            Navigator.push(contextP, MaterialPageRoute(
              builder: (contextP) => screen
            ));
          } 
        }
      }
    }

    settingDeviceScreenWidth() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('deviceWidth', deviceWidth);
    }

    deviceWidthSettingMatrix2x2(deviceWidth);
    deviceWidthSettingMatrix3x3(deviceWidth);
    switchMatrices();
    settingDeviceScreenWidth();

    return Scaffold(
      body: Builder(
        builder: (_context)=> Container(
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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.05,
                ),
                Text(
                    "Criptografia com matrizes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Orbitron',
                      letterSpacing: 0.5,
                      fontSize: mediaQuerySize.setFontSize(deviceWidth)*1.15,
                      color: Color(0xFF0f0f0f),
                      shadows: [
                        Shadow(
                          blurRadius: 0.1,
                          color: Color(0xFF16c878),
                          offset: Offset(2.0, 0.7),
                        ),
                      ],
                      fontWeight: FontWeight.w900, 
                    )
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
                  child: Text(
                    "Preencha abaixo a matriz que usaremos para codificar a mensagem",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Orbitron',
                      letterSpacing: 1.0,
                      fontSize: mediaQuerySize.setFontSize(deviceWidth)*0.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    )
                  ),
                ),
                matrixOpition,
                Padding(
                  padding: mediaQuerySize.setPadding(deviceWidth)*0.65,
                  child: Container(
                    margin: EdgeInsets.only(top: 13),
                    width: deviceWidth*0.8 >= 1000.0 ? 1000.0 : deviceWidth*0.8,
                    height: deviceWidth>=788? 160 : deviceWidth*0.2,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.1,
                          color: Color(0xFF16c878),
                          offset: Offset(2.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(7.0)
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0f0f0f),
                        shadowColor: Color(0xFF16c878),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0)
                        ),
                      ),
                      child: Text(
                        "Codificar Mensagem",
                        style: TextStyle(
                          fontFamily: 'Orbitron',
                          letterSpacing: 0.7,
                          fontSize: mediaQuerySize.setFontSize(deviceWidth)*0.55,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: ()=> buttonVerification(ScreenToCodeMessage(), _context)
                    )
                  )
                ),
                Padding(
                  padding: mediaQuerySize.setPadding(deviceWidth)*0.65,
                  child: Container(
                    margin: EdgeInsets.only(top: 13),
                    width: deviceWidth*0.8 >= 1000.0 ? 1000.0 : deviceWidth*0.8,
                    height: deviceWidth>=788? 160 : deviceWidth*0.2,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.1,
                          color: Color(0xFF16c878),
                          offset: Offset(2.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(7.0)
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0f0f0f),
                        shadowColor: Color(0xFF16c878),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0)
                        ),
                      ),
                      child: Text(
                        "Decodificar Mensagem",
                        style: TextStyle(
                          fontFamily: 'Orbitron',
                          letterSpacing: 0.7,
                          fontSize: mediaQuerySize.setFontSize(deviceWidth)*0.55,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: (){
                        cryptography.getDropdownOptionCryptography();
                        screenToDecodeMessage.setInverseMatrix();
                        screenToDecodeMessage.transfomDecimalToFractionForm();
                        buttonVerification(ScreenToDecodeMessage(), _context);
                      }
                    )
                  )
                ),
                Container(
                  width: deviceWidth*0.6,
                  height: deviceWidth>=788? 100 : deviceWidth*0.1,
                ),
              ]
            )
          )
        ),
      ),
      floatingActionButton: Container(
          height: mediaQuerySize.setTextFieldSize(deviceWidth)*0.86 >= 1000 ? 100.0 : mediaQuerySize.setTextFieldSize(deviceWidth)*0.86,
          width: mediaQuerySize.setTextFieldSize(deviceWidth)*0.86 >= 1000 ? 100.0 : mediaQuerySize.setTextFieldSize(deviceWidth)*0.86,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.1,
                color: Color(0xFF16c878),
                offset: Offset(2.0, 2.0),
              )
            ],    
          ),
          child: FloatingActionButton(
            splashColor: Color(0xFF16c878),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0)
            ),
            elevation: 5,
            backgroundColor: Color(0xFF0f0f0f),
            child: Icon(
              Icons.menu_rounded,
              size: mediaQuerySize.setTextFieldSize(deviceWidth)*0.86 >= 1000 ? 100.0 : mediaQuerySize.setTextFieldSize(deviceWidth)*0.5,
              color: Colors.white,
            ),
            onPressed: ()=> {
              updateSettingsOptions(),
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => SettingsScreen()
              ))
            },
          ),
        ),
        
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}