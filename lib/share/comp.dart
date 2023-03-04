import 'package:flutter/material.dart';
import 'package:new_project/login_screen.dart';

import '../animated_list.dart';

Widget MyTextFormField({
  required String labelText,
  required TextEditingController controller,
  required IconData prefixIcon,
  required double padding,
  required TextInputType keyboardtype,
  IconData? suffixIcon,
  bool obscuretext = false,
  required String? Function(String?)? validator,
}) {
  return Padding(
    padding: EdgeInsets.all(padding),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardtype,
      obscureText: obscuretext,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.5),
          ),
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    suffixIcon,
                  ),
                )
              : null
              ),
              validator: validator,
    ),
  );
}

Future MyNav({
  required BuildContext context,
  required Widget widget,
}) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
      return const AnimatedListScreen();
    }),
  );
}

class Myclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height / 1.25);
    path.cubicTo(size.width / 2 * 0.6, size.height * 0.5, size.width,
        size.height * 1.4, size.width * 1.2, size.height / 1.5);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
