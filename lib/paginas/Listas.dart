import 'package:animaciones/json/games_json.dart';
import 'package:animaciones/paginas/DetalleJuego.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animaciones/paginas/colores.dart';
import 'package:google_fonts/google_fonts.dart';

class Lista extends StatefulWidget {
  const Lista({Key? key}) : super(key: key);

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  int menu = 0;
  int top = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bar(),
      backgroundColor: AppColor.lightTertiaryColor,
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: games.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 3000),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                          height: 200,
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
                                  width: 330,
                                  height: 184,
                                  decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(games[index]['img']),
                                    fit: BoxFit.cover,
                                  ),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                                Text(games[index]['title'],
                                  style: GoogleFonts.gruppo(
                                      textStyle: TextStyle(
                                          color: AppColor.primaryColor,
                                          letterSpacing: 5,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)))
                              ]
                            ),

                          )
                      
                      ),
                    )
                ),
              ),
            );
          },
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
