import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{
  UserModel? _user; //"?" pode ser null antes de logar

  UserModel get user => _user!; //"!" só funciona caso não seja null

  void setUser(BuildContext context, UserModel? user){ //Coloca o usuário logado como atual
    if(user != null){
      saveUser(user);
      _user = user;
      Navigator.pushReplacementNamed(context, "/home", arguments: user); //Push: tem como voltar. PushReplacement substitui a página
    }
    else{
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(UserModel user) async{
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
  }

  Future<void> currentUser(BuildContext context) async{ //Verifica se há usuário logado
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));

    if(instance.containsKey("user")){
      final json = instance.getString("user") as String;
      setUser(context, UserModel.fromJson(json));
    }
    else{
      setUser(context, null);
    }
  }
}