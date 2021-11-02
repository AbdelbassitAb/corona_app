import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projet_1cs/customTextField.dart';
import 'package:projet_1cs/home.dart';
import 'package:projet_1cs/home2.dart';
import 'package:projet_1cs/loadingSxreen.dart';
import 'package:projet_1cs/styles.dart';
import 'dart:async';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool loading;
  String email;
  TextEditingController emailTextField = TextEditingController();


  @override
  void initState() {
    loading = false;
    email = "";
    super.initState();
  }

  @override
  void dispose() {
    emailTextField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: loading
          ? LoadingScreen()
          : Scaffold(
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        width: size.width,
                        height: size.height,
                        //color: Colors.blue,
                        child: CustomPaint(
                          painter: CurvePainter(),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      top: 50,
                      child: Align(
                        child: SvgPicture.asset('assets/login.svg'),
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    Positioned(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: size.width,
                          height: size.height,
                          //color: Colors.blue,
                          child: CustomPaint(
                            painter: CurvePainter2(),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      top: 150,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: size.width * 0.8,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomTextField(
                                  textEditingController: emailTextField,
                                  labelText: 'Email',
                                  prefix: Icon(
                                    Icons.email,
                                    color: primaryColor,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Email incorrecte';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  labelText: 'Password',
                                  prefix: Icon(
                                    Icons.lock,
                                    color: primaryColor,
                                  ),
                                  isPassword: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Mot de passe incorrecte';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: size.height * 0.07,
                                  width: size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: RaisedButton(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          if(emailTextField.text == 'ia_abedmeraim@esi.dz')
                                            {
                                              setState(() {
                                                loading = true;
                                              });
                                              Timer(Duration(seconds: 3), () {
                                                // 5 seconds over, navigate to Page2.
                                                Get.to(() => Home());
                                                setState(() {
                                                  emailTextField.text = "";
                                                  loading = false;
                                                });
                                              });

                                            }else{
                                            setState(() {
                                              loading = true;
                                            });
                                            Timer(Duration(seconds: 3), () {
                                              // 5 seconds over, navigate to Page2.
                                              Get.to(() => Home2());
                                              setState(() {
                                                emailTextField.text = "";
                                                loading = false;
                                              });
                                            });
                                              }

                                        }
                                      },
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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

    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.5, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CurvePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = primaryColor;
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(size.width * 0.5, size.height);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.9, size.width, size.height * 0.9);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/*
            Center(
              child: Container(
                width: size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextField(
                      labelText: 'Email',
                      prefix: Icon(Icons.email_outlined),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      labelText: 'Password',
                      prefix: Icon(Icons.lock_outline),
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          onPressed: () {},
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),*/
