import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shopAPP/homemodel/Getfavmodel.dart';
import 'package:untitled/layout/shopAPP/homemodel/homemodel.dart';
import 'package:untitled/layout/shopAPP/search%20screen/SEARCHMODEL.dart';
import 'package:untitled/layout/shopAPP/search%20screen/searchCUBIT.dart';
import 'package:untitled/layout/shopAPP/search%20screen/searchsatets.dart';

import '../favorites/favorites screen.dart';
class searchscreenshopp extends StatelessWidget {
var searchcontroller=TextEditingController();
final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(BuildContext context)=> shopSEARCHCUBIT(),
      child: BlocConsumer<shopSEARCHCUBIT,searchshopstate>
        (
       listener: (context,state){},
        builder: (context,state){
         return Scaffold(
             appBar: AppBar(
               title: Text(
                   'Search'
               ),
             ),
             body: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                 children: [
                   TextFormField(
                     controller: searchcontroller,


                     decoration: InputDecoration(
                       border: OutlineInputBorder(),
                       labelText: 'Search',
                       prefixIcon: Icon(Icons.search),

                     ),
onSaved: (value){
          print(value);
},
onFieldSubmitted: (value){
                       shopSEARCHCUBIT.get(context).searchdata(text: value);
},
                     validator: (String ? value){
                       if(value!.isEmpty)
                         return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                     },
                   ),
SizedBox(height: 15,),
if(state is shoppsearchsucessstate)
  Expanded(
    child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>buildSEARCHItem(shopSEARCHCUBIT.get(context).searchmodel!.data.data[index], context),
        separatorBuilder: (context, index) =>Center(child: Divider()),
        itemCount: shopSEARCHCUBIT.get(context).searchmodel!.data.data.length),
  ),
                   if(state is shoppsearchloadingstate)
                     Center(child: LinearProgressIndicator(),),
           ],
               ),
             ),
         );
        },
      ),

    );

  }
Widget buildSEARCHItem(SearchProduct model, context) =>

    SizedBox(
  height: 120.0,
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image(
            image: NetworkImage(
              '${model.image}',
            ),
            width: 120.0,
            height: 120.0,
          ),
          if (1 == 0)
            Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: const Text(
                'DISCOUNT',
                style: TextStyle(color: Colors.white, fontSize: 10.0),
              ),
            ),
        ],
      ),
      const SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(

          children: [
            Text(
              '${model.name}',
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 17.0, color: Colors.black, height: 1.0,fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  '${model.price} EGP',
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.deepOrange,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),

                const Spacer(),

              ],
            ),
          ],
        ),
      ),
    ],
  ),
);
  Widget test(context)=>
      Center(
        child: Container(child: Text('testtt'
    ,  style: TextStyle(
            fontSize: 30,
        ),
        )),
      );
}