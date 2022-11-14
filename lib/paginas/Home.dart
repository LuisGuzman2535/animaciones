import 'package:google_fonts/google_fonts.dart';
import 'package:animaciones/paginas/Columnas.dart';
import 'package:animaciones/paginas/GridView.dart';
import 'package:animaciones/paginas/Listas.dart';
import 'package:flutter/material.dart';
import 'package:animaciones/paginas/colores.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightTertiaryColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                  color: AppColor.lightTertiaryColor,
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Text("GAME APP",
                style: GoogleFonts.gruppo(
                    textStyle: TextStyle(
                        color: AppColor.primaryColor,
                        letterSpacing: 5,
                        fontSize: 16,
                        fontWeight: FontWeight.bold))),
            SizedBox(height: 30,),
            ElevatedButton(
              child: const Text('Listas Test', style: TextStyle(color: Colors.amber)),
              style: ElevatedButton.styleFrom(
                  primary: AppColor.darkSecondaryColor,
                  fixedSize: Size(240, 80),),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Lista()),
                );
              },
            ),SizedBox(height: 10,),
            ElevatedButton(
              child: const Text('Grid Test', style: TextStyle(color: Colors.amber),),
              style: ElevatedButton.styleFrom(
                primary: AppColor.darkSecondaryColor,
                fixedSize: Size(240, 80),),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Grid()),
                );
              },
            ), SizedBox(height: 10,),
            ElevatedButton(
              child: const Text('Columnas Test',style: TextStyle(color: Colors.amber) ),
              style: ElevatedButton.styleFrom(
                primary: AppColor.darkSecondaryColor,
                fixedSize: Size(240, 80),),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Columnas()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

