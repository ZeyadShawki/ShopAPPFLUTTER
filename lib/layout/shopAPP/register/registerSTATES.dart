import 'package:untitled/layout/shopAPP/register/registerMODEL.dart';

abstract class shopregisterstates {}

class shoppregisterintialstate extends shopregisterstates{}

class shoppregisterloadingstate extends shopregisterstates{}

class shoppregistersucessstate extends shopregisterstates{
  late final ShoppREGISTERmodel succesloginmodel;
  shoppregistersucessstate(this.succesloginmodel);
}

class shoppregistererrorstate extends shopregisterstates{
  final String error;
  shoppregistererrorstate(this.error);
}
class shoppregisterpasswordstate extends shopregisterstates{}
