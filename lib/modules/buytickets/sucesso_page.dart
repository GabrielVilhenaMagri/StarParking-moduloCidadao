import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_parking_app_cidadao/Shared/themes/app_images.dart';

import '../../Shared/buttons/button_finalizar.dart';

class SucessoPage extends StatefulWidget{
  const SucessoPage ({Key? key}): super(key: key);

  @override
  _SucessoPageState  createState() => _SucessoPageState();

}

class _SucessoPageState extends State<SucessoPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace:Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding:const EdgeInsetsDirectional.fromSTEB(50, 40, 0, 0),
              child: Text("Compra realizada",
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              )
              ),
              ),
              Padding(padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(padding: EdgeInsetsDirectional.fromSTEB(31, 0, 8, 8),
                  child: Text(
                    "Atente-se ao tempo limite do ticket",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),)
                ],
              ),
              )
            ],
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(padding: EdgeInsets.only(top:44),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Image.asset(AppImages.imageCheckGreen),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:12),
                  child: Text(
                    "O pagamento foi aprovado\n"
                        "     Aproveite seu tempo :)",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left:13,top:63),
                child: Text(
                  "Para ver o tempo restante vá até\n   Meus Tickets na página incial",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(111,206,101,20),
                child: ButtonFinalizar(onTap: () {
                  Navigator.pushNamed(context, "/home");
                },),
              ),
            ],
          ),)
        ],

      )
    );
  }

}