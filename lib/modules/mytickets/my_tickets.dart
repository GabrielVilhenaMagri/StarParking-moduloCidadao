import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_parking_app_cidadao/modules/mytickets/ticket_controller.dart';
import '../../Shared/buttons/button_search.dart';

class MyTickets extends StatefulWidget {
  const MyTickets({Key? key}) : super(key: key);

  @override
  _MyTickets createState() => _MyTickets();
}

class _MyTickets extends State<MyTickets> {
  final PlacaInputTextController = MaskedTextController(mask: "AAA-0000");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            flexibleSpace: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(1, 40, 0, 0),
                      child: Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30, 40, 0, 0),
                      child: Text(
                        "Meus Tickets",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(38, 0, 8, 8),
                        child: Text(
                          "Informações sobre seus tickets adquiridos",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            actions: [],
            elevation: 0,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top:200),
          child: Column(mainAxisSize: MainAxisSize.max,
              children: [
            Center(
              child: Container(
                  child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                      child: ButtonSearch(onTap: () {
                        showSearch(
                          context: context,
                          delegate: UsuarioSearchPage(),
                        );
                      }))),
            )
          ]),
        ));
  }
}
