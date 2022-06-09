import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../usuario_tile_widget/usuario_tile.dart';

class ButtonSearch extends StatefulWidget {
  final VoidCallback onTap;
  const ButtonSearch({Key? key, required this.onTap}) : super(key: key);

  @override
  _ButtonSearch createState() => _ButtonSearch();
}

class _ButtonSearch extends State<ButtonSearch>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: chamaTile,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
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
            child: Text("Procurar ",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                )),
          ),
        ),
      ),
    );
  }
void chamaTile() {
  Navigator.pushNamed(context, "/usuario_tile");
}
}

