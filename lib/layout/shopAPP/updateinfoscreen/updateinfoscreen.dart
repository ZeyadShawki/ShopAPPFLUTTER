import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shared/components/components.dart';
import 'package:untitled/layout/shopAPP/homelayout/homelayoutcubit.dart';
import 'package:untitled/layout/shopAPP/homelayout/homelayoutstates.dart';
import 'package:untitled/layout/shopAPP/homeproductscreen/homeproductscreen.dart';
import 'package:untitled/layout/shopAPP/network/local/cache%20helper.dart';
import 'package:untitled/main.dart';

import '../settings shopp/settengshopp.dart';

class shopupdateinfoscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    var emailcontroller=TextEditingController();
    var passwordcontroller=TextEditingController();
    var namecontroller=TextEditingController();

    var phonecontroller=TextEditingController();


    final formkey=GlobalKey<FormState>();
    return BlocProvider(
        create: (BuildContext context)=>homelayoutcubit(),
        child: BlocConsumer<homelayoutcubit,homelayoutstates>(
          listener: (context,state) {
if(state is shoppsuccesupdatestates)
{
navigateto(context, homeproductscreen());
}

            },



          builder: (context,state){
            return Scaffold(
              appBar: AppBar(

              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Scrollbar(

                      child: Form(
                        key: formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Update Profile',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 15,),

                            TextFormField(
                              controller: namecontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'name',
                                prefixIcon: Icon(Icons.person),

                              ),

                              validator: (String ? value){
                                if(value!.isEmpty)
                                  return 'Name should not be empty';
                                return null;
                              },

                              onSaved: (value) {
                                print(value);
                              },
                            ),
                            SizedBox(height: 15,),

                            TextFormField(
                              controller: emailcontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email Adress',
                                prefixIcon: Icon(Icons.email),

                              ),
                              validator: (String ? value){
                                if(value!.isEmpty)
                                  return 'Email should not be empty';
                                return null;
                              },
                              onSaved: (value) {
                                print(value);
                              },
                              onFieldSubmitted: (value){
                                if (formkey.currentState!.validate())
                                {
                                  homelayoutcubit.get(context).updateUser(
                                  emailcont: emailcontroller.text
                                    , passwordcont: passwordcontroller.text,
                                    namecont:namecontroller.text,
                                    phonecont:passwordcontroller.text,

                                  );
                                }

                              },

                            ),
                            SizedBox(height: 15,),
                            TextFormField(
                              controller: passwordcontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock),

                              ),

                              validator: (String ? value){
                                if(value!.isEmpty)
                                  return 'Password should not be empty';
                                return null;
                              },

                              onSaved: (value) {
                                print(value);
                              },
                            ),
                            SizedBox(height: 15,),



                            TextFormField(
                              controller: phonecontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'phone',
                                prefixIcon: Icon(Icons.phone),

                              ),

                              validator: (String ? value){
                                if(value!.isEmpty)
                                  return 'phone should not be empty';
                                return null;
                              },

                              onSaved: (value) {
                                print(value);
                              },
                            ),
                            SizedBox(height: 15,),
                            Container(

                              width: double.infinity,
                              height: 50,
                              child: BuildCondition(

                                condition: true,
                                builder: (context)=>MaterialButton(onPressed: (){
                                  if (formkey.currentState!.validate())
                                  {
                                    homelayoutcubit.get(context).updateUser(emailcont: emailcontroller.text
                                      , passwordcont: passwordcontroller.text
                                      ,namecont: namecontroller.text,
                                      phonecont: phonecontroller.text,
                                    );
                                  }

                                },

                                  child:Text(
                                    'Update',
                                  ),
                                  color: Colors.blue,
                                  elevation: 0,

                                ),
                                fallback:  (context) =>const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),



                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        )
    );
  }
}
