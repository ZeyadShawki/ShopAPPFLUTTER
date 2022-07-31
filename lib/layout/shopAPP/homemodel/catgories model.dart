import 'package:untitled/layout/shopAPP/homemodel/catgories%20model.dart';

import 'catgories model.dart';
import 'catgories model.dart';

class categoriesmodel
{
late bool status;
late catgeoriesdata data;
  categoriesmodel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    data=catgeoriesdata.fromJson(json['data']);
  }
}
class catgeoriesdata
{
 late int currentpage;
late List<catData>productdata=[];

 catgeoriesdata.fromJson(Map<String,dynamic> json)
 {
   currentpage=json['current_page'];

    json['data']?.forEach((element){
      productdata.add(catData.fromJson(element));
    });
 }

}
class catData
{
 late int id;
 late String name;
 late String image;
 catData.fromJson(Map<String,dynamic> json)
 {
   id=json['id'];
   name=json['name'];
   image=json['image'];
 }

}