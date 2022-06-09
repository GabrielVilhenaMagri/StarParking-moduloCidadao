import 'dart:convert';

import 'package:flutter/material.dart';

class UsuarioModel {
  final String? placa;
  final String? cpf;
  final String? tempo;

  UsuarioModel({
    this.placa,
    this.cpf,
    this.tempo
});

  UsuarioModel copyWith({
    String? placa,
    String? cpf,
    String? tempo,
}) {
    return UsuarioModel(
      placa: placa ?? this.placa,
      cpf: cpf ?? this.cpf,
      tempo: tempo ?? this.tempo,
    );
  }

  Map<String, dynamic> toMap () {
    return{
      'placa': placa,
      'cpf': cpf,
      'tempo': tempo,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      placa: map['placa'],
      cpf: map['cpf'],
      tempo: map['tempo']
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) => UsuarioModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UsuarioModel(placa: $placa, cpf: $cpf)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UsuarioModel &&
    other.placa == placa &&
    other.cpf == cpf &&
    other.tempo == tempo;

  }

  @override
  int get hashCode{
    return placa.hashCode ^
    cpf.hashCode ^
    tempo.hashCode;
  }
}