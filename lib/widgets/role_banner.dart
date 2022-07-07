import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoleBanner extends StatelessWidget {
  final String name;
  final Color color;

  const RoleBanner(this.name, this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              color,
              color.withOpacity(0.4)
            ]
          ),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.center,
            child: Text(name, style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}