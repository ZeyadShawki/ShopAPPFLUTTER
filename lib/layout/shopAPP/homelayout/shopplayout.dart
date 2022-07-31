import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/newsapp/search_screen.dart';
import 'package:untitled/layout/shared/components/components.dart';
import 'package:untitled/layout/shopAPP/homelayout/homelayoutcubit.dart';
import 'package:untitled/layout/shopAPP/homelayout/homelayoutstates.dart';
import 'package:untitled/layout/shopAPP/loginshop.dart';
import 'package:untitled/layout/shopAPP/network/local/cache%20helper.dart';
import 'package:untitled/layout/shopAPP/search%20screen/search.dart';

class shopplayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homelayoutcubit,homelayoutstates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=homelayoutcubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Matgar',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            actions: [
              IconButton(
                onPressed: (){
                  navigateto(context, searchscreenshopp());
                },
                icon: Icon(Icons.search),
              )
            ],
          ),
          body: cubit.bottomscreens[
            cubit.currentindex
          ],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(

                Icons.home,
              ),
                label: 'Home',
              ),
              BottomNavigationBarItem(icon: Icon(
                Icons.apps,
              )
              ,label: 'Categories'
              ),
              BottomNavigationBarItem(icon: Icon(
                Icons.favorite,
              ),
              label: 'Favorites',
              ),
              BottomNavigationBarItem(icon: Icon(
                Icons.settings,
              )
                  ,label: 'Settings'
              ),

            ],
            onTap: (index){
              cubit.changebottom(index);
            },
            currentIndex: cubit.currentindex,
          ),
        );

      },

    );
  }
}
