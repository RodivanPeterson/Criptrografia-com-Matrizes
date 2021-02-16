import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/showingMatrix.dart';
import '../mediaQuerySize.dart';
import '../widgets/showMainMatrix2.dart';
import '../cryptography.dart';
import 'package:flutter/services.dart';

class ScreenToCodeMessage extends StatefulWidget {
  @override
  _ScreenToCodeMessageState createState() => _ScreenToCodeMessageState();
}

class _ScreenToCodeMessageState extends State<ScreenToCodeMessage> {

  TextEditingController _controllerPrimitiveMessage = TextEditingController();
  Color _backgroundColor = Color(0xFF0F9B8E).withOpacity(0.0);
  Color textColor = Colors.white70.withOpacity(0.0);
  List<String> copyTextShowingEncodedMessage = [];
  var titleTextShowingEncodedMessage = " ";
  var textShowingEncodedMessage = " ";
  bool wasCodeButtonPressed = false;
  Widget matrixOption = Container();
  int _dropdownOption;

  MediaQuerySize mediaQuerySize = MediaQuerySize();
  Cryptography cryptography = Cryptography();
  
  switchMatrices() async {
    cryptography.getMatrixDataToCode();
    
    final prefs = await SharedPreferences.getInstance();
    int dropdownValue = prefs.getInt('dropdownButtonValue');
    
    if(dropdownValue == 1) {
      setState(() {
        matrixOption = ShowingMatrix(
          isOrderMatrix2: true,
          showDecimalNumbers: false,
          deviceWidth: deviceScreenWidth,
          cell11: prefs.getInt('matrixCell11').toString(),
          cell12: prefs.getInt('matrixCell12').toString(),
          cell21: prefs.getInt('matrixCell21').toString(),
          cell22: prefs.getInt('matrixCell22').toString(),
        );
      });
    } else {
      setState(() {
        matrixOption = ShowingMatrix(
          isOrderMatrix2: false,
          showDecimalNumbers: false,
          deviceWidth: deviceScreenWidth,
          cell11: prefs.getInt('matrixCell11').toString(),
          cell12: prefs.getInt('matrixCell12').toString(),
          cell13: prefs.getInt('matrixCell13').toString(),
          cell21: prefs.getInt('matrixCell21').toString(),
          cell22: prefs.getInt('matrixCell22').toString(),
          cell23: prefs.getInt('matrixCell23').toString(),
          cell31: prefs.getInt('matrixCell31').toString(),
          cell32: prefs.getInt('matrixCell32').toString(),
          cell33: prefs.getInt('matrixCell33').toString(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    double deviceData = MediaQuery.of(context).size.width;

    updateElements(line1, line2, length, [line3 = 440]){

      wasCodeButtonPressed = true;

      setState(() {
      int b;
      copyTextShowingEncodedMessage.clear();
      textShowingEncodedMessage = null;
        
      for(b = 0; b < length; b++) {
        copyTextShowingEncodedMessage.insert(b, line1[b].toString());
      }
      for(b = 0; b < length; b++) {
        int number = b + length;
        copyTextShowingEncodedMessage.insert(number, line2[b].toString());
      }

      if(line3 != 440) {
        for(b = 0; b < length; b++) {
          int number = length*2 + b;
          copyTextShowingEncodedMessage.insert(number, line3[b].toString());
        }
      }

      textColor = Colors.white70.withOpacity(0.9);
      _backgroundColor = Color(0xFF0f0f0f);

      titleTextShowingEncodedMessage = "Mensagem codificada: ";
      if(line3 == 440) {
        textShowingEncodedMessage = line1.toString() + "\n" + line2.toString();
      } else {
        textShowingEncodedMessage = line1.toString() + "\n" + line2.toString() + "\n" + line3.toString();
      }
      });
    }

    invalidUpdateElements(){

      setState(() {

      textColor = Color(0xFF16c878);

      titleTextShowingEncodedMessage = "Menssagem inválida!\nTente novamente.";
      textShowingEncodedMessage = " ";
      });
    }
    
    getDataToClipBoard() async{
      ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
      setState(() {
        _controllerPrimitiveMessage.text = data.text;
      });
    } 

    getDropdownOption() async {
      final prefs = await SharedPreferences.getInstance();
      _dropdownOption = prefs.getInt('dropdownButtonValue');
    }

    switchMatrices();
    cryptography.getDropdownOptionCryptography();
    getDropdownOption();

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
                Color(0xFF0f0f0f),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Matriz que usaremos para codificar a mensagem",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Orbitron',
                      letterSpacing: 1.0,
                      fontSize: mediaQuerySize.setFontSize(deviceScreenWidth)*0.55,
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
                    onChanged: (text){
                      wasCodeButtonPressed = false;
                    },
                    toolbarOptions: ToolbarOptions(copy: true, selectAll: true, paste: true, cut: true),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.paste_rounded,
                          color: Colors.white,
                        ),
                        onPressed: ()=> getDataToClipBoard()
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF0f0f0f),
                            width: mediaQuerySize.setBorderWidth(deviceData)*0.5,
                            style: BorderStyle.solid,
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
                      labelText: "Digite a mensagem",
                      labelStyle: TextStyle(
                        fontFamily: 'Orbitron',
                        letterSpacing: 1.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: 'Orbitron',
                      letterSpacing: 1.5,
                      fontSize: mediaQuerySize.setFontSize(deviceData)*0.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),
                    controller: _controllerPrimitiveMessage,
                    keyboardType: TextInputType.multiline,
                  ),
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
                      ),
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
                      "Codificar",
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
                    onPressed: (){
                      if(_controllerPrimitiveMessage.text.isEmpty){
                        invalidUpdateElements();
                      } else {
                        cryptography.codeMessage(_controllerPrimitiveMessage.text);
                        if(_dropdownOption == 1) {
                          updateElements(
                            cryptography.firstPartOfTheEncodedMessageString,
                            cryptography.secondPartOfTheEncodedMessageString,
                            cryptography.halfLength
                          );
                        } else {
                          updateElements(
                            cryptography.firstPartOfTheEncodedMessageString,
                            cryptography.secondPartOfTheEncodedMessageString,
                            cryptography.thirdLength,
                            cryptography.thirdPartOfTheEncodedMessageString,
                          );
                        }
                      }
                    }
                  )
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 7),
                  child: Text(
                    titleTextShowingEncodedMessage,
                    textAlign: TextAlign.justify,
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
                    width: mediaQuerySize.setFontSize(deviceData)*4,
                    height: mediaQuerySize.setFontSize(deviceData),
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
                      child: Container(
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
                                  'Pressione "Codificar" para continuar.',
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
                          } else {
                            Clipboard.setData(new ClipboardData(text: copyTextShowingEncodedMessage.toString()));
                            return Scaffold.of(_context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Código copiado com sucesso!',
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
                        }
                      }
                    ),
                  )
                ),
                Container(
                  width: deviceData*0.6,
                  height: deviceData >= 788.0 ? 50.0 : deviceData*0.05,
                )
              ]
            )
          )
        ),
      ),
    );
  }
}