import 'package:flutter/material.dart';
import 'package:projet_1cs/customAppbar.dart';
import 'package:projet_1cs/customTextField.dart';
import 'package:projet_1cs/styles.dart';

class Formulaire extends StatefulWidget {
  @override
  _FormulaireState createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon : Icon(Icons.arrow_back, size: 35,),
            color: primaryColor,
            onPressed: (){
              Navigator.pop(context);
            },

          ),
          title: Text(
            'Formulaire',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: primaryColor),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: size.width * 0.9,
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
             // mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(height: 40,),
                CustomTextField(
                  labelText: 'Température',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  labelText: 'avez-vous des difficultés à respirer ?',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  labelText: 'douleurs thoraciques ?',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  labelText: 'sensations vertigineuses?',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  labelText: 'avez-vous eu des des frissons?',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  labelText: 'Vous vous sentez déshydraté ?',
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: size.height * 0.07,
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Envoyer',
                        style: TextStyle(color: Colors.white, fontSize: 20),
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
    );
  }
}
