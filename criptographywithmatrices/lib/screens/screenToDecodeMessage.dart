import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:windowsteste/mediaQuerySize.dart';
import '../widgets/showingMatrix.dart';
import '../cryptography.dart';
import 'package:flutter/services.dart';

String inverseData11 = ' ';
String inverseData12 = ' ';
String inverseData13 = ' ';
String inverseData21 = ' ';
String inverseData22 = ' ';
String inverseData23 = ' ';
String inverseData31 = ' ';
String inverseData32 = ' ';
String inverseData33 = ' ';
int _dropdownButtonValue;
Widget matrixOption = Container();
double deviceScreenWidth;

class ScreenToDecodeMessage extends StatefulWidget {
  @override
  _ScreenToDecodeMessageState createState() => _ScreenToDecodeMessageState();

  setInverseMatrix() async {

    double inverse11;
    double inverse12;
    double inverse13;
    double inverse21;
    double inverse22;
    double inverse23;
    double inverse31;
    double inverse32;
    double inverse33;
    int number11;
    int number12;
    int number13;
    int number21;
    int number22;
    int number23;
    int number31;
    int number32;
    int number33;

    final prefs = await SharedPreferences.getInstance();
    _dropdownButtonValue = prefs.getInt('dropdownButtonValue');
    int determinant;

    if(_dropdownButtonValue == 2) {
      number13 = prefs.getInt('matrixCell13');
      number23 = prefs.getInt('matrixCell23');
      number31 = prefs.getInt('matrixCell31');
      number32 = prefs.getInt('matrixCell32');
      number33 = prefs.getInt('matrixCell33');
    }
    number11 = prefs.getInt('matrixCell11');
    number12 = prefs.getInt('matrixCell12');
    number21 = prefs.getInt('matrixCell21');
    number22 = prefs.getInt('matrixCell22');

    if(_dropdownButtonValue == 1) {
      determinant = (number11*number22) - (number12*number21);

      inverse11 = number22/determinant;
      inverse12 = -(number12/determinant);
      inverse21 = -(number21/determinant);
      inverse22 = number11/determinant;

    } else {
      determinant = (number11*number22*number33 + number12*number23*number31 + number13*number21*number32) - 
      (number13*number22*number31 + number11*number23*number32 + number12*number21*number33);

      inverse11 = ((number22*number33) - (number23*number32)) / determinant;
      inverse12 = ((number32*number13) - (number33*number12)) / determinant;
      inverse13 = ((number12*number23) - (number22*number13)) / determinant;
      inverse21 = ((number31*number23) - (number33*number21)) / determinant;
      inverse22 = ((number33*number11) - (number31*number13)) / determinant;
      inverse23 = ((number21*number13) - (number23*number11)) / determinant;
      inverse31 = ((number21*number32) - (number22*number31)) / determinant;
      inverse32 = ((number31*number12) - (number11*number32)) / determinant;
      inverse33 = ((number22*number11) - (number12*number21)) / determinant;

      inverseData13 = inverse13.toStringAsPrecision(5);
      inverseData23 = inverse23.toStringAsPrecision(5);
      inverseData31 = inverse31.toStringAsPrecision(5);
      inverseData32 = inverse32.toStringAsPrecision(5);
      inverseData33 = inverse33.toStringAsPrecision(5);

      await prefs.setString('inverseMatrixCell13', inverseData13);
      await prefs.setString('inverseMatrixCell23', inverseData23);
      await prefs.setString('inverseMatrixCell31', inverseData31);
      await prefs.setString('inverseMatrixCell32', inverseData32);
      await prefs.setString('inverseMatrixCell33', inverseData33);
    }
    inverseData11 = inverse11.toStringAsPrecision(5);
    inverseData12 = inverse12.toStringAsPrecision(5);
    inverseData21 = inverse21.toStringAsPrecision(5);
    inverseData22 = inverse22.toStringAsPrecision(5);

    await prefs.setString('inverseMatrixCell11', inverseData11);
    await prefs.setString('inverseMatrixCell12', inverseData12);
    await prefs.setString('inverseMatrixCell21', inverseData21);
    await prefs.setString('inverseMatrixCell22', inverseData22);

    deviceScreenWidth = prefs.getDouble('deviceWidth');
  }

