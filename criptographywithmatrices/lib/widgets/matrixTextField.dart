import 'package:flutter/material.dart';
import '../mediaQuerySize.dart';
MediaQuerySize mediaQuerySize = MediaQuerySize();

class MatrixTextField extends StatelessWidget {

  final double deviceWidth;
  final EdgeInsetsGeometry textFieldMargin;
  final TextEditingController textFieldController;

  MatrixTextField({
    @required this.deviceWidth,
    @required this.textFieldMargin,
    @required this.textFieldController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0f0f0f),
        boxShadow: [
          BoxShadow(
            blurRadius: 0.1,
            color: Color(0xFF16c878),
            offset: Offset(1.5, 1.5),
          )
        ],
        borderRadius: BorderRadius.circular(7.0)
      ),
      width: mediaQuerySize.setTextFieldSize(this.deviceWidth)*1.8,
      height: mediaQuerySize.setTextFieldSize(this.deviceWidth)*0.8,
      margin: this.textFieldMargin,
      child: Center(
        child: TextField(
          toolbarOptions: ToolbarOptions(copy: true, selectAll: true, paste: true, cut: true),
          cursorColor: Color(0xFF1B2431),
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none
          ),
          style: TextStyle(
            fontFamily: 'Orbitron',
            letterSpacing: 1.0,
            fontSize: mediaQuerySize.setFontSize(this.deviceWidth)*0.7,
            color: Colors.white,
            fontWeight: FontWeight.w400
          ),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          controller: this.textFieldController,
        ),
      ),
    );
  }
}