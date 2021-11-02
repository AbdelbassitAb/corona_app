import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';




class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({
    this.title,
    this.icon,
    this.backgroundColor,
    this.menuIconColor,
    this.titleColor,
    Key key,
  })  : preferredSize = Size.fromHeight(140.0),
        super(key: key);

  String title;
  Widget icon;
  Color backgroundColor;
  Color menuIconColor;
  Color titleColor;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  final Size preferredSize;
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: this.widget.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/menu.svg',
                height: 35,
                width: 35,
                color: this.widget.menuIconColor,
              ),
              this.widget.icon,
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            this.widget.title,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: this.widget.titleColor),
          ),
        ],
      ),
    );
  }
}
