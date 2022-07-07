import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoleBanner extends StatelessWidget {
  final int level;
  final String name;
  final Color color;
  List<Color> get gradient => [color.withOpacity(0.5), color];

  const RoleBanner({Key? key, required this.level, required this.name, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: gradient)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5, /*fontFamily: "Roboto"*/)),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(99)
              ),
              child: Text("LV $level", style: GoogleFonts.inter(color: Colors.black),),
            )
          ],
        )
    );
  }
}
