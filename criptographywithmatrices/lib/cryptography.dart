import 'package:windowsteste/switchCase.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cryptography {

  int halfLength;
  int thirdLength;
  List<int> intfirstPartEncoded = [];
  List<int> intsecondPartEncoded = [];
  List<int> intthirdPartEncoded = [];
  List stringfirstPartEncoded = [];
  List stringsecondPartEncoded = [];
  List stringthirdPartEncoded = [];
  List<int> firstPartOfTheEncodedMessage = [];
  List<int> secondPartOfTheEncodedMessage = [];
  List<int> thirdPartOfTheEncodedMessage = [];
  List<double> doublefirstPartOfTheEncodedMessage = [];
  List<double> doublesecondPartOfTheEncodedMessage = [];
  List<double> doublethirdPartOfTheEncodedMessage = [];
  List<String> firstPartOfTheEncodedMessageString = [];
  List<String> secondPartOfTheEncodedMessageString = [];
  List<String> thirdPartOfTheEncodedMessageString = [];
  NumberFormat numberFormatter = NumberFormat("000");
  List listOfElementesFromController = [];
  List<int> messageInCode = [];
  int _data11;
  int _data12;
  int _data13;
  int _data21;
  int _data22;
  int _data23;
  int _data31;
  int _data32;
  int _data33;
  int _dropdownValueCryptography;

  getDropdownOptionCryptography() async {
    final prefs = await SharedPreferences.getInstance();
    this._dropdownValueCryptography = prefs.getInt('dropdownButtonValue');
  }

  getMatrixDataToCode() async {
    final prefs = await SharedPreferences.getInstance();
    
    if(this._dropdownValueCryptography == 2) {
      _data13 = prefs.getInt('matrixCell13');
      _data23 = prefs.getInt('matrixCell23');
      _data31 = prefs.getInt('matrixCell31');
      _data32 = prefs.getInt('matrixCell32');
      _data33 = prefs.getInt('matrixCell33');
    } 
    _data11 = prefs.getInt('matrixCell11');
    _data12 = prefs.getInt('matrixCell12');
    _data21 = prefs.getInt('matrixCell21');
    _data22 = prefs.getInt('matrixCell22');

  }

  setHalfLengthToString(textController)
  {  
    var stringText = textController;

    listOfElementesFromController.clear();
    
    for (var b = 0; b < stringText.length; b++)
    {
      listOfElementesFromController.insert(b, stringText[b]);
    }

    if (stringText.length % 2 != 0)
    {
      listOfElementesFromController.add(" ");
    }
    else {}

    halfLength = listOfElementesFromController.length~/2;
  }

  setThirdLengthToString(textController)
  {  
    var stringText = textController;

    listOfElementesFromController.clear();
    
    for (var b = 0; b < stringText.length; b++)
    {
      listOfElementesFromController.insert(b, stringText[b]);
    }
    
    while (listOfElementesFromController.length % 3 != 0) {
      listOfElementesFromController.add(" ");
    }

    thirdLength = listOfElementesFromController.length~/3;
  }


  codeMessage(textFromController)
  {
    List stringTextFromController = [];
    List<String> firstPart = [];
    List<String> secondPart = [];
    List<String> thirdPart = [];
    int b = 0;
    int number = 0;
    int number1 = 0;
    var stringText = textFromController;

    if(this._dropdownValueCryptography == 1) {
      setHalfLengthToString(stringText);
    } else {
      setThirdLengthToString(stringText);
    }

    for (var b = 0; b < listOfElementesFromController.length; b++) {
      stringTextFromController.insert(b, listOfElementesFromController[b].toString());
    }
    if(this._dropdownValueCryptography == 1) {
      for (b = 0; b < halfLength; b++) {
        number = halfLength + b;

        firstPart.insert(b, stringTextFromController[b]);
        secondPart.insert(b, stringTextFromController[number]);
      }
    } else {
      for (b = 0; b < thirdLength; b++) {
        number = thirdLength + b;
        number1 = (thirdLength*2) + b;


        firstPart.insert(b, stringTextFromController[b]);
        secondPart.insert(b, stringTextFromController[number]);
        thirdPart.insert(b, stringTextFromController[number1]);
      }
    }

    SwitchCase switchCaseCoding = SwitchCase();
    switchCaseCoding.coding(firstPart);
    intfirstPartEncoded = switchCaseCoding.intValueHalfEncoded;
    
    SwitchCase switchCaseCoding1 = SwitchCase();
    switchCaseCoding1.coding(secondPart);
    intsecondPartEncoded = switchCaseCoding1.intValueHalfEncoded;

    if(this._dropdownValueCryptography == 2) {
      SwitchCase switchCaseCoding2 = SwitchCase();
      switchCaseCoding2.coding(thirdPart);
      intthirdPartEncoded = switchCaseCoding2.intValueHalfEncoded;
    }

    firstPartOfTheEncodedMessage.clear();
    secondPartOfTheEncodedMessage.clear();
    thirdPartOfTheEncodedMessage.clear();
    firstPartOfTheEncodedMessageString.clear();
    secondPartOfTheEncodedMessageString.clear();
    thirdPartOfTheEncodedMessageString.clear();

    if(this._dropdownValueCryptography == 1) {
      for (b = 0; b < halfLength; b++) {
        int result1 = (_data11*intfirstPartEncoded[b]) + (_data12*intsecondPartEncoded[b]);
        int result2 = (_data21*intfirstPartEncoded[b]) + (_data22*intsecondPartEncoded[b]);

        firstPartOfTheEncodedMessage.insert(b, result1);
        secondPartOfTheEncodedMessage.insert(b, result2);

        firstPartOfTheEncodedMessageString.insert(b, numberFormatter.format(firstPartOfTheEncodedMessage[b]));
        secondPartOfTheEncodedMessageString.insert(b, numberFormatter.format(secondPartOfTheEncodedMessage[b]));
      }
    } else {
      for (b = 0; b < thirdLength; b++) {
        int result1 = (_data11*intfirstPartEncoded[b]) + (_data12*intsecondPartEncoded[b]) + (_data13*intthirdPartEncoded[b]);
        int result2 = (_data21*intfirstPartEncoded[b]) +( _data22*intsecondPartEncoded[b]) + (_data23*intthirdPartEncoded[b]);
        int result3 = (_data31*intfirstPartEncoded[b]) + (_data32*intsecondPartEncoded[b]) + (_data33*intthirdPartEncoded[b]);

        firstPartOfTheEncodedMessage.insert(b, result1);
        secondPartOfTheEncodedMessage.insert(b, result2);
        thirdPartOfTheEncodedMessage.insert(b, result3);

        firstPartOfTheEncodedMessageString.insert(b, numberFormatter.format(firstPartOfTheEncodedMessage[b]));
        secondPartOfTheEncodedMessageString.insert(b, numberFormatter.format(secondPartOfTheEncodedMessage[b]));
        thirdPartOfTheEncodedMessageString.insert(b, numberFormatter.format(thirdPartOfTheEncodedMessage[b]));
      }
    }
  }

  double _number11;
  double _number12;
  double _number13;
  double _number21;
  double _number22;
  double _number23;
  double _number31;
  double _number32;
  double _number33;

  getMatrixDataToDecode() async {
    final prefs = await SharedPreferences.getInstance();
    this.getDropdownOptionCryptography();

    if(this._dropdownValueCryptography == 2) {
      _number13 = double.tryParse(prefs.getString('inverseMatrixCell13'));
      _number23 = double.tryParse(prefs.getString('inverseMatrixCell23'));
      _number31 = double.tryParse(prefs.getString('inverseMatrixCell31'));
      _number32 = double.tryParse(prefs.getString('inverseMatrixCell32'));
      _number33 = double.tryParse(prefs.getString('inverseMatrixCell33'));
    }

    _number11 = double.tryParse(prefs.getString('inverseMatrixCell11'));
    _number12 = double.tryParse(prefs.getString('inverseMatrixCell12'));
    _number21 = double.tryParse(prefs.getString('inverseMatrixCell21'));
    _number22 = double.tryParse(prefs.getString('inverseMatrixCell22'));
    
  }

  decodeMessage(theCodeMessage) {
    List<double> firstPart = [];
    List<double> secondPart = [];
    List<double> thirdPart = [];
    int number;
    int number1;
    int b;
    List textString = theCodeMessage.replaceAll('[','').replaceAll(']','').replaceAll(' ', '').split(',');
    List<double> listOfNumberToDecode = [];
    
    for(var g = 0; g < textString.length; g++) {
      var tryingParseToInt = double.tryParse(textString[g].replaceAll(' ', '')..replaceAll('[', '')..replaceAll(']', ''));
      listOfNumberToDecode.insert(g, tryingParseToInt);
    }

    if(this._dropdownValueCryptography == 1) {
      halfLength = listOfNumberToDecode.length~/2;

      for (b = 0; b < listOfNumberToDecode.length~/2; b++) {
        number = b + halfLength;

        firstPart.insert(b, listOfNumberToDecode[b]);
        secondPart.insert(b, listOfNumberToDecode[number]);
      }
    } else {
      thirdLength = listOfNumberToDecode.length~/3;

      for (b = 0; b < listOfNumberToDecode.length~/3; b++) {
        number = b + thirdLength;
        number1 = b + (thirdLength*2);


        firstPart.insert(b, listOfNumberToDecode[b]);
        secondPart.insert(b, listOfNumberToDecode[number]);
        thirdPart.insert(b, listOfNumberToDecode[number1]);
      }
    }

    doublefirstPartOfTheEncodedMessage.clear();
    doublesecondPartOfTheEncodedMessage.clear();
    doublethirdPartOfTheEncodedMessage.clear();


    if(this._dropdownValueCryptography == 1) {
      for (b = 0; b < halfLength; b++) {
        doublefirstPartOfTheEncodedMessage.insert(b, (_number11*firstPart[b] + _number12*secondPart[b]));
        doublesecondPartOfTheEncodedMessage.insert(b, (_number21*firstPart[b] + _number22*secondPart[b]));
      }
    } else {
      for (b = 0; b < thirdLength; b++) {
        doublefirstPartOfTheEncodedMessage.insert(b, (_number11*firstPart[b] + _number12*secondPart[b] + _number13*thirdPart[b]));
        doublesecondPartOfTheEncodedMessage.insert(b, (_number21*firstPart[b] + _number22*secondPart[b] + _number23*thirdPart[b]));
        doublethirdPartOfTheEncodedMessage.insert(b, (_number31*firstPart[b] + _number32*secondPart[b] + _number33*thirdPart[b]));
      }
    }

    SwitchCase switchCaseDecoding = SwitchCase();
    stringfirstPartEncoded = switchCaseDecoding.decoding(doublefirstPartOfTheEncodedMessage);

    SwitchCase switchCaseDecoding1 = SwitchCase();
    stringsecondPartEncoded = switchCaseDecoding1.decoding(doublesecondPartOfTheEncodedMessage);

    if(this._dropdownValueCryptography == 2) {
      SwitchCase switchCaseDecoding2 = SwitchCase();
      stringthirdPartEncoded = switchCaseDecoding2.decoding(doublethirdPartOfTheEncodedMessage);
    }
  }
}