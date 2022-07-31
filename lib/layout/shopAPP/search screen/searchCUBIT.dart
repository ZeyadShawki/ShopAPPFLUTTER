import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shopAPP/homemodel/Getfavmodel.dart';
import 'package:untitled/layout/shopAPP/homemodel/homemodel.dart';
import 'package:untitled/layout/shopAPP/network/endpoit(url).dart';
import 'package:untitled/layout/shopAPP/network/local/cache%20helper.dart';
import 'package:untitled/layout/shopAPP/network/remoteshop/dio_helpershop.dart';
import 'package:untitled/layout/shopAPP/search%20screen/SEARCHMODEL.dart';
import 'package:untitled/layout/shopAPP/search%20screen/SEARCHMODEL.dart';
import 'package:untitled/layout/shopAPP/search%20screen/SEARCHMODEL.dart';
import 'package:untitled/layout/shopAPP/search%20screen/searchsatets.dart';

import '../models/loginModel.dart';
import 'SEARCHMODEL.dart';

class shopSEARCHCUBIT extends Cubit<searchshopstate>
{
  shopSEARCHCUBIT():super (shoppsearchintialstate());
  static shopSEARCHCUBIT get(context)=>BlocProvider.of(context);

  SearchModel? searchmodel;

  void searchdata({

   required String? text})
  {
    emit(shoppsearchloadingstate());
dioHelper1.PostData(
    url: SEARCH,
    Token: cachehelper.token,
    data:
{
  'text':text,
}
).then((value) {
  searchmodel=SearchModel.fromJson(value.data);
  print(value.data.toString());
  emit(shoppsearchsucessstate());

}).catchError((onError){
  emit(shoppsearcherrorstate(onError));
  print(onError.toString());

});

  }

}