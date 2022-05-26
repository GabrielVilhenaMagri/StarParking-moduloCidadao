import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_parking_app_cidadao/Shared/buttons/home_page_button_buy_ticket.dart';
import 'package:star_parking_app_cidadao/Shared/themes/app_colors.dart';
import 'package:star_parking_app_cidadao/Shared/themes/app_images.dart';
import '../../Shared/buttons/home_page_button_map.dart';
import '../../Shared/buttons/home_page_button_mytickets.dart';
import '../../Shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 58, 0, 0),
                    child: Text(
                      "Bem-vindo ao\naplicativo do Cidadão",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )
                    ),
                  ),
                ]),
            actions: [],
            elevation: 0,
          )),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
              child: Row(mainAxisSize: MainAxisSize.max, children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(31, 5, 8, 8),
                    child: Text(
                        'Navegue pelos menus abaixo\npara encontrar a funcionalidade que deseja',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        )),
                  ),
                ),
              ])),
          Padding(
            padding: EdgeInsets.only(left: 35,right: 47,top: 85),
            child: HomePageButtonBuyTicket(
              onTap: () {
              Navigator.pushNamed(context, "/buytickets");
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 35,right: 47,top: 85),
            child: HomePageButtonMap(
              onTap: () {
                Navigator.pushNamed(context, "/map");
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 35,right: 47,top: 85),
            child: HomePageButtonMyTickets(
              onTap: () {
                Navigator.pushNamed(context, "/mytickets");
              },
            ),
          ),
        ],
      ),
    );
  }
}
