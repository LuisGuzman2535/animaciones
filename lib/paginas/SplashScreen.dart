import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animaciones/paginas/Home.dart';
import 'package:animaciones/paginas/colores.dart';
import 'package:google_fonts/google_fonts.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Home()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColor.lightTertiaryColor,
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
                height: 100,
                child: Image.asset("assets/images/logo.png")
            ),
            SizedBox(height: 5),
            Text(
              'Welcome To GAME APP',
              style: GoogleFonts.gruppo(
                  textStyle: TextStyle(
                      color: AppColor.primaryColor,
                      letterSpacing: 5,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        )
    );
    /* new SplashScreen(
      seconds: 10,
      navigateAfterSeconds: new Home(),
      title: new Text(
        'Welcome To GAME APP',
        style: GoogleFonts.gruppo(
            textStyle: TextStyle(
                color: AppColor.primaryColor,
                letterSpacing: 5,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
      ),
      image: Image.asset("assets/images/logo.png")
      ,
      photoSize: 100,
      backgroundColor: AppColor.lightTertiaryColor,
      loaderColor: AppColor.primaryColor,
    );*/

  }
}

    
    