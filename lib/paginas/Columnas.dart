import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:animaciones/json/games_json.dart';
import 'package:animaciones/paginas/colores.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animaciones/paginas/DetalleJuego.dart';

class Columnas extends StatefulWidget {
  const Columnas({Key? key}) : super(key: key);

  @override
  State<Columnas> createState() => _ColumnasState();
}

class _ColumnasState extends State<Columnas> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: bar(),
      backgroundColor: AppColor.lightTertiaryColor,
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 3000),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: List.generate(games.length, (index) {
                      return Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context, PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: DetalleJuego(
                                        juegos: games[index]
                                    ),
                                    type: PageTransitionType.scale));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    children: [
                                      Container(
                                        width: 380,
                                        height: 190,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(games[index]['img']),
                                                fit: BoxFit.cover
                                            ),
                                          borderRadius: BorderRadius.circular(15)
                                        ),
                                      ),
                                      Text(games[index]['title'],
                                          style: GoogleFonts.gruppo(
                                              textStyle: TextStyle(
                                                  color: AppColor.primaryColor,
                                                  letterSpacing: 2,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold))), SizedBox(height: 10,)
                                    ]),
                              )
                          ),
                        ],
                      );
              })
          ),
        ),
      ),
      )
    );
  }
  bar() {
    return AppBar(
      backgroundColor: AppColor.lightTertiaryColor,
      title: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          children: [
            Text("TOP 10", style: GoogleFonts.gruppo(
                textStyle: TextStyle(
                    color: AppColor.primaryColor,
                    letterSpacing: 5,
                    fontSize: 30))),
            Text("Juegos Mas Populares", style: GoogleFonts.gruppo(textStyle: TextStyle(color: AppColor.primaryColor, letterSpacing: 5, fontSize: 10, fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }
}
