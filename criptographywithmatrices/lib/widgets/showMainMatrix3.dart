import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'matrixTextField.dart';
import 'showingMatrix.dart';
import '../cryptography.dart';
import '../mediaQuerySize.dart';


TextEditingController controllerMatrix3x3Cell11 = TextEditingController();
TextEditingController controllerMatrix3x3Cell12 = TextEditingController();
TextEditingController controllerMatrix3x3Cell13 = TextEditingController();
TextEditingController controllerMatrix3x3Cell21 = TextEditingController();
TextEditingController controllerMatrix3x3Cell22 = TextEditingController();
TextEditingController controllerMatrix3x3Cell23 = TextEditingController();
TextEditingController controllerMatrix3x3Cell31 = TextEditingController();
TextEditingController controllerMatrix3x3Cell32 = TextEditingController();
TextEditingController controllerMatrix3x3Cell33 = TextEditingController();
MediaQuerySize mediaQuerySize = MediaQuerySize();
bool boolWasTheSaveButtonPressed3x3 = false;
var data3x3Verification11;
var data3x3Verification12;
var data3x3Verification13;
var data3x3Verification21;
var data3x3Verification22;
var data3x3Verification23;
var data3x3Verification31;
var data3x3Verification32;
var data3x3Verification33;
var data3x3_11;
var data3x3_12;
var data3x3_13;
var data3x3_21;
var data3x3_22;
var data3x3_23;
var data3x3_31;
var data3x3_32;
var data3x3_33;
double deviceScreenWidth;

deviceWidthSettingMatrix3x3(double widthDeviceParameter) {
  deviceScreenWidth = widthDeviceParameter;
}

bool controllersValidationsMatrix3x3() {
  data3x3Verification11 = int.tryParse(controllerMatrix3x3Cell11.text);
  data3x3Verification12 = int.tryParse(controllerMatrix3x3Cell12.text);
  data3x3Verification13 = int.tryParse(controllerMatrix3x3Cell13.text);
  data3x3Verification21 = int.tryParse(controllerMatrix3x3Cell21.text);
  data3x3Verification22 = int.tryParse(controllerMatrix3x3Cell22.text);
  data3x3Verification23 = int.tryParse(controllerMatrix3x3Cell23.text);
  data3x3Verification31 = int.tryParse(controllerMatrix3x3Cell31.text);
  data3x3Verification32 = int.tryParse(controllerMatrix3x3Cell32.text);
  data3x3Verification33 = int.tryParse(controllerMatrix3x3Cell33.text);

  if(
    data3x3Verification11 == null || data3x3Verification12 == null || data3x3Verification13 == null ||
    data3x3Verification21 == null || data3x3Verification22 == null || data3x3Verification23 == null ||
    data3x3Verification31 == null || data3x3Verification32 == null || data3x3Verification33 == null
  ) {
    return false;
  } else {
    return true;
  }
  
}

determinatValidation3x3() {
  data3x3Verification11 = int.tryParse(controllerMatrix3x3Cell11.text);
  data3x3Verification12 = int.tryParse(controllerMatrix3x3Cell12.text);
  data3x3Verification13 = int.tryParse(controllerMatrix3x3Cell13.text);
  data3x3Verification21 = int.tryParse(controllerMatrix3x3Cell21.text);
  data3x3Verification22 = int.tryParse(controllerMatrix3x3Cell22.text);
  data3x3Verification23 = int.tryParse(controllerMatrix3x3Cell23.text);
  data3x3Verification31 = int.tryParse(controllerMatrix3x3Cell31.text);
  data3x3Verification32 = int.tryParse(controllerMatrix3x3Cell32.text);
  data3x3Verification33 = int.tryParse(controllerMatrix3x3Cell33.text);

  if(
    (data3x3Verification11*data3x3Verification22*data3x3Verification33 + data3x3Verification12*data3x3Verification23*data3x3Verification31
    + data3x3Verification13*data3x3Verification21*data3x3Verification32) - (data3x3Verification13*data3x3Verification22*data3x3Verification31
    + data3x3Verification11*data3x3Verification23*data3x3Verification32 + data3x3Verification12*data3x3Verification21*data3x3Verification33) !=0
  ) {
    return true;
  } else {
    return false;
  }
  
}

class ShowMainMatrix3x3 extends StatefulWidget {
  @override
  _ShowMainMatrix3x3State createState() => _ShowMainMatrix3x3State();
}

class _ShowMainMatrix3x3State extends State<ShowMainMatrix3x3> {

  bool showingMatrix = true;
  Cryptography cryptography = Cryptography();

