import 'package:untitled/layout/shopAPP/models/loginModel.dart';

abstract class shoploginstates {}

class shopploginintialstate extends shoploginstates{}

class shopploginloadingstate extends shoploginstates{}

class shopploginsucessstate extends shoploginstates{
  late final Shopploginmodel succesloginmodel;
  shopploginsucessstate(this.succesloginmodel);
}

class shopploginerrorstate extends shoploginstates{
  final String error;
  shopploginerrorstate(this.error);
}
class shopploginpasswordstate extends shoploginstates{}
