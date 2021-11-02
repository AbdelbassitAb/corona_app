import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_1cs/bracelet.dart';
import 'package:projet_1cs/login.dart';
import 'package:projet_1cs/pagePrincipal.dart';
import 'package:projet_1cs/rendezVous.dart';
import 'package:projet_1cs/styles.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedindex;

  @override
  void initState() {
    _selectedindex = 0;
    super.initState();
  }

  static List<Widget> _widgetOptions = <Widget>[
    PagePrincipale(),
    RendezVous(),
    Bracelet(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedindex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  _selectedindex == 0 ? Icons.home : Icons.home_outlined,
                  color: _selectedindex == 0 ? primaryColor : Colors.grey,
                  size: 38,
                ),
                title: Text('Page principal'),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(_selectedindex == 1
                    ? 'assets/videoIcon.svg'
                    : 'assets/videoIconUnselected.svg'),
                title: Text('Rendez vous'),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(_selectedindex == 2
                    ? 'assets/braceletSelected.svg'
                    : 'assets/braceletUnselected.svg'),
                title: Text('Bracelet'),
              ),
            ],
            currentIndex: _selectedindex,
            onTap: (value) {
              setState(() {
                _selectedindex = value;
              });
            },
            type: BottomNavigationBarType.shifting,
            selectedItemColor: primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
          )),
    );
  }
}
