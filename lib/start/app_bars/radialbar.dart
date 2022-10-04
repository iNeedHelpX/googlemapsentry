import 'package:flutter/material.dart';
import 'package:flutter_gradients_reborn/flutter_gradients_reborn.dart';
import 'package:googlemapsentry/colors/colours_list.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar myRadialBar(BuildContext context) {
  return AppBar(
    shadowColor: textgreyblue,

    flexibleSpace: ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: FlutterGradients.premiumDark(tileMode: TileMode.clamp),
        ),
      ),
    ),
    elevation: 16,

    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
    ),
    //set size of appbar. This is sort of big
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Stack(
        children: [
          Text(
            "Coffee Society",
            style: GoogleFonts.damion(
              color: lightgoldbg,
              fontWeight: FontWeight.w800,
              fontSize: 65,
              shadows: [
                Shadow(
                  offset: const Offset(8, 8.0),
                  blurRadius: 17.0,
                  color: fill2.withOpacity(0.6),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
