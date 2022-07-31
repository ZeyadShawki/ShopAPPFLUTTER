import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shopAPP/categories/categoriesscreen.dart';
import 'package:untitled/layout/shopAPP/favorites/favorites%20screen.dart';
import 'package:untitled/layout/shopAPP/homelayout/homelayoutstates.dart';
import 'package:untitled/layout/shopAPP/homemodel/FAVmodel.dart';
import 'package:untitled/layout/shopAPP/homemodel/Getfavmodel.dart';
import 'package:untitled/layout/shopAPP/homemodel/catgories%20model.dart';
import 'package:untitled/layout/shopAPP/homemodel/homemodel.dart';
import 'package:untitled/layout/shopAPP/homeproductscreen/homeproductscreen.dart';
import 'package:untitled/layout/shopAPP/models/loginModel.dart';
import 'package:untitled/layout/shopAPP/network/endpoit(url).dart';
import 'package:untitled/layout/shopAPP/network/local/cache%20helper.dart';
import 'package:untitled/layout/shopAPP/network/remoteshop/dio_helpershop.dart';
import 'package:flutter/material.dart';
import 'package:untitled/layout/shopAPP/settings%20shopp/settengshopp.dart';

import '../register/registerMODEL.dart';

class homelayoutcubit extends Cubit<homelayoutstates> {
  homelayoutcubit() : super(shopphomeintisalstate());

  static homelayoutcubit get(context) => BlocProvider.of(context);
  int currentindex = 0;

  List<Widget> bottomscreens = [
    homeproductscreen(),
    categoriesscreen(),
    favoritesscreen(),
    settingsshoppscreen(),
  ];

  void changebottom(int index) {
    currentindex = index;
    emit(shopchangebottomnavbarstate());
    gethomedata();
    getcategoriesdata();
    getUSERdata();
    getfavoritedata();
  }

  late Map<int, bool?> favorites = {};

 late  homemodel HOMEMODEL;
 late categoriesmodel CATEGORIESMODEL;
  late changefavmodel FAVMODEL;
  getfavoyritedata? favomodel;
  Shopploginmodel? usermodel;

  void gethomedata() {
    emit(shopploadinghomedatastates());
    dioHelper1.getdata(url: HOME, Token: cachehelper.token).then((value) {
      HOMEMODEL = homemodel.fromJson(value.data);

      HOMEMODEL.data.products.forEach((element) {
        favorites.addAll({
          element.id: element.favorite,
        });
      });
      print(cachehelper.token);
      print(favorites.toString());

      emit(shoppsucceshomedatastates());
    }).catchError((error) {
      emit(shopperrorhomedatastates());
      print(error.toString());
    });
  }

  void getcategoriesdata() {
    emit(shopploadingcategoriesdatastates());
    dioHelper1.getdata(url: CATEGORIES).then((value) {
      CATEGORIESMODEL = categoriesmodel.fromJson(value.data);
      print(CATEGORIESMODEL.status);
      emit(shoppsuccescategoriesdatastates());
    }).catchError((error) {
      emit(shopperrorcategoriesdatastates());
      print(error.toString());
    });
  }

  void changefav(int productid) {
    favorites[productid] = !(favorites[productid])!;
    emit(shoppPREsuccesFavchangestates());
    dioHelper1.PostData(
            url: FAVORITES,
            data: {
              'product_id': productid,
            },
            Token: cachehelper.token)
        .then((value) {
      FAVMODEL = changefavmodel.fromjson(value.data);
      print(value.data.toString());
      if (FAVMODEL.massage == 'Deleted Successfully')
        emit(shoppsuccesFavremovechangestates());
      else {
        emit(shoppsuccesFavchangestates());
        if (!FAVMODEL.status) {
          favorites[productid] = !(favorites[productid])!;

          emit(shopperrorFAVchangestates());
        }
      }
    }).catchError((onError) {
      favorites[productid] = !(favorites[productid])!;
      emit(shopperrorFAVchangestates());
    });
  }

  void getfavoritedata() {

    dioHelper1.getdata(url: FAVORITES
    ,
      Token: cachehelper.token
    ).then((value) {
      favomodel = getfavoyritedata.fromJson(value.data);
      print('anaaaaa etbdaaaanat');
      print(value.data.toString());
      emit(shoppsuccesFavscreenstates());
    }).catchError((error) {
      emit(shopperrorFAVscreenstates());
      print(error.toString());
    });
  }
  void getUSERdata() {
emit(shopploadingUSERMODELstates());

    dioHelper1.getdata(url: PROFILE,
        Token: cachehelper.token,
    ).then((value) {
      usermodel = Shopploginmodel.fromJson(value.data);
      print('LOGINNNNNNNN');
      print(value.data.toString());
      emit(shoppsuccesUSERMODELstates());
    }).catchError((error) {
      emit(shopperrorUSERMODELstates());
      print(error.toString());
    });
  }
  ShoppREGISTERmodel? loginmodel;
  void updateUser({
    required String emailcont,
    required String passwordcont,
    required String phonecont,
    required String namecont,

  })

   {
    emit(shopploadingupdatestates());

    dioHelper1.PutData(url: UPDATEINFO,
        data: {
      'name':emailcont,
          'phone':phonecont,
          'email':emailcont,
          'password':passwordcont,
        },
      Token: cachehelper.token
    ).then((value) {
      usermodel = Shopploginmodel.fromJson(value.data);
      print('TESTTTTTTTTTTTTT');
      print(value.data.toString());
      emit(shoppsuccesupdatestates());
    }).catchError((error) {
      emit(shopperrorupdatestates());
      print(error.toString());
    });
  }


}
