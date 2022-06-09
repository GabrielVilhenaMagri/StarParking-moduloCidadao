import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_parking_app_cidadao/Shared/buttons/button_cancelar.dart';

import '../../Shared/buttons/button_prosseguir.dart';
import '../../Shared/buttons/button_search.dart';
import '../../Shared/buttons/radio_button_tempo.dart';
import '../../Shared/label/label_sytle.dart';
import '../../Shared/themes/app_colors.dart';
import '../../Shared/themes/app_text_styles.dart';
import 'controller_text.dart';

class BuyTickets extends StatefulWidget {
  const BuyTickets({Key? key}) : super(key: key);


  @override
  _BuyTicketsState createState() => _BuyTicketsState();
}
enum Tempo { trintaMinutos, umaHora, duasHoras, tresHoras }
enum Pagamento { pix, cartao}

class _BuyTicketsState extends State<BuyTickets> {

  final controller = InsertTextController();

  final PlacaInputTextController = MaskedTextController(mask: "AAA-0000");
  final CpfInputTextController = MaskedTextController(mask: "000.000.000-00");
  Tempo tempo = Tempo.trintaMinutos;
  Pagamento pagamento = Pagamento.pix;
  @override
  Widget build(BuildContext context) {
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Expanded(
                          child: Text("Placa do veículo",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      Expanded(
                          child: Text("CPF/CNPJ",
                              textAlign: TextAlign.right,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              )))
                    ],
                  )),
              Form(
                key: controller.formKey,
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
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(4, 9, 0, 0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(10,2,0,4),
                                      child: TextFormField(
                                        validator: controller.validatePlaca,
                                        controller: PlacaInputTextController,
                                        onChanged: (value){
                                          controller.onChange(placa: value);
                                        },
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
                                                color: AppColors.corTransparente,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(8)),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppColors.corTransparente,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
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
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(4, 9, 0, 0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(10,2,0,4),
                                      child: TextFormField(
                                        validator: controller.validateCpf,
                                        controller: CpfInputTextController,
                                        onChanged: (value){
                                          controller.onChange(cpf: value);
                                        },
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
                                                color: AppColors.corTransparente,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(8)),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppColors.corTransparente,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
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
                              child: Column(children: [
                                ListTile(
                                    title: Text("30 min"),
                                    leading: Radio(
                                        value: Tempo.trintaMinutos,
                                        groupValue: tempo,
                                        onChanged: (value) {
                                          controller.onChange(tempo: "0:30:00");
                                          })
                                        ),
                                ListTile(
                                    title: Text("1 hora"),
                                    leading: Radio(
                                        value: Tempo.umaHora,
                                        groupValue: tempo,
                                        onChanged: (value) {
                                          controller.onChange(tempo: "1:00:00");
                                        })),
                                ListTile(
                                    title: Text("2 horas"),
                                    leading: Radio(
                                        value: Tempo.duasHoras,
                                        groupValue: tempo,
                                        onChanged: (value) {
                                          controller.onChange(tempo: "2:00:00");
                                        })),
                                ListTile(
                                    title: Text("3 horas"),
                                    leading: Radio(
                                        value: Tempo.tresHoras,
                                        groupValue: tempo,
                                        onChanged: (value) {
                                          controller.onChange(tempo: "3:00:00");
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
                            Column(children: [
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
                    child: ButtonProsseguir(onTap: () {
                      final isValidForm = controller.formKey.currentState!.validate();
                      if(isValidForm){
                        if (pagamento.index == 0) {
                          Navigator.pushNamed(context, "/pixpage");
                        }else{
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