  transfomDecimalToFractionForm() async {

    final prefs = await SharedPreferences.getInstance();
    final bool isOrderMatrix3 = (prefs.getInt('dropdownButtonValue')) == 2;

    double decimalNumber13;
    double decimalNumber23;
    double decimalNumber31;
    double decimalNumber32;
    double decimalNumber33;
    var stringDecimalNumber13;
    var stringDecimalNumber23;
    var stringDecimalNumber31;
    var stringDecimalNumber32;
    var stringDecimalNumber33;
    int numerator13;
    int numerator23;
    int numerator31;
    int numerator32;
    int numerator33;
    int denominator13;
    int denominator23;
    int denominator31;
    int denominator32;
    int denominator33;

    double decimalNumber11 = double.tryParse(prefs.getString('inverseMatrixCell11'));
    double decimalNumber12 = double.tryParse(prefs.getString('inverseMatrixCell12'));
    double decimalNumber21 = double.tryParse(prefs.getString('inverseMatrixCell21'));
    double decimalNumber22 = double.tryParse(prefs.getString('inverseMatrixCell22'));

    if(isOrderMatrix3) {
      decimalNumber13 = double.tryParse(prefs.getString('inverseMatrixCell13'));
      decimalNumber23 = double.tryParse(prefs.getString('inverseMatrixCell23'));
      decimalNumber31 = double.tryParse(prefs.getString('inverseMatrixCell31'));
      decimalNumber32 = double.tryParse(prefs.getString('inverseMatrixCell32'));
      decimalNumber33 = double.tryParse(prefs.getString('inverseMatrixCell33'));
    }

    var stringDecimalNumber11 = decimalNumber11.toString().split('.');
    var stringDecimalNumber12 = decimalNumber12.toString().split('.');
    var stringDecimalNumber21 = decimalNumber21.toString().split('.');
    var stringDecimalNumber22 = decimalNumber22.toString().split('.');

    if(isOrderMatrix3) {
      stringDecimalNumber13 = decimalNumber13.toString().split('.');
      stringDecimalNumber23 = decimalNumber23.toString().split('.');
      stringDecimalNumber31 = decimalNumber31.toString().split('.');
      stringDecimalNumber32 = decimalNumber32.toString().split('.');
      stringDecimalNumber33 = decimalNumber33.toString().split('.');
    }

    int numerator11 = (decimalNumber11 * pow(10.0, stringDecimalNumber11[1].length)).round();
    int numerator12 = (decimalNumber12 * pow(10.0, stringDecimalNumber12[1].length)).round();
    int numerator21 = (decimalNumber21 * pow(10.0, stringDecimalNumber21[1].length)).round();
    int numerator22 = (decimalNumber22 * pow(10.0, stringDecimalNumber22[1].length)).round();

    if(isOrderMatrix3) {
      numerator13 = (decimalNumber13 * pow(10.0, stringDecimalNumber13[1].length)).round();
      numerator23 = (decimalNumber23 * pow(10.0, stringDecimalNumber23[1].length)).round();
      numerator31 = (decimalNumber31 * pow(10.0, stringDecimalNumber31[1].length)).round();
      numerator32 = (decimalNumber32 * pow(10.0, stringDecimalNumber32[1].length)).round();
      numerator33 = (decimalNumber33 * pow(10.0, stringDecimalNumber33[1].length)).round();
    }

    int denominator11 = pow(10, stringDecimalNumber11[1].length);
    int denominator12 = pow(10, stringDecimalNumber12[1].length);
    int denominator21 = pow(10, stringDecimalNumber21[1].length);
    int denominator22 = pow(10, stringDecimalNumber22[1].length);

    if(isOrderMatrix3) {
      denominator13 = pow(10, stringDecimalNumber13[1].length);
      denominator23 = pow(10, stringDecimalNumber23[1].length);
      denominator31 = pow(10, stringDecimalNumber31[1].length);
      denominator32 = pow(10, stringDecimalNumber32[1].length);
      denominator33 = pow(10, stringDecimalNumber33[1].length);
    }

    reducting(int numeratorParam, int denominatorParam, int index){
      int numeratorP = numeratorParam;
      int denominatorP = denominatorParam;

      if(numeratorP % denominatorP == 0) {
        switch (index) {
          case 11:
            numerator11 ~/= denominator11;
            denominator11 = 1;
            break;
          case 12:
            numerator12 ~/= denominator12;
            denominator12 = 1;
            break;
          case 13:
            numerator13 ~/= denominator13;
            denominator13 = 1;
            break;
          case 21:
            numerator21 ~/= denominator21;
            denominator21 = 1;
            break;
          case 22:
            numerator22 ~/= denominator22;
            denominator22 = 1;
            break;
          case 23:
            numerator23 ~/= denominator23;
            denominator23 = 1;
            break;
          case 31:
            numerator31 ~/= denominator31;
            denominator31 = 1;
            break;
          case 32:
            numerator32 ~/= denominator32;
            denominator32 = 1;
            break;
          case 33:
            numerator33 ~/= denominator33;
            denominator33 = 1;
            break;
          default:
        }
      } else {

        for(var i = 10; i > 1; i--) {
          if(numeratorP % i == 0 && denominatorP % i == 0) {
            while(numeratorP % i == 0 && denominatorP % i == 0) {

              numeratorP ~/= i;
              denominatorP ~/= i;

              switch (index) {
                case 11:
                  numerator11 ~/= i;
                  denominator11 ~/= i;
                  break;
                case 12:
                  numerator12 ~/= i;
                  denominator12 ~/= i;
                  break;
                case 13:
                  numerator13 ~/= i;
                  denominator13 ~/= i;
                  break;
                case 21:
                  numerator21 ~/= i;
                  denominator21 ~/= i;
                  break;
                case 22:
                  numerator22 ~/= i;
                  denominator22 ~/= i;
                  break;
                case 23:
                  numerator23 ~/= i;
                  denominator23 ~/= i;
                  break;
                case 31:
                  numerator31 ~/= i;
                  denominator31 ~/= i;
                  break;
                case 32:
                  numerator32 ~/= i;
                  denominator32 ~/= i;
                  break;
                case 33:
                  numerator33 ~/= i;
                  denominator33 ~/= i;
                  break;
                default:
              }
            }
          }
        }
      }
    }
    reducting(numerator11, denominator11, 11);
    reducting(numerator12, denominator12, 12);
    reducting(numerator21, denominator21, 21);
    reducting(numerator22, denominator22, 22);
    if(isOrderMatrix3) {
      reducting(numerator13, denominator13, 13);
      reducting(numerator23, denominator23, 23);
      reducting(numerator31, denominator31, 31);
      reducting(numerator32, denominator32, 32);
      reducting(numerator33, denominator33, 33);
    }

    await prefs.setString('matrixCell11Numerator', numerator11.toString());
    await prefs.setString('matrixCell11Denominator', denominator11.toString());
    await prefs.setString('matrixCell12Numerator', numerator12.toString());
    await prefs.setString('matrixCell12Denominator', denominator12.toString());
    await prefs.setString('matrixCell21Numerator', numerator21.toString());
    await prefs.setString('matrixCell21Denominator', denominator21.toString());
    await prefs.setString('matrixCell22Numerator', numerator22.toString());
    await prefs.setString('matrixCell22Denominator', denominator22.toString());

    if(isOrderMatrix3) {
      await prefs.setString('matrixCell13Numerator', numerator13.toString());
      await prefs.setString('matrixCell13Denominator', denominator13.toString());
      await prefs.setString('matrixCell23Numerator', numerator23.toString());
      await prefs.setString('matrixCell23Denominator', denominator23.toString());
      await prefs.setString('matrixCell31Numerator', numerator31.toString());
      await prefs.setString('matrixCell31Denominator', denominator31.toString());
      await prefs.setString('matrixCell32Numerator', numerator32.toString());
      await prefs.setString('matrixCell32Denominator', denominator32.toString());
      await prefs.setString('matrixCell33Numerator', numerator33.toString());
      await prefs.setString('matrixCell33Denominator', denominator33.toString());
    }
  }
}

