import 'package:flutter/material.dart';
import 'showFraction.dart';
import '../mediaQuerySize.dart';
MediaQuerySize mediaQuerySize = MediaQuerySize();

class ShowingMatrix extends StatelessWidget {

  final double deviceWidth;
  final String cell11;
  final String cellD11;
  final String cell12;
  final String cellD12;
  final String cell13;
  final String cellD13;
  final String cell21;
  final String cellD21;
  final String cell22;
  final String cellD22;
  final String cell23;
  final String cellD23;
  final String cell31;
  final String cellD31;
  final String cell32;
  final String cellD32;
  final String cell33;
  final String cellD33;
  final double reduceTheFontSize;
  final bool isOrderMatrix2;
  final bool showDecimalNumbers;

  ShowingMatrix({
    @required this.deviceWidth,
    @required this.cell11,
    @required this.cell12,
    @required this.cell21,
    @required this.cell22,
    @required this.isOrderMatrix2,
    @required this.showDecimalNumbers,
    this.cell13 = '0',
    this.cell23 = '0',
    this.cell31 = '0',
    this.cell32 = '0',
    this.cell33 = '0',
    this.cellD11 = '1',
    this.cellD12 = '1',
    this.cellD13 = '1',
    this.cellD21 = '1',
    this.cellD22 = '1',
    this.cellD23 = '1',
    this.cellD31 = '1',
    this.cellD32 = '1',
    this.cellD33 = '1',
    this.reduceTheFontSize = 1.0,
  });

