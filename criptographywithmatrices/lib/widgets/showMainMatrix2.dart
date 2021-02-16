import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'matrixTextField.dart';
import 'showingMatrix.dart';
import '../cryptography.dart';
import '../mediaQuerySize.dart';

MediaQuerySize mediaQuerySize = MediaQuerySize();
TextEditingController controllerMatrix2x2Cell11 = TextEditingController();
TextEditingController controllerMatrix2x2Cell12 = TextEditingController();
TextEditingController controllerMatrix2x2Cell21 = TextEditingController();
TextEditingController controllerMatrix2x2Cell22 = TextEditingController();
bool boolWasTheSaveButtonPressed2x2 = false;
var data2x2Verification11;
var data2x2Verification12;
var data2x2Verification21;
var data2x2Verification22;
var data2x2_11;
var data2x2_12;
var data2x2_21;
var data2x2_22;
double deviceScreenWidth;

deviceWidthSettingMatrix2x2(double widthDeviceParameter) {
  deviceScreenWidth = widthDeviceParameter;
}

bool determinatValidation2x2() {
  data2x2Verification11 = int.tryParse(controllerMatrix2x2Cell11.text);
  data2x2Verification12 = int.tryParse(controllerMatrix2x2Cell12.text);
  data2x2Verification21 = int.tryParse(controllerMatrix2x2Cell21.text);
  data2x2Verification22 = int.tryParse(controllerMatrix2x2Cell22.text);

  if((data2x2Verification11*data2x2Verification22) - (data2x2Verification12*data2x2Verification21) != 0) {
    return true;
  } else {
    return false;
  }
}

bool controllersValidationsMatrix2x2() {
  data2x2Verification11 = int.tryParse(controllerMatrix2x2Cell11.text);
  data2x2Verification12 = int.tryParse(controllerMatrix2x2Cell12.text);
  data2x2Verification21 = int.tryParse(controllerMatrix2x2Cell21.text);
  data2x2Verification22 = int.tryParse(controllerMatrix2x2Cell22.text);

  if(data2x2Verification11 == null || data2x2Verification12 == null || data2x2Verification21 == null || data2x2Verification22 == null) {
    return false;
  } else {
    return true;
  }
}

class ShowMainMatrix2x2 extends StatefulWidget {
  @override
  _ShowMainMatrix2x2State createState() => _ShowMainMatrix2x2State();
}

class _ShowMainMatrix2x2State extends State<ShowMainMatrix2x2> {

  bool showingMatrix = true;
  Cryptography cryptography = Cryptography();

