import 'package:buildcondition/buildcondition.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shopAPP/homelayout/homelayoutcubit.dart';
import 'package:untitled/layout/shopAPP/homelayout/homelayoutstates.dart';
import 'package:untitled/layout/shopAPP/homemodel/catgories%20model.dart';
import 'package:untitled/layout/shopAPP/homemodel/homemodel.dart';


class categoriesscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homelayoutcubit,homelayoutstates>(
      listener: (context,state){},
      builder: (context,state)=>BuildCondition(
        condition:state is shoppsucceshomedatastates,
        builder: (context)=>
        ListView.separated(

          itemBuilder:(context,index) =>buildcatitem(homelayoutcubit.get(context).CATEGORIESMODEL.data.productdata[index]) ,
          itemCount: homelayoutcubit.get(context).CATEGORIESMODEL.data.productdata.length,
          separatorBuilder:(context,index) =>Divider(),
        ),

        fallback: (context)=>Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
Widget buildcatitem(catData model)
{
  return Row(
    children: [
      Image(image:
      NetworkImage(
        model.image,
      ),
        height: 150,
        width: 150,
      ),
      SizedBox(width: 20,),
      Text(
        model.name,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 20,

          fontWeight: FontWeight.bold,
        ),

      ),
      Spacer(),
      Icon(Icons.arrow_forward_ios),

    ],
  );
}

}
