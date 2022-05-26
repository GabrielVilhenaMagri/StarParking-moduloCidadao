import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_parking_app_cidadao/Shared/themes/app_colors.dart';

class ButtonEstender extends StatelessWidget {
  final VoidCallback onTap;
  const ButtonEstender({Key? key, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 126,
        height: 34,
        decoration: BoxDecoration(
            color: AppColors.corBotaoEstender,
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
            child: Text("ESTENDER",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}
