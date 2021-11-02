import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_1cs/styles.dart';



class Bracelet extends StatefulWidget {
  @override
  _BraceletState createState() => _BraceletState();
}

class _BraceletState extends State<Bracelet> {
  bool loading ;
  String text;
  @override
  void initState() {
    loading = false;
    text = 'Connecter';

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [

            Positioned(
              child: Container(
                width: size.width,
                height: size.height,
                //color: Colors.blue,
                child: CustomPaint(
                  painter: CurvePainter(),
                ),
              ),
            ),
            Positioned(
              child: Align(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/menu.svg',
                        height: 35,
                        width: 35,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Bracelet',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
            ),
            Positioned.fill(
              top: 120,
              child: Align(
                child: SvgPicture.asset('assets/bracelet.svg'),
                alignment: Alignment.topCenter,
              ),
            ),
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,


              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: size.width * 0.85,

                  child: Column(

                    children: [
                      Text(
                        'Connecter votre bracelet medical',
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'pour garantir le suivi de votre santé',
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),

                      SizedBox(height: 20,),

                      Container(

                        height: size.height * 0.07,
                        width: size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            onPressed: () {
                              setState(() {
                                loading = true;
                              });
                              Timer(Duration(seconds: 3), () {
                                // 5 seconds over, navigate to Page2.


                                setState(() {
                                  text = 'Connectée avec succés';
                                  loading = false;
                                });
                              });


                            },
                            child:  loading ? CircularProgressIndicator() :  Text(
                             text,
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = primaryColor;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.7, size.width, size.height * 0.5);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
