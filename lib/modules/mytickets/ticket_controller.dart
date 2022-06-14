import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../Shared/buttons/estender_button.dart';
import '../../Shared/themes/app_colors.dart';
import '../../Shared/themes/app_images.dart';


class UsuarioSearchPage extends SearchDelegate {


  CollectionReference _firebaseFirestore =
  FirebaseFirestore.instance.collection('usuarios');

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    DateTime now = new DateTime.now();
    var fiftyDaysFromNow = now.subtract(new Duration(hours: 3));
    var horariofinal2 = fiftyDaysFromNow.subtract(new Duration(seconds: 14));

    return StreamBuilder<QuerySnapshot>(
        stream: _firebaseFirestore.snapshots().asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Center(child: CircularProgressIndicator())]);
          } else {
            if (snapshot.data!.docs
                .where((QueryDocumentSnapshot<Object?> element) =>
                element['placa']
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()))
                .isEmpty) {
              return Center(
                child: Text("Nenhuma placa encontrada"),
              );
            }
            if (snapshot.data!.docs
                .where((QueryDocumentSnapshot<Object?> element) =>
                element['placa']
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()))
                .isEmpty) {
              return Center(
                child: Text("Nenhuma placa encontrada"),
              );
            }
            else {
              return ListView(
                children: [
                  ...snapshot.data!.docs
                      .where((QueryDocumentSnapshot<Object?> element) =>
                      element['placa']
                          .toString()
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                      .map((QueryDocumentSnapshot<Object?> data) {
                    final String placa = data['placa'];
                    final String tempo = data['tempo'];
                    final String ticket = data['ticket'];
                    final String horario_compra = data['hora_comprada'];



                    return Container(
                        child: Padding(
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 16, 8),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(91, 0, 83, 0),
                                            child: Text(
                                              'ticket: $ticket',
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              child: Expanded(
                                                  child: Image.asset(AppImages
                                                      .imageTicketBlue)))
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 2,
                                      thickness: 1,
                                      color: Color(0xFFDBE2E7),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 12, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 8, 0),
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
                                              placa,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 15, 15, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 8, 0),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 70, 0, 5),
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
                                        backgroundColor:
                                        AppColors.corCirculoPorcentagem,
                                        center: Text(
                                          tempo,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 46, 0, 8),
                                      child: ButtonEstender(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/buytickets");
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));
                  })
                ],
              );
            }
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
