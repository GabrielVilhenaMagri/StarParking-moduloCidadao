import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:star_parking_app_cidadao/Shared/model/usuario_model.dart';
import 'package:clock/clock.dart';
import '../buttons/estender_button.dart';
import '../themes/app_colors.dart';
import '../themes/app_images.dart';

class UsuarioTile extends StatelessWidget{
  final UsuarioModel data;
  const UsuarioTile({Key? key, required this.data}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    var fiftyDaysFromNow = now.subtract(new Duration(hours: 3));
    var horariofinal=  fiftyDaysFromNow.add(new Duration(minutes: 2));
    var horariofinal2=  horariofinal.subtract(new Duration(seconds: 14));


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
                        "Ticket",
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
                          "Informações sobre o ticket encontrado",
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
        body:Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 40),
          child: Center(
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
                              data.placa!,
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
                 padding: EdgeInsetsDirectional.fromSTEB(0, 15, 15, 0),
                 child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: Text(
                          'Horario atual: ',
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
                       '${horariofinal2.hour}:${horariofinal2.minute}:${horariofinal2.second}',
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 5),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: CircularPercentIndicator(
                        percent: 1.0,
                        radius: 60,
                        lineWidth: 13,
                        animation: true,
                        progressColor: Colors.green,
                        backgroundColor: AppColors.corCirculoPorcentagem,
                        center: Text(
                          '${data.tempo}' ,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 46, 0, 8),
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
          ),
        ));
  }

}