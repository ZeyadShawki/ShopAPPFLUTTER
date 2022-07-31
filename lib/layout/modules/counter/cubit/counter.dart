import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/modules/counter/cubit/cubit.dart';
import 'package:untitled/layout/modules/counter/cubit/states.dart';

class counter extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
create: (BuildContext context) => Countercubit(),
      child: BlocConsumer<Countercubit,Counterstate>(
      listener: (context, state) {},


      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'counter',
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextButton(onPressed:
                      (){
                    Countercubit.get(context).minus();
                  },
                    child:
                    Text(
                      'minus',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    '${Countercubit.get(context).count}',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  TextButton(onPressed:
                      (){
Countercubit.get(context).plus();                  },
                    child:
                    Text(
                      'plus',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      ),
    );
  }
}