  saveMatrixData(context) async {
    
    if(determinatValidation2x2()) {
      if(controllersValidationsMatrix2x2()) {

        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('matrixCell11', data2x2Verification11);
        await prefs.setInt('matrixCell12', data2x2Verification12);
        await prefs.setInt('matrixCell21', data2x2Verification21);
        await prefs.setInt('matrixCell22', data2x2Verification22);

        getMatrixData();
        wasTheSaveButtonPressed(true);

        setState(() {
          showingMatrix = !showingMatrix;
        });
        
      } else {
        wasTheSaveButtonPressed(false);

        return Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Preencha à matriz apenas com números inteiros',
              style:TextStyle(
                fontFamily: 'Orbitron',
                letterSpacing: 1.0,
                fontSize: mediaQuerySize.setFontSize(deviceScreenWidth)*0.45,
                color: Color(0xFF0f0f0f),
                fontWeight: FontWeight.w600
              ),
            ),
            backgroundColor: Color(0xFF16c878),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
          )
        );
      }
    } else {
        wasTheSaveButtonPressed(false);

        return Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'O determinate da matriz digitada não pode ser igual à 0',
              style: TextStyle(
                fontFamily: 'Orbitron',
                letterSpacing: 1.0,
                fontSize: mediaQuerySize.setFontSize(deviceScreenWidth)*0.45,
                color: Color(0xFF0f0f0f),
                fontWeight: FontWeight.w600
              ),
            ),
            backgroundColor: Color(0xFF16c878),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
          )
        );
      }
  }

  cleanMatrixData() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('matrixCell11');
    prefs.remove('matrixCell12');
    prefs.remove('matrixCell21');
    prefs.remove('matrixCell22');

    controllerMatrix2x2Cell11.clear();
    controllerMatrix2x2Cell12.clear();
    controllerMatrix2x2Cell21.clear();
    controllerMatrix2x2Cell22.clear();
  }

  getMatrixData() async {
    final prefs = await SharedPreferences.getInstance();

    data2x2_11 = prefs.getInt('matrixCell11');
    data2x2_12 = prefs.getInt('matrixCell12');
    data2x2_21 = prefs.getInt('matrixCell21');
    data2x2_22 = prefs.getInt('matrixCell22');
  }

  editMatrix() {
    wasTheSaveButtonPressed(false);

    setState(() {
      showingMatrix = !showingMatrix;
    });
  }

  wasTheSaveButtonPressed(bool wasPressed) {
    if(wasPressed) {
      boolWasTheSaveButtonPressed2x2 = true;
    } else {
      boolWasTheSaveButtonPressed2x2 = false;
    }
  }

  buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            width: mediaQuerySize.setFontSize(deviceScreenWidth)*3.0,
            height: mediaQuerySize.setFontSize(deviceScreenWidth)*1.3,
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
                padding: EdgeInsets.all(15),
                primary: Color(0xFF0f0f0f),
                shadowColor: Color(0xFF16c878),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0)
                ),
              ),
              child: Text(
                "Salvar",
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  letterSpacing: 1.0,
                  fontSize: mediaQuerySize.setFontSize(deviceScreenWidth)*0.45,
                  fontWeight: FontWeight.w900,
                  color: Colors.white
                ),
              ),
              onPressed: ()=> saveMatrixData(context)
            )
          )
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            width: mediaQuerySize.setFontSize(deviceScreenWidth)*3.0,
            height: mediaQuerySize.setFontSize(deviceScreenWidth)*1.3,
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
                padding: EdgeInsets.all(5),
                primary: Color(0xFF0f0f0f),
                shadowColor: Color(0xFF16c878),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0)
                ),
              ),
              child: Text(
                "Limpar",
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  letterSpacing: 1.0,
                  fontSize: mediaQuerySize.setFontSize(deviceScreenWidth)*0.45,
                  fontWeight: FontWeight.w900,
                  color: Colors.white
                ),
              ),
              onPressed:()=> cleanMatrixData()
            )
          )
        )
      ]
    );
  }

  editButton(deviceScreenWidth) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        width: mediaQuerySize.setFontSize(deviceScreenWidth)*3.0,
        height: mediaQuerySize.setFontSize(deviceScreenWidth)*1.3,
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
            padding: EdgeInsets.all(5),
            primary: Color(0xFF0f0f0f),
            shadowColor: Color(0xFF16c878),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0)
            ),
          ),
          child: Text(
            "Editar",
            style: TextStyle(
              fontFamily: 'Orbitron',
              letterSpacing: 0.5,
              fontSize: mediaQuerySize.setFontSize(deviceScreenWidth)*0.45,
              fontWeight: FontWeight.w900,
              color: Colors.white
            ),
          ),
          onPressed: ()=> editMatrix()
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
  
    if(showingMatrix) {
      return Column(
        children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/bracket1.png", 
                height: mediaQuerySize.setTextFieldSize(deviceScreenWidth)*2.4,
                color: Color(0xFF0e0e0e),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      MatrixTextField(
                        deviceWidth: deviceScreenWidth,
                        textFieldMargin: EdgeInsets.all(2),
                        textFieldController: controllerMatrix2x2Cell11,
                      ),
                      MatrixTextField(
                        deviceWidth: deviceScreenWidth,
                        textFieldMargin: EdgeInsets.all(2),
                        textFieldController: controllerMatrix2x2Cell12,
                      ),
                    ]
                  ),
                  Row(
                    children: [
                      MatrixTextField(
                        deviceWidth: deviceScreenWidth,
                        textFieldMargin: EdgeInsets.all(2),
                        textFieldController: controllerMatrix2x2Cell21,
                      ),
                      MatrixTextField(
                        deviceWidth: deviceScreenWidth,
                        textFieldMargin: EdgeInsets.all(2),
                        textFieldController: controllerMatrix2x2Cell22,
                      ),
                    ]
                  ),
                ]
              ),
              Image.asset(
                "images/bracket2.png",
                height: mediaQuerySize.setTextFieldSize(deviceScreenWidth)*2.4,
                color: Color(0xFF0e0e0e),
              ),
            ]
          ),
          buttons()
        ]
      );
    } else {
      return Column(
        children: [
          ShowingMatrix(
            isOrderMatrix2: true,
            showDecimalNumbers: false,
            deviceWidth: deviceScreenWidth,
            cell11: data2x2Verification11.toString(),
            cell12: data2x2Verification12.toString(),
            cell21: data2x2Verification21.toString(),
            cell22: data2x2Verification22.toString(),
          ),
          editButton(deviceScreenWidth),
        ],
      );
    }      
  } 
}