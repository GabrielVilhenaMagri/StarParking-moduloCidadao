import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/app_colors.dart';

class ButtonFinalizar extends StatelessWidget {
  final VoidCallback onTap;
  const ButtonFinalizar({Key? key, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 168,
        height: 40,
        decoration: BoxDecoration(
            color: AppColors.secundaria,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 4.0,
                spreadRadius: 0.0,
                offset: Offset(1, 2),
              )
            ]),
        child: Center(
          child: Container(
            child: Text("Finalizar",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}
