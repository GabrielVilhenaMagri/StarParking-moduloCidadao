

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:star_parking_app_cidadao/Shared/model/usuario_model.dart';

class InsertTextController {
  // final functions = FirebaseFunctions.instance;
  final formKey =  GlobalKey<FormState>();
  UsuarioModel model = UsuarioModel();

  String? validatePlaca(String? value) =>
      value?.isEmpty ?? true ? "Campo obrigatório": null;
  String? validateCpf(String? value) =>
      value?.isEmpty ?? true ? "Campo obrigatório": null;


  void onChange({String? placa, String? cpf, String? tempo}) {
      model = model.copyWith(placa: placa, cpf: cpf, tempo: tempo);
  }

   Future<void> saveUsuario() async{
      final instance = await SharedPreferences.getInstance();
      final usuarios = instance.getStringList("usuarios") ?? <String>[];
      usuarios.add(model.toJson());
      await instance.setStringList("usuario", usuarios);
      return;
  }

  Future <void> cadastrarUsuario() async{
    final form = formKey.currentState;
    if(form!.validate()){
       saveUsuario();
    }
  }

}