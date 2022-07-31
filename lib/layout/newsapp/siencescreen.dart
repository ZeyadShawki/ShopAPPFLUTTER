import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/newsapp/cubit.dart';
import 'package:untitled/layout/newsapp/states.dart';

import '../shared/components/components.dart';

class sciencescreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newscubit,newsStates>(builder:(context,state)
    {
      var list=newscubit.get(context).science;

      return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index)=>buildarticleitem(list[index],context),
          separatorBuilder: (context,index)
          {
            return Divider(
              color: Colors.black,
            );
          } , itemCount: list.length);

    }, listener: (context,state)
    {

    });

  }
}