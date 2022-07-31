import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shopAPP/register/registerMODEL.dart';
import 'package:untitled/layout/shopAPP/register/registerSTATES.dart';
import 'package:dio/dio.dart';
import '../network/endpoit(url).dart';
import 'package:untitled/layout/shopAPP/network/remoteshop/dio_helpershop.dart';

class shopREGISTERcubit extends Cubit<shopregisterstates> {
  shopREGISTERcubit() :super (shoppregisterintialstate());

  static shopREGISTERcubit get(context) => BlocProvider.of(context);
   ShoppREGISTERmodel? loginmodel;
  void userlogin({
    required String emailcont,
    required String passwordcont,
    required String phonecont,
    required String namecont,

  }) {
    emit(shoppregisterloadingstate());


    dioHelper1.PostData(url: REGISTER,
        data: {
          'email': emailcont,
          'password': passwordcont,
          'phone':phonecont,
          'name':namecont,
        }
    ).then((value) {
      loginmodel= ShoppREGISTERmodel.fromJson(value.data);
      print(value.data);
      print(loginmodel!.data.token);
      print(loginmodel!.status);
      print(loginmodel!.message);

      emit(shoppregistersucessstate(loginmodel!));
    }
    ).catchError((error) {
      print(error.toString());
      emit(shoppregistererrorstate(error.toString()));
    });
  }

  IconData suffixpass = Icons.visibility_outlined;
  bool ispassword = true;

  void obscurepass() {
    ispassword = !ispassword;

    suffixpass =
    ispassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(shoppregisterpasswordstate());
  }
}