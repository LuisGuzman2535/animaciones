import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:animaciones/paginas/colores.dart';
import 'package:google_fonts/google_fonts.dart';

class DetalleJuego extends StatefulWidget {
  const DetalleJuego({Key? key, this.juegos}) : super(key: key);
  final dynamic juegos;

  @override
  State<DetalleJuego> createState() => _DetalleJuegoState();
}

class _DetalleJuegoState extends State<DetalleJuego> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: AppColor.lightTertiaryColor, body: cuerpo());
  }

  Widget cuerpo() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.juegos['img']),
                        fit: BoxFit.cover
                    ),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(40, 30), bottomRight: Radius.elliptical(40, 30))
                ),
              ), SizedBox( height: 30),

              Text(widget.juegos['title'], style: GoogleFonts.gruppo(
                  textStyle: TextStyle(
                      color: AppColor.primaryColor,
                      letterSpacing: 2,
                      fontSize: 20,
                    fontWeight: FontWeight.w900
                  )
                )
              ), SizedBox( height: 10),
              Container(
                width: 300,
                height: 0.5,
                decoration: BoxDecoration(
                    color: Colors.purpleAccent
                ),
              ), SizedBox( height: 20),
              Container(
                width: 340,
                child: Text("Descripcion: ",
                  style: GoogleFonts.gruppo(
                    textStyle: TextStyle(
                        color: AppColor.white,
                        letterSpacing: 2,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                    )
                  ),
                  textAlign: TextAlign.left,
                ),
              ), SizedBox( height: 15),
              Container(
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.juegos['description'], style: GoogleFonts.gruppo(
                      textStyle: TextStyle(
                          color: AppColor.primaryColor,
                          letterSpacing: 3,
                          fontSize: 15,
                          fontWeight: FontWeight.w800
                      ),
                    ),
                   textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
