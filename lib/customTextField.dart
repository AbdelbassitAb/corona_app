import 'package:flutter/material.dart';
import 'package:projet_1cs/styles.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {this.isPassword = false,
        this.suffix,
        this.prefix,
        this.suffixPressed,
        this.labelText,
        this.textEditingController,
        this.keyBoardType,
        this.validator});

  bool isPassword;
  Icon suffix;
  Icon prefix;
  final String labelText;
  final TextEditingController textEditingController;
  final TextInputType keyBoardType;
  final Function validator;
  Function suffixPressed;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: this.widget.textEditingController,
        keyboardType: this.widget.keyBoardType,
        validator: this.widget.validator,
        obscureText: this.widget.isPassword,
        decoration: InputDecoration(
          prefixIcon: this.widget.prefix != null ? this.widget.prefix : null,
          suffixIcon: this.widget.suffix != null
              ? IconButton(
            icon: this.widget.suffix,
            onPressed: this.widget.suffixPressed,
          )
              : null,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          labelText: this.widget.labelText,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 1),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ));
  }
}