
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homescreen extends StatelessWidget
{
  Widget build(BuildContext context )
  {
    return Scaffold(

      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('my first app'),
        actions: [
         IconButton(onPressed: ()
         {
           print("helloo");
         },
             icon: Icon(Icons.accessible_sharp)),
          Icon(Icons.abc)
        ],
      ),

          );
  }




}