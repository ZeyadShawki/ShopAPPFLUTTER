import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shared/Network/remote/dio_helper.dart';
import 'package:untitled/layout/shopAPP/models/loginModel.dart';
import 'package:untitled/layout/shopAPP/network/endpoit(url).dart';
import 'package:untitled/layout/shopAPP/network/remoteshop/dio_helpershop.dart';
import 'package:untitled/layout/shopAPP/statesshoppapp.dart';

class shoplogincubit extends Cubit<shoploginstates> {
 shoplogincubit() :super (shopploginintialstate());

 static shoplogincubit get(context) => BlocProvider.of(context);
late Shopploginmodel loginmodel;
 void userlogin({
  required String emailcont,
  required String passwordcont,
 }) {
  emit(shopploginloadingstate());

  dioHelper1.PostData(url: LOGIN,
      data: {
       'email': emailcont,
       'password': passwordcont,
      }
  ).then((value) {
   loginmodel= Shopploginmodel.fromJson(value.data);
   print(value.data);
   print(loginmodel.data.token);
   print(loginmodel.status);
   print(loginmodel.message);

   emit(shopploginsucessstate(loginmodel));
  }
  ).catchError((error) {
   print(error.toString());
   emit(shopploginerrorstate(error.toString()));
  });
 }

 IconData suffixpass = Icons.visibility_outlined;
 bool ispassword = true;

 void obscurepass() {
  ispassword = !ispassword;

  suffixpass =
  ispassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
  emit(shopploginpasswordstate());
 }
}