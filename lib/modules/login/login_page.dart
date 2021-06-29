import 'package:flutter/material.dart';
import 'package:payflow/shared/social_login/social_login_button.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              color: AppColors.primary,
              width: size.width,
              height: size.height * 0.39,
            ),
            Positioned(
              top: size.height * 0.08,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.person,
                height: size.height * 0.46, //Proporção da imagem na tela
              )
            ),
            Positioned(
              left: 0,
              right: 0,
              top: size.height * 0.56,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Image.asset(AppImages.logomini)),
                  Padding(
                    padding: const EdgeInsets.only(left: 70 , right: 70, top: 10), //18% de cada lado
                    child: Text(
                      "Organize seus\nboletos em um\nsó lugar",
                      style: AppTextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40, top: 16),
                    child: SocialLoginButton(onTap: (){
                      controller.googleSignIn(context);
                    }),
                  )
                ],
              )
            )

          ],
        ),
      ),
    );
  }
}
