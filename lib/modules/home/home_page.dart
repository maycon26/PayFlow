import 'dart:async';

import 'package:flutter/material.dart';
import 'package:payflow/modules/extract/extract_page.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  // final pages = [
  //   MeusBoletosPage(
  //     key: UniqueKey(),
  //   ),
  //   ExtractPage(
  //     key: UniqueKey(),
  //   ),
  // ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(112),
        child: Container(
          height: 112,
          color: AppColors.primary,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListTile(
                title: Text.rich(
                  TextSpan(
                    text: "Olá, ",
                    style: AppTextStyles.titleRegular,
                    children: [
                      TextSpan(text: "${widget.user.name}", style: AppTextStyles.titleBoldBackground),
                    ]
                  ),
                ),
                subtitle: Text("Mantenha suas contas em dia", style: AppTextStyles.captionShape),
                trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black,
                    image: DecorationImage(
                      image: NetworkImage(widget.user.photoURL!)
                    )
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

      body: [
        MeusBoletosPage(),
        ExtractPage()
      ][controller.currentPage],

      bottomNavigationBar: Container(
        height: 90,
        //color: AppColors.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: (){
                  controller.setPage(0);
                  setState(() {});
                },
                icon: Icon(
                  Icons.home_outlined,
                  color: controller.currentPage == 0 ? AppColors.primary : AppColors.body,
                )),
            GestureDetector(
              onTap: () async{
                Navigator.pushNamed(context, '/barcode_scanner').then((_) {
                  // This block runs when you have returned back to the 1st Page from 2nd.
                  setState(() {});
                });
                // Navigator.of(context)
                //     .pushNamed("/barcode_scanner")
                //     .then((value) => setState(() => {}));
                //await Navigator.pushNamed(context, "/barcode_scanner");
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primary,
                ),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),

            IconButton(
              onPressed: () {
                controller.setPage(1);
                setState(() {});
              },
              icon: Icon(
                Icons.description_outlined,
                color: controller.currentPage == 1 ? AppColors.primary : AppColors.body,
              ),),
          ],
        ),
      ),
    );
  }
}
