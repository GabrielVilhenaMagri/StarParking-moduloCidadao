import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:star_parking_app_cidadao/Shared/buttons/estender_button.dart';

import '../../Shared/buttons/button_search.dart';
import '../../Shared/label/label_sytle.dart';
import '../../Shared/themes/app_colors.dart';
import '../../Shared/themes/app_images.dart';

class MyTickets extends StatefulWidget {
  const MyTickets({Key? key}) : super(key: key);

  @override
  _MyTicketsState createState() => _MyTicketsState();
}

class _MyTicketsState extends State<MyTickets> {
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
                    padding: const EdgeInsetsDirectional.fromSTEB(1, 40, 0, 0),
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 40, 0, 0),
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: AppColors.corPesquisar,
                    offset: Offset(0, 1),
                  )
                ],
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: AlignmentDirectional(0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                          child: TextFormField(
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: "Digite a placa",
                              labelStyle: AppLabelStyle.LabelInput,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.corTransparente,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.corTransparente,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: Icon(
                                Icons.search_sharp,
                                color: AppColors.corIconePesquisar,
                                size: 16,
                              ),
                            ),
                          )),
                    ),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: ButtonSearch(
                          onTap: () {
                            print("Botao clicado");
                          },
                        ))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 143, 0, 0),
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 350,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    color: AppColors.corBoxShadow,
                    offset: Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                91, 0, 83, 0),
                            child: Text(
                              'ticket: 123456',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              child: Expanded(
                                  child:
                                      Image.asset(AppImages.imageTicketBlue)))
                        ],
                      ),
                    ),
                    Divider(
                      height: 2,
                      thickness: 1,
                      color: Color(0xFFDBE2E7),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: Text(
                                'Placa: ',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'ABC-1234',
                              textAlign: TextAlign.end,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Center(
                            child: Text(
                              'Tempo restante:',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CircularPercentIndicator(
                      percent: 0.5,
                      radius: 60,
                      lineWidth: 13,
                      animation: true,
                      progressColor: Colors.green,
                      backgroundColor: AppColors.corCirculoPorcentagem,
                      center: Text(
                        '1:32:00',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                      child: ButtonEstender(
                        onTap: () {
                          Navigator.pushNamed(context, "/buytickets");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
