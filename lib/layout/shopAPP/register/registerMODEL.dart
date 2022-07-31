class ShoppREGISTERmodel
{
  late bool status;
  late  String message;
  late userdata data;
  ShoppREGISTERmodel.fromJson(Map<String,dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = (json['data']!=null ? userdata.fromJson(json['data']):null)!;

  }
}

class userdata
{
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late String token;
  late int points;
  late int credit;

  userdata.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];

  }
}