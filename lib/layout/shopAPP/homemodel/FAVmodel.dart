class changefavmodel
{
  late bool status;
  late String massage;
changefavmodel.fromjson(Map<String,dynamic>json)
{
  status=json['status'];
  massage=json['message'];
}
}