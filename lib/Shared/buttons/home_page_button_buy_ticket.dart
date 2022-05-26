import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_parking_app_cidadao/Shared/themes/app_images.dart';
import 'package:star_parking_app_cidadao/Shared/themes/app_text_styles.dart';

class HomePageButtonBuyTicket extends StatelessWidget {
  final VoidCallback onTap;
  const HomePageButtonBuyTicket({Key? key, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 278,
        height: 54,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.fromBorderSide(BorderSide(color: Colors.black12)),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 7.0,
                spreadRadius: 0.0,
                offset: Offset(2, 2),
              )
            ]),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 1, top: 12, bottom: 10),
                child: Expanded(
                  child: Image.asset(AppImages.imageTicketBlue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 14, right: 29, top: 10, bottom: 6),
                child: Expanded(
                  child: Text("Comprar Ticket",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