class _ScreenToDecodeMessageState extends State<ScreenToDecodeMessage> {
  
  Color textColor = Colors.white70.withOpacity(0.0);
  Color _backgroundColor = Color(0xFF0F9B8E).withOpacity(0.0);
  var textShowingEncodedMessage = " ";
  var titleTextShowingEncodedMessage = " ";
  List<String> copyTextShowingEncodedMessage = [];
  TextEditingController _controllerPrimitiveMessage = TextEditingController();
  bool wasCodeButtonPressed = false;
  var inicialText = " ";
  List<String> exempleHintText = [];
  Cryptography cryptography = Cryptography();
  int _dropdownOption;
  
  @override
  Widget build(BuildContext context) {

    double deviceData = MediaQuery.of(context).size.width;
    MediaQuerySize mediaQuerySize = MediaQuerySize();

    switchMatrices1() async {
      
      final prefs = await SharedPreferences.getInstance();
      int dropdownValue = prefs.getInt('dropdownButtonValue') == null ? 1 : prefs.getInt('dropdownButtonValue');
      bool showDecimalNumbers = prefs.getBool('switchValueDecimalNumbers') == null ? false : prefs.getBool('switchValueDecimalNumbers');

      if(showDecimalNumbers) {

        if(dropdownValue == 1) {

          String _data11 = prefs.getString('inverseMatrixCell11');
          String _data12 = prefs.getString('inverseMatrixCell12');
          String _data21 = prefs.getString('inverseMatrixCell21');
          String _data22 = prefs.getString('inverseMatrixCell22');

          setState(() {
            matrixOption = ShowingMatrix(
              isOrderMatrix2: true,
              showDecimalNumbers: true,
              deviceWidth: deviceData,
              cell11: _data11,
              cell12: _data12,
              cell21: _data21,
              cell22: _data22,
              reduceTheFontSize: 0.5,
            );
          });
        } else {

          String _data11 = prefs.getString('inverseMatrixCell11');
          String _data12 = prefs.getString('inverseMatrixCell12');
          String _data13 = prefs.getString('inverseMatrixCell13');
          String _data21 = prefs.getString('inverseMatrixCell21');
          String _data22 = prefs.getString('inverseMatrixCell22');
          String _data23 = prefs.getString('inverseMatrixCell23');
          String _data31 = prefs.getString('inverseMatrixCell31');
          String _data32 = prefs.getString('inverseMatrixCell32');
          String _data33 = prefs.getString('inverseMatrixCell33');

          setState(() {
            matrixOption = ShowingMatrix(
              isOrderMatrix2: false,
              showDecimalNumbers: true,
              deviceWidth: deviceData,
              cell11: _data11,
              cell12: _data12,
              cell13: _data13,
              cell21: _data21,
              cell22: _data22,
              cell23: _data23,
              cell31: _data31,
              cell32: _data32,
              cell33: _data33,
              reduceTheFontSize: 0.5,
            );
          });
        }
      } else {
        String numerator11 = prefs.getString('matrixCell11Numerator');
        String denominator11 = prefs.getString('matrixCell11Denominator');
        String numerator12 = prefs.getString('matrixCell12Numerator');
        String denominator12 = prefs.getString('matrixCell12Denominator');
        String numerator21 = prefs.getString('matrixCell21Numerator');
        String denominator21 = prefs.getString('matrixCell21Denominator');
        String numerator22 = prefs.getString('matrixCell22Numerator');
        String denominator22 = prefs.getString('matrixCell22Denominator');
        
        if(dropdownValue == 1) {
          setState(() {
            matrixOption = ShowingMatrix(
              isOrderMatrix2: true,
              showDecimalNumbers: false,
              deviceWidth: deviceData,
              cell11: numerator11,
              cell12: numerator12,
              cell21: numerator21,
              cell22: numerator22,
              cellD11: denominator11,
              cellD12: denominator12,
              cellD21: denominator21,
              cellD22: denominator22,
              reduceTheFontSize: 0.5,
            );
          });
        } else {
          String numerator13 = prefs.getString('matrixCell13Numerator');
          String denominator13 = prefs.getString('matrixCell13Denominator');
          String numerator23 = prefs.getString('matrixCell23Numerator');
          String denominator23 = prefs.getString('matrixCell23Denominator');
          String numerator31 = prefs.getString('matrixCell31Numerator');
          String denominator31 = prefs.getString('matrixCell31Denominator');
          String numerator32 = prefs.getString('matrixCell32Numerator');
          String denominator32 = prefs.getString('matrixCell32Denominator');
          String numerator33 = prefs.getString('matrixCell33Numerator');
          String denominator33 = prefs.getString('matrixCell33Denominator');

          setState(() {
            matrixOption = ShowingMatrix(
              showDecimalNumbers: false,
              isOrderMatrix2: false,
              deviceWidth: deviceData,
              cell11: numerator11,
              cell12: numerator12,
              cell13: numerator13,
              cell21: numerator21,
              cell22: numerator22,
              cell23: numerator23,
              cell31: numerator31,
              cell32: numerator32,
              cell33: numerator33,
              cellD11: denominator11,
              cellD12: denominator12,
              cellD13: denominator13,
              cellD21: denominator21,
              cellD22: denominator22,
              cellD23: denominator23,
              cellD31: denominator31,
              cellD32: denominator32,
              cellD33: denominator33,
              reduceTheFontSize: 0.5,
            );
          });
        }
      }
    }

    updateElements(line1, line2, length, [line3 = 440]){

      wasCodeButtonPressed = true;

      setState(() {
        int b;
          
        copyTextShowingEncodedMessage.clear();

        for(b = 0; b < length; b++) {
          copyTextShowingEncodedMessage.insert(b, line1[b].toString());
        }
        for(b = 0; b < length; b++) {
          int number = b + length;
          copyTextShowingEncodedMessage.insert(number, line2[b].toString());
        }
        if(line3 != 440) {
          for(b = 0; b < length; b++) {
            int number = b + (length*2);
            copyTextShowingEncodedMessage.insert(number, line3[b].toString());
          }
        }
        
        textColor = Colors.white70.withOpacity(0.9);
        _backgroundColor = Color(0xFF0f0f0f);
        
        inicialText = copyTextShowingEncodedMessage.join().toString();

        titleTextShowingEncodedMessage = "Mensagem decodificada:\n";
        textShowingEncodedMessage = (copyTextShowingEncodedMessage.join()).toString();
      });
    }

    invalidUpdateElements(){

      setState(() {

      textColor = Color(0xFF16c878);
      inicialText = "";

      titleTextShowingEncodedMessage = "Código inválido!\nTente novamente.";
      textShowingEncodedMessage = " ";
      });
    }

    getDataFromClipBoard() async{
      ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
      setState(() {
        _controllerPrimitiveMessage.text = data.text;
      });
    }

    getDropdownOption() async {
      final prefs = await SharedPreferences.getInstance();
      _dropdownOption = prefs.getInt('dropdownButtonValue');
    }
    
    getDropdownOption();
    switchMatrices1();
    cryptography.getMatrixDataToDecode();
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0f0f0f),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Builder(
        builder: (_context) => Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF343837),
                Color(0xFF0f0f0f/*1B2431*/),
              ],
              //stops: [0.5, 1.0],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Matriz que usaremos para decodificar a mensagem",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Orbitron',
                      letterSpacing: 1.0,
                      fontSize: mediaQuerySize.setFontSize(deviceData)*0.55,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    )
                  ),
                ),
                matrixOption,
                Container(
                  padding: mediaQuerySize.setPadding(deviceData),
                  constraints: BoxConstraints(
                    maxWidth: 1000.0,
                  ),
                  child: TextField(
                    maxLines: null,
                    onChanged: (_)=> {
                      wasCodeButtonPressed = false
                    },
                    toolbarOptions: ToolbarOptions(copy: true, selectAll: true, paste: true, cut: true),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.paste_rounded,
                          color: Colors.white,
                        ),
                        onPressed: ()=> getDataFromClipBoard()
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF0f0f0f),
                            width: mediaQuerySize.setBorderWidth(deviceData)*0.5,
                            style: BorderStyle.solid
                          ),
                      ),
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF16c878).withOpacity(0.7),
                            width: mediaQuerySize.setBorderWidth(deviceData)*0.7,
                            style: BorderStyle.solid
                          ),
                      ),
                      labelText: "Digite o código",
                      labelStyle: TextStyle(
                        fontFamily: 'Orbitron',
                        letterSpacing: 1.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400
                      ),
                      hintText: 'Ex: [15,2,179,47]',
                      hintStyle: TextStyle(
                        fontFamily: 'Orbitron',
                        letterSpacing: 1.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: 'Orbitron',
                      letterSpacing: 1.0,
                      fontSize: mediaQuerySize.setFontSize(deviceData)*0.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),
                    controller: _controllerPrimitiveMessage,
                    keyboardType: TextInputType.multiline,
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: mediaQuerySize.setFontSize(deviceData)*5.0,
                  height: mediaQuerySize.setFontSize(deviceData)*1.1,
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
                    //splashColor: Color(0xFF16c878),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0f0f0f),
                      shadowColor: Color(0xFF16c878),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)
                      ),
                    ),
                    child: Text(
                      "Decodificar",
                      style: TextStyle(
                        fontFamily: 'Orbitron',
                        letterSpacing: 1.0,
                        fontSize: mediaQuerySize.setFontSize(deviceData)*0.45,
                        color: Colors.white,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                    onPressed: ()=> {
                      if(_controllerPrimitiveMessage.text.isEmpty){
                        invalidUpdateElements()
                      } else {
                        getDropdownOption(),
                        cryptography.decodeMessage(_controllerPrimitiveMessage.text),
                        if(_dropdownOption == 1) {
                          updateElements(
                            cryptography.stringfirstPartEncoded,
                            cryptography.stringsecondPartEncoded,
                            cryptography.halfLength
                          )
                        } else {
                          updateElements(
                            cryptography.stringfirstPartEncoded,
                            cryptography.stringsecondPartEncoded,
                            cryptography.thirdLength,
                            cryptography.stringthirdPartEncoded,
                          )
                        }
                      }
                    }
                  )
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text(
                    titleTextShowingEncodedMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Orbitron',
                      letterSpacing: 1.0,
                      fontSize: mediaQuerySize.setFontSize(deviceData)*0.55,
                      color: textColor,
                      fontWeight: FontWeight.w600
                    )
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: _backgroundColor,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    padding: EdgeInsets.all(5),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            textShowingEncodedMessage,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Orbitron',
                              letterSpacing: 1.0,
                              fontSize: mediaQuerySize.setFontSize(deviceData)*0.55,
                              color: textColor,
                              fontWeight: FontWeight.w600
                            )
                          )
                        ]
                      )
                    )
                  )
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: mediaQuerySize.setFontSize(deviceData)*5.0,
                    height: mediaQuerySize.setFontSize(deviceData)*1.1,
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0)
                        ),
                      ),
                      child: Text(
                        "Copiar",
                        style: TextStyle(
                          fontFamily: 'Orbitron',
                          letterSpacing: 1.0,
                          fontSize: mediaQuerySize.setFontSize(deviceData)*0.45,
                          fontWeight: FontWeight.w900,
                          color: Colors.white
                        ),
                      ),
                      onPressed: (){
                        if((_controllerPrimitiveMessage.text.isEmpty && !wasCodeButtonPressed) || _controllerPrimitiveMessage.text.isEmpty) {
                          return Scaffold.of(_context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Não há o que copiar!',
                                style: TextStyle(
                                  fontFamily: 'Orbitron',
                                  letterSpacing: 1.0,
                                  fontSize: mediaQuerySize.setFontSize(deviceData)*0.5,
                                  color: Color(0xFF0f0f0f),
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              backgroundColor: Color(0xFF16c878),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
                            )
                          );
                        }
                        else {
                          if(!wasCodeButtonPressed) {
                            return Scaffold.of(_context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Pressione "Decodificar" para continuar.',
                                  style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontSize: mediaQuerySize.setFontSize(deviceData)*0.5,
                                    color: Color(0xFF0f0f0f),
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                                backgroundColor: Color(0xFF16c878),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
                              )
                            );
                          } else {
                            Clipboard.setData(new ClipboardData(text: copyTextShowingEncodedMessage.join('').toString()));
                            return Scaffold.of(_context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Código copiado com sucesso!',
                                  style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontSize: mediaQuerySize.setFontSize(deviceData)*0.5,
                                    color: Color(0xFF0f0f0f),
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                backgroundColor: Color(0xFF16c878),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
                              ),
                            );
                          }
                        }
                      }//Bug 2 - Só é possivel copiar uma vez para a área de transferência ++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
                    ),
                  )
                )
              ]
            )
          )
        ),
      )
    );
  }
}