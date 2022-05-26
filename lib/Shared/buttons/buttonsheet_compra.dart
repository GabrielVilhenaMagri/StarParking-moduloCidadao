import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ButtonSheetComprar extends StatelessWidget {
  final VoidCallback onTap;
  const ButtonSheetComprar({Key? key, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 168,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.green,
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
            child: Text("comprar",
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
