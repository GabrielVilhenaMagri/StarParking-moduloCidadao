import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:star_parking_app_cidadao/Shared/buttons/button_cancelar.dart';
import '../../Shared/buttons/button_prosseguir.dart';
import '../../Shared/themes/app_colors.dart';

class BuyTickets extends StatefulWidget {
  const BuyTickets({Key? key}) : super(key: key);

  @override
  _BuyTicketsState createState() => _BuyTicketsState();
}


enum Pagamento { pix, cartao }

class _BuyTicketsState extends State<BuyTickets> {
  final formKey = GlobalKey<FormState>();
  // final controller = InsertTextController();
  CollectionReference functions = FirebaseFirestore.instance.collection("usuarios");


  final PlacaInputTextController = MaskedTextController(mask: "AAA-0000");
  final CpfInputTextController = MaskedTextController(mask: "000.000.000-00");

  String generateRandomString(int len) {
    var r = Random();
    const _chars = '1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  }


  DateFormat dateFormat = DateFormat("HH:mm:ss");



  String _tempo = "00:30:00";
  Pagamento pagamento = Pagamento.pix;


  @override
  Widget build(BuildContext context) {
    String _name = '';
    String string = dateFormat.format(DateTime.now().subtract(Duration(hours: 3)));

    final size = MediaQuery.of(context).size;




    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(50, 40, 0, 0),
                  child: Text(
                    "Comprar ticket",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(31, 0, 8, 8),
                        child: Text(
                            "Compre seus tickets através\nde diversas formas de pagamento.",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
            actions: [],
            elevation: 0,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(35, 62, 88, 7),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left:40),
                        child: Expanded(
                            child: Text("Placa",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                )),
                          ),
                      ),
                         Padding(
                           padding: EdgeInsets.only(left:186),
                           child: Expanded(
                              child: Text("CPF",
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ))),
                         ),
                    ],
                  )),
              Form(
                key: formKey,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Container(
                        width: size.width * 0.3,
                        height: size.height * 0.08,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0.5,
                                color: AppColors.corPesquisar,
                                offset: Offset(0.5, 0.5),
                              )
                            ],
                            borderRadius: BorderRadius.circular(25),
                            border: Border.fromBorderSide(
                                BorderSide(color: AppColors.corBorda))),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 9, 0, 0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10, 2, 0, 4),
                                      child: TextFormField(
                                        validator: (text){
                                          if(text == null || text.isEmpty){
                                            return "Não pode ser vazio";
                                          }
                                          if(text.length < 7){
                                            return "Campo incompleto";
                                          }

                                      },
                                        onChanged: (text) => setState(() => _name = text),
                                        controller: PlacaInputTextController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: "ABC-1234",
                                          hintStyle: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.corHintText,
                                          ),
                                          labelStyle: GoogleFonts.poppins(
                                            fontSize: 3,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    AppColors.corTransparente,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppColors.corTransparente,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 81.0),
                      child: Container(
                        width: size.width * 0.40,
                        height: size.height * 0.08,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0.5,
                                color: AppColors.corPesquisar,
                                offset: Offset(0.5, 0.5),
                              )
                            ],
                            borderRadius: BorderRadius.circular(25),
                            border: Border.fromBorderSide(
                                BorderSide(color: AppColors.corBorda))),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 9, 0, 0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10, 2, 0, 4),
                                      child: TextFormField(
                                        validator: (text){
                                          if(text == null || text.isEmpty){
                                            return "Não pode ser vazio";
                                          }
                                          if(text.length < 11){
                                            return "Campo incompleto";
                                          }

                                        },
                                        onChanged: (text) => setState(() => _name = text),
                                        controller: CpfInputTextController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: "123.456.789-00",
                                          hintStyle: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.corHintText,
                                          ),
                                          labelStyle: GoogleFonts.poppins(
                                            fontSize: 3,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    AppColors.corTransparente,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppColors.corTransparente,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(25, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 200,
                      height: 270,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Escolha o tempo:',
                          ),
                          Divider(
                            height: 7,
                            thickness: 1,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 7),
                            child: Container(
                              child: Column(
                                children: [
                                  ListTile(
                                      title: Text("30 min: (R\$ 12,00)"),
                                      leading: Radio(
                                          value: "00:30:00",
                                          groupValue: _tempo,
                                          onChanged: (value) {
                                            setState(() {
                                              _tempo ="00:30:00";
                                            });
                                          })),
                                  ListTile(
                                      title: Text("1 hora  (R\$ 20,00)"),
                                      leading: Radio(
                                          value: "01:00:00",
                                          groupValue: _tempo,
                                          onChanged: (value) {
                                            setState(() {
                                              _tempo = "01:00:00";
                                            });
                                          })),
                                  ListTile(
                                      title: Text("2 horas  (R\$ 27,00)"),
                                      leading: Radio(
                                          value: "02:00:00",
                                          groupValue:  _tempo,
                                          onChanged: (value) {
                                            setState(() {
                                              _tempo = "02:00:00";
                                            });
                                          })),
                                  ListTile(
                                      title: Text("3 horas  (R\$ 32,00)"),
                                      leading: Radio(
                                          value: "03:00:00",
                                          groupValue: _tempo,
                                          onChanged: (value) {
                                            setState(() {
                                              _tempo = "03:00:00";
                                            });
                                          })),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                      child: Container(
                        width: 145,
                        height: 144,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text('Meio de pagamento:'),
                            Divider(
                              height: 7,
                              thickness: 1,
                            ),
                            Column(
                              children: [
                                ListTile(
                                    title: Text("Pix"),
                                    leading: Radio(
                                        value: Pagamento.pix,
                                        groupValue: pagamento,
                                        onChanged: (value) {
                                          setState(() {
                                            pagamento = Pagamento.pix;
                                          });
                                        })),
                                ListTile(
                                    title: Text("Cartão"),
                                    leading: Radio(
                                        value: Pagamento.cartao,
                                        groupValue: pagamento,
                                        onChanged: (value) {
                                          setState(() {
                                            pagamento = Pagamento.cartao;
                                          });
                                        })),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(45, 40, 87, 20),
                    child: ButtonCancelar(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/home");
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 40, 20, 20),
                    child: ButtonProsseguir(
                      onTap: () async {
                        final isValidForm =
                            formKey.currentState!.validate();
                        if (isValidForm) {
                            await functions.add({
                                  "placa": PlacaInputTextController.text,
                                  "cpf": CpfInputTextController.text,
                            "tempo": _tempo,
                              "hora_comprada": string,
                            "ticket": generateRandomString(5)});
                          if (pagamento.index == 0) {
                            Navigator.pushNamed(context, "/pixpage");
                          } else {
                            Navigator.pushNamed(context, "/cartaopage");
                          }
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
