import 'package:flutter/material.dart';
import '../mediaQuerySize.dart';
MediaQuerySize mediaQuerySize = MediaQuerySize();

class ShowFraction extends StatelessWidget {

  final numeratorParam;
  final denominatorParam;
  final int decimalNumbersLength;
  final double deviceScreenWidthParam;
  final double reduceTheFontSize;

  ShowFraction({
    @required this.numeratorParam,
    @required this.denominatorParam,
    @required this.decimalNumbersLength,
    @required this.deviceScreenWidthParam,
    this.reduceTheFontSize = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    
    if(this.denominatorParam == 1) {
      return Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              child: Text(
                this.numeratorParam.toString(),
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  letterSpacing: 1.0,
                  fontSize: mediaQuerySize.setFontSize(this.deviceScreenWidthParam)*0.9*reduceTheFontSize,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              child: Text(
                this.numeratorParam.toString(),
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  letterSpacing: 1.0,
                  fontSize: mediaQuerySize.setFontSize(this.deviceScreenWidthParam)*0.9*reduceTheFontSize,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                    style: BorderStyle.solid,
                  )
                )
              ),
              child: Text(
                this.denominatorParam.toString(),
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  letterSpacing: 1.0,
                  fontSize: mediaQuerySize.setFontSize(this.deviceScreenWidthParam)*0.9*reduceTheFontSize,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ],
        ),
      );
    }
  }
}