  @override
  Widget build(BuildContext context) {

    var _numerator11;
    var _numerator12;
    var _numerator13;
    var _numerator21;
    var _numerator22;
    var _numerator23;
    var _numerator31;
    var _numerator32;
    var _numerator33;
    var _denominator11;
    var _denominator12;
    var _denominator13;
    var _denominator21;
    var _denominator22;
    var _denominator23;
    var _denominator31;
    var _denominator32;
    var _denominator33;

    



    if(this.isOrderMatrix2) {

      if(this.showDecimalNumbers) {

        _numerator11 = double.tryParse(this.cell11);
        _numerator12 = double.tryParse(this.cell12);
        _numerator21 = double.tryParse(this.cell21);
        _numerator22 = double.tryParse(this.cell22);
        _denominator11 = double.tryParse(this.cellD11);
        _denominator12 = double.tryParse(this.cellD12);
        _denominator21 = double.tryParse(this.cellD21);
        _denominator22 = double.tryParse(this.cellD22);

      } else {
        _numerator11 = int.tryParse(this.cell11);
        _numerator12 = int.tryParse(this.cell12);
        _numerator21 = int.tryParse(this.cell21);
        _numerator22 = int.tryParse(this.cell22);
        _denominator11 = int.tryParse(this.cellD11);
        _denominator12 = int.tryParse(this.cellD12);
        _denominator21 = int.tryParse(this.cellD21);
        _denominator22 = int.tryParse(this.cellD22);
      }

      return SingleChildScrollView(
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/bracket1.png", height: mediaQuerySize.setTextFieldSize(deviceWidth)*2.3,
              color: Color(0xFF0e0e0e),
            ),
            Table(
              defaultColumnWidth: IntrinsicColumnWidth(),
              columnWidths: {10 : FractionColumnWidth(0.2)},
              children: [
                TableRow(
                  children: [
                    ShowFraction(
                      numeratorParam: _numerator11,
                      denominatorParam: _denominator11,
                      decimalNumbersLength: this.cell11.length,
                      deviceScreenWidthParam: deviceWidth,
                      reduceTheFontSize: this.reduceTheFontSize,
                    ),
                    ShowFraction(
                      numeratorParam: _numerator12,
                      denominatorParam: _denominator12,
                      decimalNumbersLength: this.cell12.length,
                      deviceScreenWidthParam: deviceWidth,
                      reduceTheFontSize: this.reduceTheFontSize,
                    ),
                  ]
                ),
                TableRow(
                  children: [
                    ShowFraction(
                      numeratorParam: _numerator21,
                      denominatorParam: _denominator21,
                      decimalNumbersLength: this.cell21.length,
                      deviceScreenWidthParam: deviceWidth,
                      reduceTheFontSize: this.reduceTheFontSize,
                    ),
                    ShowFraction(
                      numeratorParam: _numerator22,
                      denominatorParam: _denominator22,
                      decimalNumbersLength: this.cell22.length,
                      deviceScreenWidthParam: deviceWidth,
                      reduceTheFontSize: this.reduceTheFontSize,
                    ),
                  ]
                )
              ],
            ),
            Image.asset(
              "images/bracket2.png", height: mediaQuerySize.setTextFieldSize(deviceWidth)*2.3,
              color: Color(0xFF0e0e0e),
            ),
          ]
        ),
      );
    } else {

      if(this.showDecimalNumbers) {

        _numerator11 = double.tryParse(this.cell11);
        _numerator12 = double.tryParse(this.cell12);
        _numerator13 = double.tryParse(this.cell13);
        _numerator21 = double.tryParse(this.cell21);
        _numerator22 = double.tryParse(this.cell22);
        _numerator23 = double.tryParse(this.cell23);
        _numerator31 = double.tryParse(this.cell31);
        _numerator32 = double.tryParse(this.cell32);
        _numerator33 = double.tryParse(this.cell33);
        _denominator11 = double.tryParse(this.cellD11);
        _denominator12 = double.tryParse(this.cellD12);
        _denominator13 = double.tryParse(this.cellD13);
        _denominator21 = double.tryParse(this.cellD21);
        _denominator22 = double.tryParse(this.cellD22);
        _denominator23 = double.tryParse(this.cellD23);
        _denominator31 = double.tryParse(this.cellD31);
        _denominator32 = double.tryParse(this.cellD32);
        _denominator33 = double.tryParse(this.cellD33);

      } else {
        _numerator11 = int.tryParse(this.cell11);
        _numerator12 = int.tryParse(this.cell12);
        _numerator13 = int.tryParse(this.cell13);
        _numerator21 = int.tryParse(this.cell21);
        _numerator22 = int.tryParse(this.cell22);
        _numerator23 = int.tryParse(this.cell23);
        _numerator31 = int.tryParse(this.cell31);
        _numerator32 = int.tryParse(this.cell32);
        _numerator33 = int.tryParse(this.cell33);
        _denominator11 = int.tryParse(this.cellD11);
        _denominator12 = int.tryParse(this.cellD12);
        _denominator13 = int.tryParse(this.cellD13);
        _denominator21 = int.tryParse(this.cellD21);
        _denominator22 = int.tryParse(this.cellD22);
        _denominator23 = int.tryParse(this.cellD23);
        _denominator31 = int.tryParse(this.cellD31);
        _denominator32 = int.tryParse(this.cellD32);
        _denominator33 = int.tryParse(this.cellD33);
      }

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/bracket1.png", height: mediaQuerySize.setTextFieldSize(deviceWidth)*2.3,
              color: Color(0xFF0e0e0e),
            ),
            Table(
              defaultColumnWidth: IntrinsicColumnWidth(),
              columnWidths: {10 : FractionColumnWidth(0.2)},
              children: [
                TableRow(
                  children: [
                    ShowFraction(
                      numeratorParam: _numerator11,
                      denominatorParam: _denominator11,
                      decimalNumbersLength: this.cell11.length,
                      deviceScreenWidthParam: deviceWidth,
                      reduceTheFontSize: this.reduceTheFontSize,
                    ),
                    ShowFraction(
                      numeratorParam: _numerator12,
                      denominatorParam: _denominator12,
                      decimalNumbersLength: this.cell12.length,
                      deviceScreenWidthParam: deviceWidth,
                      reduceTheFontSize: this.reduceTheFontSize,
                    ),
                    ShowFraction(
                      numeratorParam: _numerator13,
                      denominatorParam: _denominator13,
                      decimalNumbersLength: this.cell13.length,
                      deviceScreenWidthParam: deviceWidth,
                      reduceTheFontSize: this.reduceTheFontSize,
                    ),
                  ]
                ),
                TableRow(
                  children: [
                    ShowFraction(
                      numeratorParam: _numerator21,
                      denominatorParam: _denominator21,
                      decimalNumbersLength: this.cell21.length,
                      deviceScreenWidthParam: deviceWidth,
                      reduceTheFontSize: this.reduceTheFontSize,
                    ),
                    ShowFraction(
                      numeratorParam: _numerator22,
                      denominatorParam: _denominator22,
                      decimalNumbersLength: this.cell22.length,
                      deviceScreenWidthParam: deviceWidth,
                      reduceTheFontSize: this.reduceTheFontSize,
                    ),
                    ShowFraction(
                      numeratorParam: _numerator23,
                      denominatorParam: _denominator23,
                      decimalNumbersLength: this.cell23.length,
                      deviceScreenWidthParam: deviceWidth,
                      reduceTheFontSize: this.reduceTheFontSize,
                    ),
                  ]
                ),
                TableRow(
                  children: [
                    ShowFraction(
                      numeratorParam: _numerator31,
                      denominatorParam: _denominator31,
                      decimalNumbersLength: this.cell31.length,
                      deviceScreenWidthParam: deviceWidth,
                      reduceTheFontSize: this.reduceTheFontSize,
                    ),
                    ShowFraction(
                      numeratorParam: _numerator32,
                      denominatorParam: _denominator32,
                      decimalNumbersLength: this.cell32.length,
                      deviceScreenWidthParam: deviceWidth,
                      reduceTheFontSize: this.reduceTheFontSize,
                    ),
                    ShowFraction(
                      numeratorParam: _numerator33,
                      denominatorParam: _denominator33,
                      decimalNumbersLength: this.cell33.length,
                      deviceScreenWidthParam: deviceWidth,
                      reduceTheFontSize: this.reduceTheFontSize,
                    ),
                  ]
                )
              ],
            ),
            Image.asset(
              "images/bracket2.png", height: mediaQuerySize.setTextFieldSize(deviceWidth)*2.3,
              color: Color(0xFF0e0e0e),
            ),
          ]
        ),
      );
    }
  }
}