  saveMatrixData(context) async {
    
    if(determinatValidation3x3()) {
      if(controllersValidationsMatrix3x3()) {

        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('matrixCell11', data3x3Verification11);
        await prefs.setInt('matrixCell12', data3x3Verification12);
        await prefs.setInt('matrixCell13', data3x3Verification13);
        await prefs.setInt('matrixCell21', data3x3Verification21);
        await prefs.setInt('matrixCell22', data3x3Verification22);
        await prefs.setInt('matrixCell23', data3x3Verification23);
        await prefs.setInt('matrixCell31', data3x3Verification31);
        await prefs.setInt('matrixCell32', data3x3Verification32);
        await prefs.setInt('matrixCell33', data3x3Verification33);

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
    prefs.remove('matrixCell13');
    prefs.remove('matrixCell21');
    prefs.remove('matrixCell22');
    prefs.remove('matrixCell23');
    prefs.remove('matrixCell31');
    prefs.remove('matrixCell32');
    prefs.remove('matrixCell33');

    controllerMatrix3x3Cell11.clear();
    controllerMatrix3x3Cell12.clear();
    controllerMatrix3x3Cell13.clear();
    controllerMatrix3x3Cell21.clear();
    controllerMatrix3x3Cell22.clear();
    controllerMatrix3x3Cell23.clear();
    controllerMatrix3x3Cell31.clear();
    controllerMatrix3x3Cell32.clear();
    controllerMatrix3x3Cell33.clear();
  }

  getMatrixData() async {
    final prefs = await SharedPreferences.getInstance();

    data3x3_11 = prefs.getInt('matrixCell11');
    data3x3_12 = prefs.getInt('matrixCell12');
    data3x3_13 = prefs.getInt('matrixCell13');
    data3x3_21 = prefs.getInt('matrixCell21');
    data3x3_22 = prefs.getInt('matrixCell22');
    data3x3_23 = prefs.getInt('matrixCell23');
    data3x3_31 = prefs.getInt('matrixCell31');
    data3x3_32 = prefs.getInt('matrixCell32');
    data3x3_33 = prefs.getInt('matrixCell33');
  }

  editMatrix() {
    wasTheSaveButtonPressed(false);

    setState(() {
      showingMatrix = !showingMatrix;
    });
  }

  wasTheSaveButtonPressed(bool wasPressed) {
    if(wasPressed) {
      boolWasTheSaveButtonPressed3x3 = true;
    } else {
      boolWasTheSaveButtonPressed3x3 = false;
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
                padding: EdgeInsets.all(5),
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
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
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
                  fontWeight: FontWeight.w600,
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/bracket1.png", 
                  height: mediaQuerySize.setTextFieldSize(deviceScreenWidth)*3.3,
                  color: Color(0xFF0e0e0e),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        MatrixTextField(
                          deviceWidth: deviceScreenWidth,
                          textFieldMargin: EdgeInsets.all(2),
                          textFieldController: controllerMatrix3x3Cell11,
                        ),
                        MatrixTextField(
                          deviceWidth: deviceScreenWidth,
                          textFieldMargin: EdgeInsets.all(2),
                          textFieldController: controllerMatrix3x3Cell12,
                        ),
                        MatrixTextField(
                          deviceWidth: deviceScreenWidth,
                          textFieldMargin: EdgeInsets.all(2),
                          textFieldController: controllerMatrix3x3Cell13,
                        ),
                      ]
                    ),
                    Row(
                      children: [
                        MatrixTextField(
                          deviceWidth: deviceScreenWidth,
                          textFieldMargin: EdgeInsets.all(2),
                          textFieldController: controllerMatrix3x3Cell21,
                        ),
                        MatrixTextField(
                          deviceWidth: deviceScreenWidth,
                          textFieldMargin: EdgeInsets.all(2),
                          textFieldController: controllerMatrix3x3Cell22,
                        ),
                        MatrixTextField(
                          deviceWidth: deviceScreenWidth,
                          textFieldMargin: EdgeInsets.all(2),
                          textFieldController: controllerMatrix3x3Cell23,
                        ),
                      ]
                    ),
                    Row(
                      children: [
                        MatrixTextField(
                          deviceWidth: deviceScreenWidth,
                          textFieldMargin: EdgeInsets.all(2),
                          textFieldController: controllerMatrix3x3Cell31,
                        ),
                        MatrixTextField(
                          deviceWidth: deviceScreenWidth,
                          textFieldMargin: EdgeInsets.all(2),
                          textFieldController: controllerMatrix3x3Cell32,
                        ),
                        MatrixTextField(
                          deviceWidth: deviceScreenWidth,
                          textFieldMargin: EdgeInsets.all(2),
                          textFieldController: controllerMatrix3x3Cell33,
                        ),
                      ]
                    ),
                  ]
                ),
                Image.asset(
                  "images/bracket2.png",
                  height: mediaQuerySize.setTextFieldSize(deviceScreenWidth)*3.3,
                  color: Color(0xFF0e0e0e),
                ),
              ]
            ),
        ),
          buttons()
        ]
      );
    } else {
      return Column(
        children: [
          ShowingMatrix(
            isOrderMatrix2: false,
            showDecimalNumbers: false,
            deviceWidth: deviceScreenWidth,
            cell11: data3x3_11.toString(),
            cell12: data3x3_12.toString(),
            cell13: data3x3_13.toString(),
            cell21: data3x3_21.toString(),
            cell22: data3x3_22.toString(),
            cell23: data3x3_23.toString(),
            cell31: data3x3_31.toString(),
            cell32: data3x3_32.toString(),
            cell33: data3x3_33.toString(),
          ),
          editButton(deviceScreenWidth),
        ],
      );
    }      
  } 
}