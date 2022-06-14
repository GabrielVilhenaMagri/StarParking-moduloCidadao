import 'package:flutter/material.dart';
import 'package:star_parking_app_cidadao/modules/home/home_page.dart';
import 'package:star_parking_app_cidadao/modules/splash/splash_page.dart';

import 'Shared/themes/app_colors.dart';
import 'modules/buytickets/buy_tickets_page.dart';
import 'modules/buytickets/cartão_page.dart';
import 'modules/buytickets/erro_page.dart';
import 'modules/buytickets/pix_page.dart';
import 'modules/buytickets/sucesso_page.dart';
import 'modules/map/map_page.dart';
import 'modules/mytickets/my_tickets.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StarParking - app_cidadão',
      theme: ThemeData(primaryColor: AppColors.background),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => MyApp(),
        "/home": (context) => HomePage(),
        "/mytickets":(context) => MyTickets(),
        "/map": (context) => Map(),
        "/buytickets": (context) => BuyTickets(),
        "/cartaopage": (context) => CartaoPage(),
        "/sucessopage": (context) => SucessoPage(),
        "/erropage": (context) => ErroPage(),
        "/pixpage": (context) => PixPage(),
      },
    );
  }
}
