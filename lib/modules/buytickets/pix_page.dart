import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Shared/buttons/button_cancelar.dart';
import '../../Shared/buttons/button_prosseguir.dart';
import '../../Shared/themes/app_colors.dart';

class PixPage extends StatefulWidget{
  const PixPage ({Key? key}): super(key: key);

  @override
  _PixPageState  createState() => _PixPageState();

}
String generateRandomString(int len) {
  var r = Random.secure();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}

class _PixPageState extends State<PixPage>{
  Random randomico =  Random();
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
                  child: Text("Pix",
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
                          "Método de pagamento por chave pix",
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
                    child: Padding(
                      padding: const EdgeInsets.only(top:12),
                      child: Text(
                        "Chave pix aleatória:",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:10),
                    child: Text(generateRandomString(20)),
                  ),
                  Padding(padding: EdgeInsets.only(left:13,top:63),
                    child: Text(
                      "A chave tem validade de até 30 minutos!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.corTextoPix,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(47, 280, 87, 20),
                        child: ButtonCancelar(
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 280, 20, 20),
                          child: ButtonProsseguir(onTap: () {
                            if (randomico.nextBool() == true) {
                              Navigator.pushNamed(context, "/erropage");
                            } else {
                              Navigator.pushNamed(context, "/sucessopage");
                            }
                          })
                              )
                    ],
                  ),
                ],
              ),)
          ],

        )
    );
  }

}