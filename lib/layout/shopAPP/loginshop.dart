import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/layout/shared/components/components.dart';
import 'package:untitled/layout/shopAPP/cubitshoppapp.dart';
import 'package:untitled/layout/shopAPP/network/local/cache%20helper.dart';
import 'package:untitled/layout/shopAPP/register/shopregisterscreen.dart';
import 'package:untitled/layout/shopAPP/homelayout/shopplayout.dart';
import 'package:untitled/layout/shopAPP/statesshoppapp.dart';
class loginshopp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    var emailcontroller=TextEditingController();
    var passwordcontroller=TextEditingController();
final formkey=GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context)=>shoplogincubit(),
      child: BlocConsumer<shoplogincubit,shoploginstates>(
        listener: (context,state) {
          if (state is shopploginsucessstate) {
            if (state.succesloginmodel.status)
            {
              cachehelper.token=state.succesloginmodel.data.token;

              Fluttertoast.showToast(
                  msg: state.succesloginmodel.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
              print(state.succesloginmodel.message);
              print(state.succesloginmodel.data.token);
              cachehelper.savedata(key: 'token',value:state.succesloginmodel.data.token ).then((value) {
                navigateandfinish(context, shopplayout());
              });




          }}
          if (state is shopploginerrorstate) {
            Fluttertoast.showToast(
                msg: 'Email or Password is incorrect',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0
            );
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
                            'LOGIN',
                             style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          SizedBox(height: 15,),
                          Text(
                            'Login to know our latest hot offers'
                            , style: TextStyle(
                            color: Colors.grey,
                          ),
                          ),
                          SizedBox(height: 30,),
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
                                shoplogincubit.get(context).userlogin(emailcont: emailcontroller.text
                                    , passwordcont: passwordcontroller.text);
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
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    shoplogincubit.get(context).obscurepass();
                                  },
                                    icon: Icon(shoplogincubit.get(context).suffixpass)),

                            ),

                            obscureText: shoplogincubit.get(context).ispassword,
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

                          Container(

                            width: double.infinity,
                            height: 50,
                            child: BuildCondition(

                              condition: state is! shopploginloadingstate,
                              builder: (context)=>MaterialButton(onPressed: (){
                                 if (formkey.currentState!.validate())
                                {
                                   shoplogincubit.get(context).userlogin(emailcont: emailcontroller.text
                                       , passwordcont: passwordcontroller.text);
                                }
                              },
                                child:Text(
                                  'Login',
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

                          Center(
                            child:   Row(
                              children: [
                                Text('Dont\'t have an acount'),
                                SizedBox(
                                  width: 40,
                                ),

                                TextButton(onPressed: (){
                                  navigateandfinish(context, shopregisterscreen());
                                },

                                  child: Text(
                                      'Register now'
                                  ),)

                              ],
                            ),
                          )
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
