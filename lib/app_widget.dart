import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_page.dart';
import 'package:payflow/modules/login/login_page.dart';
import 'package:payflow/modules/splash/splash_page.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget(){
    SystemChrome.setPreferredOrientations([ //Travar rotação da tela
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payflow',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(user: ModalRoute.of(context)!.settings.arguments as UserModel),
        "/barcode_scanner": (context) => BarcodeScannerPage(),
        "/insert_boleto": (context) => InsertBoletoPage(barcode: ModalRoute.of(context) != null
                                                              ? ModalRoute.of(context)!.settings.arguments.toString()
                                                              : ""),
      },
    );
  }
}