import 'package:flutter/material.dart';

class RadioButtonTempo extends StatefulWidget {
  @override
  State<RadioButtonTempo> createState() => _RadioButtonTempoState();
}

enum Tempo { trintaMinutos, umaHora, duasHoras, tresHoras }

class _RadioButtonTempoState extends State<RadioButtonTempo> {
  Tempo? _tempo = Tempo.trintaMinutos;
  Object group = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
          ListTile(
              title: Text("30 min"),
              leading: Radio(
                  value: Tempo.trintaMinutos,
                  groupValue: _tempo,
                  onChanged: (Tempo? value) {
                    setState(() {
                      _tempo = value;
                    });
                  })),
          ListTile(
              title: Text("1 hora"),
              leading: Radio(
                  value: Tempo.umaHora,
                  groupValue: _tempo,
                  onChanged: (Tempo? value) {
                    setState(() {
                      _tempo = value;
                    });
                  })),
          ListTile(
              title: Text("2 horas"),
              leading: Radio(
                  value: Tempo.duasHoras,
                  groupValue: _tempo,
                  onChanged: (Tempo? value) {
                    setState(() {
                      _tempo = value;
                    });
                  })),
          ListTile(
              title: Text("3 horas"),
              leading: Radio(
                  value: Tempo.tresHoras,
                  groupValue: _tempo,
                  onChanged: (Tempo? value) {
                    setState(() {
                      _tempo = value;
                    });
                  })),
        ],
      ),

    );
  }
}
