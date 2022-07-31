import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/layout/modules/bmiresults/result%20screen.dart';

class bmi extends StatefulWidget {



  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  Color color= Colors.grey;
bool ismale=true;
double Height=180;
int weight=70;
int age=18;
var result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI calculter',

        ),

      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Row(
             children: [
               GestureDetector(
                 onTap: ()
                 {
                   setState( (){
                     ismale=true;
                   });
                 },

                 child:
                 Expanded(

                   child: Container(
                     width: 200,
                     height: 200,
                     decoration: BoxDecoration(
                       color: ismale?Colors.blue:Colors.grey[400],
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                     ),
                     child: Column(

                       children: [
                         SizedBox(
                           height: 15,
                         ),
                         Image(image:
                       AssetImage(
                         'images/M.png',
                       ),
                         width: 120,
                           height: 120,

                         ),
                         SizedBox(height: 15,),
                         Text(
                           'Male',
                           style: TextStyle(
                             fontSize: 40,
                           ),
                         ),

                       ],
                     ),
                   ),
                 ),
               ),
               SizedBox(
                 width: 10,
               ),
               Expanded(
                 child: GestureDetector(
                   onTap: ()
                   {
                     setState( (){
ismale=false;
                     });
                   },

                   child: Container(
                     width: 200,
                     height: 200,
                     decoration: BoxDecoration(
                       color: !ismale?Colors.pink[200]:Colors.grey[400],
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                     ),
                     child: Column(
                       children: [
                         SizedBox(height: 13,),
                         Image(image:
                         AssetImage('images/Female1.png'),
                           width: 120,
                           height: 120,

                         ),
                         SizedBox(
                           height: 15,
                         ),
                         Text(
                           'Female',
                           style: TextStyle(
                             fontSize: 40,
                           ),
                         ),

                       ],
                     ),
                   ),
                 ),
               ),
             ],
           ),
         ),

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey[400],
            ),

            child: Column(
              children: [

                Text(
                    'Height',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.alphabetic,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                  Text(
                        '${Height.round()}',
                        style: TextStyle(fontSize: 50,

                        ),
                      ),
                      Text(
                          'CM',
                      )
                    ],
                  ),
                ),
                Slider(value: Height,
                    max: 220,
                    min: 80,
                    onChanged:
                    (
                  value
                        ){
                setState(
                    (){
                      Height=value;
                    }
                );
                    },

                ),
              ],
            ),
          ),
        ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey[400],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),

                        Text(
                          'Age',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
Text(
  '$age',
  style: TextStyle(
    fontSize: 40,
  ),


),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(onPressed: (){
                              setState((){
                                age--;

                              });
                            },
                              child: Icon(
                                Icons.remove,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(onPressed: (){
                              setState((){
                                age++;

                              });
                            },

                              child:





                              Icon(
                                Icons.add,
                              ),
                            ),

                          ],
                        ),
                     SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey[400],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),

                        Text(
                          'Weight',
                          style: TextStyle(
                            fontSize: 50,
fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '$weight',
                          style: TextStyle(
                            fontSize: 40,

                          ),


                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(onPressed: (){
                              setState((){
                                weight--;

                              });
                            },
                            child: Icon(
                              Icons.remove,
                            ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(onPressed: (){
    setState((){
weight++;

    });
    },

                              child:





                              Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        ),

SizedBox(height: 10,),

                      ],
                    ),
                  ),
                ),

              ],

            ),
          ),

Padding(
 padding: const EdgeInsets.all(10.0),
  child:   Container(

    // decoration: BoxDecoration(
    //   borderRadius: BorderRadius.all(Radius.circular(10)),

    color: Colors.blue,




      child: Row(



      mainAxisAlignment: MainAxisAlignment.center,

      children: [

            MaterialButton(onPressed: (){
  result= weight /pow(Height/100, 2);
  result=result.round();
  print(result);
  Navigator.push(context, MaterialPageRoute(
      builder: (context) { return resultscreen(
    age: age,
    result: result,
    ismale: ismale,
  );

      }
      ),);
  },










            child:







              Text(







                'Calculate',







                style: TextStyle(







                  fontSize: 40,







                ),







              ),







            ),

      ],

    ),

  ),

),

        ],


      ),



    );
  }
}
