import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/newsapp/cubit.dart';
import 'package:untitled/layout/newsapp/states.dart';
import 'package:untitled/layout/shared/components/components.dart';

class buisnessscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocConsumer<newscubit,newsStates>(builder:(context,state)
      {
var list=newscubit.get(context).business;

        return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context,index)=>buildarticleitem(list[index],context),
            separatorBuilder: (context,index)
            {
          return const Divider(
           color: Colors.black,
          );
        } , itemCount: list.length);

      }, listener: (context,state)
      {

      }),
    );

  }
}
