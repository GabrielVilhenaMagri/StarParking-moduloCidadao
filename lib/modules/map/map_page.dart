
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Shared/buttons/button_search.dart';
import '../../Shared/buttons/buttonsheet_compra.dart';
import '../../Shared/label/label_sytle.dart';
import '../../Shared/themes/app_colors.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  late GoogleMapController mapController;
  Set<Marker> markers = Set<Marker>();
  double lat = -22.9064;
  double long = -47.0616;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

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
          automaticallyImplyLeading: true,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 40, 0, 0),
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(40, 40, 0, 0),
                    child: Text("Mapa",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        )),
                  ),
                ],
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
                              hintText: "Digite aqui",
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
                            lat = -22.8340787;
                            long = -47.054842617;

                            LatLng position = LatLng(lat, long);
                            mapController
                                .moveCamera(CameraUpdate.newLatLng(position));
                          },
                        )),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width,
              height: size.height,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                onCameraMove: (data) {
                  print(data);
                },
                onTap: (position) {
                  print(position);
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(lat, long),
                  zoom: 15.0,
                ),
                markers: {
                  Marker(
                      markerId: MarkerId('PrimeiroPonto'),
                      position: LatLng(-22.83493249551522, -47.048471085727215),
                      infoWindow: InfoWindow(
                          title: 'Zona azul 1',
                          snippet: 'Rua Pedro Santos',
                          onTap: () {
                            showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                )
                              ),
                              context: context,
                              builder: (context) => Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Center(
                                      child: Text("Rua Pedro Santos",
                                style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),),
                                    ),
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(8, 12, 8, 10),
                                          child: Text(
                                            'Tempo máximo: ',
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
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 11, 10),
                                          child: Text(
                                            '3 horas',
                                            textAlign: TextAlign.end,
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(8, 12, 8, 10),
                                          child: Text(
                                            'Valor do ticket:',
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
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 8, 10),
                                          child: Text(
                                            "R\$ 12,00",
                                            textAlign: TextAlign.end,
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(8, 12, 8, 10),
                                          child: Text(
                                            'Vagas disponíveis: ',
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
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 49, 10),
                                          child: Text(
                                            '15',
                                            textAlign: TextAlign.end,
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  Center(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0,10,0,8),
                                          child: ButtonSheetComprar(
                                            onTap: () {
                                              Navigator.pushNamed(context, "/buytickets");
                                            },),
                                        )),

                                ],
                              )
                            );
                          }),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueRed,
                      )),
                  Marker(
                      markerId: MarkerId('SegundoPonto'),
                      position: LatLng(-22.831376792549012, -47.0492834597826),
                      infoWindow: InfoWindow(
                          title: 'Zona azul 2',
                          snippet: 'Rua Wesleyh Plio',
                          onTap: () {
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    )
                                ),
                                context: context,
                                builder: (context) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:8.0),
                                      child: Center(
                                        child: Text("Rua Wesleyh Plio",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),),
                                      ),
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(8, 12, 8, 10),
                                            child: Text(
                                              'Tempo máximo: ',
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
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 11, 10),
                                            child: Text(
                                              '2 horas',
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(8, 12, 8, 10),
                                            child: Text(
                                              'Valor do ticket:',
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
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 8, 10),
                                            child: Text(
                                              "R\$ 12,00",
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(8, 12, 8, 10),
                                            child: Text(
                                              'Vagas disponíveis: ',
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
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 49, 10),
                                            child: Text(
                                              '15',
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                    Center(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0,10,0,8),
                                          child: ButtonSheetComprar(
                                            onTap: () {
                                              Navigator.pushNamed(context, "/buytickets");
                                            },),
                                        )),

                                  ],
                                )
                            );
                          }),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueRed,
                      )),
                  Marker(
                      markerId: MarkerId('TerceiroPonto'),
                      position: LatLng(-22.836636307738218, -47.051447331905365),
                      infoWindow: InfoWindow(
                          title: 'Zona azul 3',
                          snippet: 'Rua Klebio Nunes',
                          onTap: () {
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    )
                                ),
                                context: context,
                                builder: (context) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:8.0),
                                      child: Center(
                                        child: Text("Rua Klebio Nunes",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),),
                                      ),
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(8, 12, 8, 10),
                                            child: Text(
                                              'Tempo máximo: ',
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
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 11, 10),
                                            child: Text(
                                              '3 horas',
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(8, 12, 8, 10),
                                            child: Text(
                                              'Valor do ticket:',
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
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 8, 10),
                                            child: Text(
                                              "R\$ 16,50",
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(8, 12, 8, 10),
                                            child: Text(
                                              'Vagas disponíveis: ',
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
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 49, 10),
                                            child: Text(
                                              '19',
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                    Center(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0,10,0,8),
                                          child: ButtonSheetComprar(
                                            onTap: () {
                                              Navigator.pushNamed(context, "/buytickets");
                                            },),
                                        )),

                                  ],
                                )
                            );
                          }),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueRed,
                      )),
                  Marker(
                      markerId: MarkerId('QuartoPonto'),
                      position: LatLng(-22.829885514134638, -47.0465372130274),
                      infoWindow: InfoWindow(
                          title: 'Zona azul 4',
                          snippet: 'Rua Henrique Pereira',
                          onTap: () {
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    )
                                ),
                                context: context,
                                builder: (context) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:8.0),
                                      child: Center(
                                        child: Text("Rua Henrique Pereira",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),),
                                      ),
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(8, 12, 8, 10),
                                            child: Text(
                                              'Tempo máximo: ',
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
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 22, 10),
                                            child: Text(
                                              '1 hora',
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(8, 12, 8, 10),
                                            child: Text(
                                              'Valor do ticket:',
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
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 8, 10),
                                            child: Text(
                                              "R\$ 12,00",
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(8, 12, 8, 10),
                                            child: Text(
                                              'Vagas disponíveis: ',
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
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 54, 10),
                                            child: Text(
                                              '9',
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                    Center(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0,10,0,8),
                                          child: ButtonSheetComprar(
                                            onTap: () {
                                              Navigator.pushNamed(context, "/buytickets");
                                            },),
                                        )),

                                  ],
                                )
                            );
                          }),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueRed,
                      )),
                  Marker(
                      markerId: MarkerId('QuintoPonto'),
                      position:  LatLng(-22.83793099300291, -47.054367922246456),
                      infoWindow: InfoWindow(
                          title: 'Zona azul 5',
                          snippet: 'Rua Navalho Ferreira',
                          onTap: () {
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    )
                                ),
                                context: context,
                                builder: (context) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:8.0),
                                      child: Center(
                                        child: Text("Rua Navalho Ferreira",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),),
                                      ),
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(8, 12, 8, 10),
                                            child: Text(
                                              'Tempo máximo: ',
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
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 11, 10),
                                            child: Text(
                                              '2 horas',
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(8, 12, 8, 10),
                                            child: Text(
                                              'Valor do ticket:',
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
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 8, 10),
                                            child: Text(
                                              "R\$ 23,00",
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(8, 12, 8, 10),
                                            child: Text(
                                              'Vagas disponíveis: ',
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
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 49, 10),
                                            child: Text(
                                              '12',
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                    Center(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0,10,0,8),
                                          child: ButtonSheetComprar(
                                            onTap: () {
                                              Navigator.pushNamed(context, "/buytickets");
                                            },),
                                        )),

                                  ],
                                )
                            );
                          }),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueRed,
                      )),
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
