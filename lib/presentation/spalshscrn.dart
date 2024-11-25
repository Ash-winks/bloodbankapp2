import 'dart:async';
import 'package:bloodbankapp1/presentation/info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffe8644e), Color(0xfff28e7b)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),(){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return Appinfo();
    }));});
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color(0xffededee),
      body:Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
                   Image(image: AssetImage('asset/image/appstore.png'),height: 150,),
              Padding(
                padding: const EdgeInsets.fromLTRB(135, 10, 10, 0),
                child: Text('Vital Drop',style:GoogleFonts.montserrat(
                  fontSize: 30,
                  shadows:[
                    Shadow(
                      offset: Offset(2,2),
                      blurRadius: 3
                    )
                  ]
                ),
              )
              )
        ],
      ) ,
    ));
  }
}
