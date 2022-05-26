import 'package:flutter/material.dart';
import 'package:star_parking_app_cidadao/Shared/themes/app_colors.dart';

import '../../Shared/themes/app_images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.telaSplash,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.logo),
            FutureBuilder(
              future: Future.delayed(
                const Duration(seconds: 0),
                    () {
                },
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Container();
                }
                return FutureBuilder(
                  future: Future.delayed(
                    const Duration(seconds: 1),
                        () {
                      Navigator.of(context).pushReplacementNamed("/home");
                    },
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                    }
                    return Container();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}