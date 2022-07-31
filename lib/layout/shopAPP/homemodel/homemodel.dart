

class homemodel
{
  late bool status;
  late homedatamodel  data;

  homemodel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    data=homedatamodel.fromJson(json['data']);

  }
}
class homedatamodel
{
  List<bannermodel>banners=[];
  List<productmodel>products=[];


  homedatamodel.fromJson(Map<String,dynamic> json)
  {



      json['banners']?.forEach((element){
        banners.add(bannermodel.fromJson(element));
      });
      json['products']?.forEach((element){
        products.add(productmodel.fromJson(element));
      });

  }
}
class bannermodel
{
  int? id;
   String? image;

bannermodel.fromJson(Map<String,dynamic>json)
{
  id=json['id'];
  image=json['image'];
}


}
class productmodel
{
 late int id;
  late dynamic price;
  late dynamic oldprice;

 late dynamic discount;

late String image;
  late String name;

 late bool favorite;
  late bool incart;

  productmodel.fromJson(Map<String,dynamic>json)
  {
id=json['id'];
price=json['price'];
oldprice=json['old_price'];
discount=json['discount'];
image=json['image'];
name=json['name'];
favorite=json['in_favorites'];
incart=json['in_cart'];


  }

}