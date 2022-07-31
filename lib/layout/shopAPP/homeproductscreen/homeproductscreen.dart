

import 'package:buildcondition/buildcondition.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shared/components/components.dart';
import 'package:untitled/layout/shopAPP/homelayout/homelayoutcubit.dart';
import 'package:untitled/layout/shopAPP/homelayout/homelayoutstates.dart';
import 'package:untitled/layout/shopAPP/homemodel/catgories%20model.dart';
import 'package:untitled/layout/shopAPP/homemodel/homemodel.dart';


class homeproductscreen extends StatelessWidget {
  homeproductscreen( );


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homelayoutcubit,homelayoutstates>(
      listener: (context,state){
        if(state is shoppsuccesFavchangestates)
          toast(massege: 'item added to favorites', state: toaststates.succes);
      else  if(state is shoppsuccesFavremovechangestates)
          toast(massege: 'removed from favorites', state: toaststates.succes);

        else if(state is shopperrorFAVchangestates)
          toast(massege: 'faild to added to favorites', state: toaststates.succes);


      },
      builder: (context,state)=>BuildCondition(
        condition:  state is shoppsucceshomedatastates||state is shoppsuccesFavchangestates||state is shopperrorFAVchangestates || state is shoppPREsuccesFavchangestates ||state is shoppsuccesFavremovechangestates,
        builder: (context)=>homebuilershopp(homelayoutcubit.get(context).HOMEMODEL,homelayoutcubit.get(context).CATEGORIESMODEL,context),

        fallback: (context)=>Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget homebuilershopp(homemodel model,categoriesmodel catMODEL,context)
  {
    return SingleChildScrollView(
physics: BouncingScrollPhysics(),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,

        children: [
          CarouselSlider(items:
          model.data.banners.map((e) => Image(image:
          NetworkImage(
            '${e.image}',
          ),
            width: double.infinity,
            fit: BoxFit.cover,
          ),).toList()
              , options: CarouselOptions(
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                height: 250,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                scrollDirection: Axis.horizontal,
              )),
          SizedBox(height: 20,),
          Container(
            child: Text(
              'Categories',
textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,

              ),

            ),
          ),
          SizedBox(height: 10,),
          Container(
height: 100,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
                itemBuilder:(context,index)=>categoriesitembuilder(catMODEL.data.productdata[index]) ,
                separatorBuilder:(context,index)=>SizedBox(width: 5,),
                itemCount: catMODEL.data.productdata.length),
          ),
          SizedBox(height: 20,),
          Text(
            'New products',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 30,

            ),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              child: GridView.count
                (
mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1/1.65,


                  crossAxisCount: 2,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children:

                 List.generate(model.data.products.length, (index) =>buildGridproduct(model.data.products[index],context))


              ),
            ),
          )
        ],
      ),
    );
  }

Widget buildGridproduct(productmodel model,context)
{
  return Column(
    children: [
      Stack(
alignment: AlignmentDirectional.bottomStart,
        children: [

          Image(
            image: NetworkImage(model.image),
width:double.infinity,
            height: 200,
          ),
          if(model.price!=model.oldprice)
          Container(

            color: Colors.deepOrangeAccent,
            child: Text(

              'Discount',
style: TextStyle(
  color: Colors.white,
),
            ),
          ),
          
        ],
      ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
               '${model.name}',
            maxLines: 2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                ' price : ${model.price.round()}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              SizedBox(width: 0,),
              if(model.oldprice!=model.price)

              Text(
                '   ${model.oldprice.round()}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  decoration: TextDecoration.lineThrough
                      ,color: Colors.grey,
                ),
              ),
Spacer(),
Container(
  height: 40,
  width: 40,
  child:   IconButton(onPressed: (){
homelayoutcubit.get(context).changefav(model.id);


  }, icon: CircleAvatar(
    radius: 15,
    backgroundColor: (homelayoutcubit.get(context).favorites[model.id])!?Colors.blue:Colors.grey,
    child:   Icon(
      Icons.favorite_border,
      size:13,

    ),
  )),
)
            ],
          ),
        ],
      ),
    ],
  );
}
Widget categoriesitembuilder(catData model)
{
  return Stack(

    alignment: AlignmentDirectional.bottomStart,


    children: [



      Image(image: NetworkImage(
        model.image,
      )),
      Container(

          width: 120,
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(model.name
              ,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(

                color: Colors.black,

              ),
            ),
          )),
    ],
  );

}
}
