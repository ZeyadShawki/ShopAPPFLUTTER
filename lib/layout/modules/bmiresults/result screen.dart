import 'package:flutter/material.dart';

class resultscreen extends StatelessWidget {
final int age;
  var result;
 final bool  ismale;
resultscreen( {
  required this.result,
    required this.age,
   required this.ismale,

  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bmi Result'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(
              'Gender: ${ismale?'male':'female'}',
            style: TextStyle(
              fontSize: 40,
            ),
          ),

          Text(
              'Age: $age',
            style: TextStyle(
              fontSize: 40,
          ),
    ),
         Text(
           'Result: $result',
    style: TextStyle(
    fontSize: 40,
         ),

      ),
  ],
      )
    );
  }
}
