import 'package:flutter/material.dart';
import 'package:flutter_form_validation/design/canes_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CanesAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CanesColor.colorBrand,
      leading: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleAvatar(),
      ),
      title: Text(
        'Nombre Apellido',
        style: TextStyle(
          color: CanesColor.defaultColor,
        ),
      ),
      actions: [
        IconButton(
            icon: Icon(
              FontAwesomeIcons.userCog,
              color: CanesColor.defaultColor,
            ),
            onPressed: () {})
      ],
    );
  }
}
