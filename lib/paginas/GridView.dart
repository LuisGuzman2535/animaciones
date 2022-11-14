import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:animaciones/json/games_json.dart';
import 'package:animaciones/paginas/colores.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animaciones/paginas/DetalleJuego.dart';


class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bar(),
      backgroundColor: AppColor.lightTertiaryColor,
      body: AnimationLimiter(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            games.length,
                (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 3000),
                columnCount: 100,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 200,
                        width: 200,
                        color: AppColor.lightTertiaryColor,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, PageTransition(
                                  alignment: Alignment.bottomCenter,
                                  child: DetalleJuego(
                                      juegos: games[index]
                                  ),
                                  type: PageTransitionType.scale));
                            },
                          child: Column(
                            children: [
                              Container(
                              width: 200,
                              height: 90,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(games[index]['img']),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                              Text(games[index]['title'],
                                  style: GoogleFonts.gruppo(
                                      textStyle: TextStyle(
                                          color: AppColor.primaryColor,
                                          letterSpacing: 2,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)))
                          ])
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
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
