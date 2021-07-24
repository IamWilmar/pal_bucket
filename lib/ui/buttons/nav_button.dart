import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class NavButton extends StatefulWidget {
  final String text;
  final Function? onPressed;
  const NavButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  _NavButtonState createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MouseRegion(
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            widget.text,
            style: GoogleFonts.montserratAlternates(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              color: Colors.white,
              decoration: isHover ? TextDecoration.underline : null,
            ),
          ),
        ),
      ),
      onTap: () {
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
    );
  }
}
