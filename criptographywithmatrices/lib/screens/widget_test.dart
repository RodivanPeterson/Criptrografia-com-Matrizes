import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:windowsteste/widgets/showMainMatrix2.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();

  final double deviceScreenWidth;

  IntroScreen({@required this.deviceScreenWidth});
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];
  TextStyle _textStyle = TextStyle(
    fontFamily: 'Orbitron',
    letterSpacing: 0.7,
    fontSize: mediaQuerySize.setFontSize(deviceScreenWidth)*0.5,
    fontWeight: FontWeight.w600,
    color: Colors.white
  );
  TextStyle _titleStyle = TextStyle(
    fontFamily: 'Orbitron',
    letterSpacing: 0.7,
    fontSize: mediaQuerySize.setFontSize(deviceScreenWidth)*0.75,
    fontWeight: FontWeight.w900,
    color: Colors.white
  );

  @override
  void initState() {
  super.initState();

      slides.add(
        new Slide(
          title: "Início",
          description: "Primeiramente preencha à matriz com número inteiros.",
          //pathImage: "images/photo_eraser.png",
          centerWidget: Column(
            children: [
              Image.asset("images/fillingInicialMatrix.gif", width: 235.0, height: 360.0)
            ],
          ),
          backgroundColor: Color(0xff0f0f0f),
          styleTitle: _titleStyle,
          styleDescription: _textStyle
        ),
      );
      slides.add(
        new Slide(
          title: "PENCIL",
          description: "Ye indulgence unreserved connection alteration appearance",
          //pathImage: ,
          
          
          backgroundColor: Color(0xff0f0f0f),
          styleTitle: _titleStyle,
          styleDescription: _textStyle
        ),
      );
      slides.add(
        new Slide(
          title: "RULER",
          description:
          "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
          //pathImage: "images/photo_ruler.png",
          backgroundColor: Color(0xff0f0f0f),
          styleTitle: _titleStyle,
          styleDescription: _textStyle
        ),
      );

  }

  void onDonePress() {
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Color(0xFF0f0f0f),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),*/
      body: IntroSlider(
        slides: this.slides,
        onDonePress: this.onDonePress,
        colorActiveDot: Color(0xFF16c878),
      ),
    );
  }
}

class Imagem extends StatefulWidget {
  @override
  _ImagemState createState() => _ImagemState();
}

class _ImagemState extends State<Imagem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image.asset(
              "images/fillingInicialMatrix.gif",
            ),
          ]
        ),
      ),
    );
  }
}