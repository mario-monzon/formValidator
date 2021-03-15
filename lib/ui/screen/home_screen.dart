import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_validation/design/canes_color.dart';
import 'package:flutter_form_validation/ui/widget/canes_appbar_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = 'home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  final _itemsList = [
    TabItem(title: 'Roster', icon: FontAwesomeIcons.footballBall),
    TabItem(title: 'Eventos', icon: FontAwesomeIcons.calendar),
    TabItem(title: 'Noticias', icon: FontAwesomeIcons.newspaper),
    TabItem(title: 'Patrocinio', icon: FontAwesomeIcons.handshake),
    TabItem(title: 'Contacto', icon: FontAwesomeIcons.envelope),
  ];

  final _pageOption = <Widget>[
    Center(child: Text('Roster')),
    Center(child: Text('Eventos')),
    Center(child: Text('Noticias')),
    Center(child: Text('Sponsor')),
    Center(child: Text('Contact')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: MediaQuery.of(context).size * 0.08,
        child: CanesAppBar(),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.flip,
        curve: Curves.fastLinearToSlowEaseIn,
        color: Colors.black,
        activeColor: Colors.black,
        backgroundColor: CanesColor.colorBrand,
        initialActiveIndex: _selectedIndex,
        items: _itemsList,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _pageOption[_selectedIndex],
    );
  }
}
