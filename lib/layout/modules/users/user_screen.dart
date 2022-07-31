


import 'package:flutter/material.dart';
import '../../models/usermodel.dart';



class user_screen extends StatelessWidget {


List<Userdata> users=[
  Userdata(
     id: 1,
    name: 'ssssss',
    phone: '012228414745',
  ),
  Userdata(
    id: 2,
    name: 'zeyad ahmed shawki'
    ,
    phone: '01222dfdgdfgf8414745',
  ),
  Userdata(
    id: 3,
    name: 'ahmed shawki'
    ,
    phone: '012228414745',
  ),
  Userdata(
    id: 1,
    name: 'zeyad shawki'
    ,
    phone: '012228414745',
  ),
  Userdata(
    id: 1,
    name: 'zeyad shawki'
    ,
    phone: '012228414745',
  ),
  Userdata(
    id: 1,
    name: 'zeyad shawki'
    ,
    phone: '012228414745',
  ),
  Userdata(
    id: 1,
    name: 'zeyad shawki'
    ,
    phone: '012228414745',
  ),
  Userdata(
    id: 1,
    name: 'zeyad shawki'
    ,
    phone: '012228414745',
  ),
  Userdata(
    id: 1,
    name: 'zeyad shawki'
    ,
    phone: '012228414745',
  ),
  Userdata(
    id: 1,
    name: 'zeyad shawki'
    ,
    phone: '012228414745',
  ),
  Userdata(
    id: 1,
    name: 'zeyad shawki'
    ,
    phone: '012228414745',
  ),

];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index)=> buildUserItem(users[index]),
          separatorBuilder: (context,index)=>Container
          (
          height: 10,
          ),
          itemCount: users.length,
      ),
    );
  }
}
Widget buildUserItem(Userdata Users)
{
  return  Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: CircleAvatar(
          radius: 25,
          child: Text(
            '${Users.id}',
            style: TextStyle
              (
              fontSize: 30,
            ),
          ),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${Users.name}',
            style: TextStyle(
              fontSize: 30,
            ),
          ),

          Text(
            '${Users.phone}',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),

        ],
      ),
    ],
  );
}