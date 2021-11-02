import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_1cs/customTextField.dart';
import 'package:projet_1cs/loadingSxreen.dart';
import 'package:projet_1cs/styles.dart';

class RendezVous extends StatefulWidget {
  @override
  _RendezVousState createState() => _RendezVousState();
}

class _RendezVousState extends State<RendezVous> {
  bool reserved;
  bool loading;
  String type;

  List<String> doctors = [
    "Fantazi",
    "Boussekine",
    "Frioui",
    "Srairi",
    "Brahna",
    "Ouchene",
    "Chabounia",
    "Ouahioune",
    "Rassem",
  ];

  String doctor;
  String time;

  List<String> times = [
    '9:00 AM',
    '9:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
  ];

  Random random = new Random();

  @override
  void initState() {
    doctor = '';
    time = '';
    type = '';
    reserved = false;
    loading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: loading
            ? LoadingScreen()
            : Stack(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
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
                              'Rendez-vous',
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
                      child: SvgPicture.asset('assets/rendez_vous.svg'),
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: size.width * 0.8,
                        child: Column(
                          children: [
                            reserved
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Rendez-vous avec Dr ${doctor}',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 22),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Type : ${type}',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 22),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Lundi 04 juillet 2021',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 22),
                                          ),
                                          Text(
                                            time,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 22),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                : Text(
                                    'Vous n\'avez aucun rendez vous',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 22),
                                  ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: size.height * 0.07,
                              width: size.width,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: RaisedButton(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            height: size.height * 0.3,
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'Choisir le type:',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 22),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Center(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height:
                                                            size.height * 0.07,
                                                        width: size.width * 0.8,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: RaisedButton(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10),
                                                            onPressed: () {
                                                              setState(() {
                                                                loading = true;
                                                                reserved = true;
                                                                doctor = doctors[random. nextInt(9)];
                                                                time = times[random. nextInt(7)];
                                                                type = 'Medecin';
                                                              });
                                                              Timer(
                                                                  Duration(
                                                                      seconds:
                                                                          3),
                                                                  () {
                                                                // 5 seconds over, navigate to Page2.
                                                                Navigator.pop(
                                                                    context);
                                                                setState(() {
                                                                  loading =
                                                                      false;
                                                                });
                                                              });
                                                            },
                                                            child: Text(
                                                              'Medecin',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 20),
                                                            ),
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height:
                                                            size.height * 0.07,
                                                        width: size.width * 0.8,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: RaisedButton(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10),
                                                            onPressed: () {
                                                              setState(() {
                                                                loading = true;
                                                                reserved = true;
                                                                doctor = doctors[random. nextInt(9)];
                                                                time = times[random. nextInt(7)];
                                                                type = 'Psychologue';
                                                              });
                                                              Timer(
                                                                  Duration(
                                                                      seconds:
                                                                          3),
                                                                  () {
                                                                // 5 seconds over, navigate to Page2.
                                                                Navigator.pop(
                                                                    context);
                                                                setState(() {
                                                                  loading =
                                                                      false;
                                                                });
                                                              });
                                                            },
                                                            child: Text(
                                                              'Psychologue',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 20),
                                                            ),
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: Text(
                                    reserved
                                        ? 'Rejoindre l\'appel'
                                        : 'Resevez un rendez vous',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
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
