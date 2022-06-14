import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_parking_app_cidadao/Shared/buttons/button_cancelar.dart';
import '../../Shared/buttons/button_prosseguir.dart';
import '../../Shared/themes/app_colors.dart';



class CartaoPage extends StatefulWidget {
  const CartaoPage({Key? key}) : super(key: key);

  @override
  _CartaoPageState createState() => _CartaoPageState();
}



class _CartaoPageState extends State<CartaoPage> {
  final formKey = GlobalKey<FormState>();
  String _name = '';
  Random randomico = Random();
  final CvvInputTextController = MaskedTextController(mask: "000");
  final NumeroCartaoInputTextController =
      MaskedTextController(mask: "0000 0000 0000 0000");
  final ValidadeCartaoInputTextController = MaskedTextController(mask: "00/00");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
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
                    "Dados do cartão",
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
                        child: Text("Insira os dados do seu cartão de crédito.",
                            textAlign: TextAlign.start,
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
        body: Form(
          key: formKey,
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(35, 62, 0, 7),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 80, 0),
                      child: Expanded(
                        child: Text("Número do cartão",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(42, 0, 0, 0),
                      child: Expanded(
                          child: Text("Validade",
                              textAlign: TextAlign.right,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ))),
                    )
                  ],
                )),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: size.width * 0.5,
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
                                  EdgeInsetsDirectional.fromSTEB(10, 2, 0, 4),
                              child: TextFormField(
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return "Não pode ser vazio";
                                  }
                                  if (text.length < 16) {
                                    return "Campo incompleto";
                                  }
                                },
                                onChanged: (text) =>
                                    setState(() => _name = text),
                                controller: NumeroCartaoInputTextController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: "0000 0000 0000 0000",
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
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
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
                                  EdgeInsetsDirectional.fromSTEB(10, 2, 0, 4),
                              child: TextFormField(
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return "Não pode ser vazio";
                                  }
                                  if (text.length < 4) {
                                    return "Campo incompleto";
                                  }
                                },
                                onChanged: (text) =>
                                    setState(() => _name = text),
                                controller: ValidadeCartaoInputTextController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: "00/00",
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
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(35, 62, 0, 7),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                      child: Expanded(
                        child: Text("Nome impresso no cartão",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(25.5, 0, 0, 0),
                      child: Expanded(
                          child: Text("CVV",
                              textAlign: TextAlign.right,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ))),
                    )
                  ],
                )),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: size.width * 0.5,
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
                                  EdgeInsetsDirectional.fromSTEB(10, 2, 0, 4),
                              child: TextFormField(
                                validator: (text){
                                  if(text == null || text.isEmpty){
                                    return "Não pode ser vazio";
                                  }
                                  if(text.length < 3){
                                    return "Campo incompleto";
                                  }
                                },
                                onChanged: (text) => setState(() => _name = text),
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: "Adailton S Pereira",
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
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
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
                                  EdgeInsetsDirectional.fromSTEB(10, 2, 0, 4),
                              child: TextFormField(
                                validator: (text){
                                  if(text == null || text.isEmpty){
                                    return "Não pode ser vazio";
                                  }
                                  if(text.length < 3){
                                    return "Campo incompleto";
                                  }
                                },
                                onChanged: (text) => setState(() => _name = text),
                                controller: CvvInputTextController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: "000",
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
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(47, 206, 87, 20),
                  child: ButtonCancelar(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 206, 20, 20),
                    child: ButtonProsseguir(onTap: () {
                      final isValidForm =
                          formKey.currentState!.validate();
                      if (isValidForm) {
                        if (randomico.nextBool() == true) {
                          Navigator.pushNamed(context, "/erropage");
                        } else {
                          Navigator.pushNamed(context, "/sucessopage");
                        }
                      }
                    }))
              ],
            ),
          ]),
        ));
  }
}
