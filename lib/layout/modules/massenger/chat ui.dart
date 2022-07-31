import 'package:flutter/material.dart';

class chatappui extends StatelessWidget {
  const chatappui({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
backgroundColor: Colors.white,
        elevation: 0.0,
        title:
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 20,
              backgroundImage: NetworkImage('https://m.media-amazon.com/images/I/91fd1q6Z7mL._SS500_.jpg'),
        ),

            SizedBox(
              width: 20,
            ),
            Text(

              'Chats',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
  ],
      ),
actions: [
  CircleAvatar(
    backgroundColor: Colors.blue,
    child: IconButton(
      onPressed: (){

      },
      icon: Icon(Icons.camera_alt,
      color: Colors.white,
      ),
    ),
  ),
  SizedBox(
    width: 10,
  ),
  CircleAvatar(
    backgroundColor: Colors.blue,
    child: IconButton(
      onPressed: (){

      },
      icon: Icon(Icons.abc,
      color: Colors.white,),
    ),
  )
],



      ),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey,
              ),
              child: Padding(

                padding: const EdgeInsets.all(0.0),
                child: Container(

                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Icon(
                          Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Text(

                        'search',

                      ),

                    ],


                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                  backgroundImage: NetworkImage('https://m.media-amazon.com/images/I/91fd1q6Z7mL._SS500_.jpg'),
    ),
              CircleAvatar(
                radius: 5,
                backgroundColor: Colors.green,

              ),
                  Text(
                    '',
                  ),
                ],

              ),
    ],
    ),
            ),
            ],
        ),


      ),



    );
  }
}
