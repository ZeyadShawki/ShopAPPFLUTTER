
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shared/components/components.dart';
import 'package:untitled/layout/shopAPP/homelayout/homelayoutcubit.dart';
import 'package:untitled/layout/shopAPP/homelayout/homelayoutstates.dart';
import 'package:untitled/layout/shopAPP/loginshop.dart';
import 'package:untitled/layout/shopAPP/models/loginModel.dart';
import 'package:untitled/layout/shopAPP/updateinfoscreen/updateinfoscreen.dart';

class settingsshoppscreen extends StatelessWidget {



  Widget build(BuildContext context) {

    return BlocConsumer<homelayoutcubit,homelayoutstates>(
        builder: (context,state){
          return  BuildCondition(
            condition: homelayoutcubit.get(context).usermodel!=null,
            builder: (context)=>avatarPROFILE(homelayoutcubit.get(context).usermodel!.data,context),
            fallback: (context)=>Center(child: CircularProgressIndicator()),
            );

    },
        listener: (context,state)
        {

    }

    );

  }

  Widget avatarPROFILE(userdata model,context) =>Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [


      Row(

        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 10,),
          CircleAvatar(
            radius: 50,
            backgroundImage:
            NetworkImage(model.image),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(width: 10,),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                model.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 20,
                ),

              ),
              SizedBox(height: 5,),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.email,
                      size: 20,
                    ),
                    SizedBox(width: 5,),
                    Text(
                      model.email,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.phone,
                      size: 20,
                    ),
                    SizedBox(width: 5,),
                    Text(
                     model.phone,
                      style: TextStyle(
                        fontSize: 15,

                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),

      Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(onPressed: (){
              navigateto(context, shopupdateinfoscreen());

            },
              child:Text(
                'Update info',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,

            ),
            SizedBox(width: 15,),
            MaterialButton(onPressed: (){
              navigateandfinish(context, loginshopp());

            },
              child:Text(
                'Signout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,

            ),
          ],
        ),
      ),


    ],
  );
}