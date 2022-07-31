import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/modules/counter/cubit/states.dart';


class Countercubit extends Cubit<Counterstate>
{
Countercubit() : super(CounterIntialState());
int count=1;
static Countercubit get(context)=> BlocProvider.of(context);
void minus()
{
  count--;
  emit(CounterminusState());
}
void plus()
{
  count++;
  emit(CounterplusState());

}


}