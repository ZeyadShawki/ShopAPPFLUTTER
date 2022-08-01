import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/layout/shared/components/components.dart';
import 'package:untitled/layout/shopAPP/loginshop.dart';
import 'package:untitled/layout/shopAPP/network/local/cache%20helper.dart';
class boarding{
 late final String image;
 late final String title;
 late final String body;
boarding({
   required this.image,
  required this.title,
  required this.body,
});
}
List<boarding> boardinglist=[
  boarding(
    image: 'images/onboard.jpg',
    title: 'Hello welcome to Matgar',
    body: 'Our Hot offers are waiting for you',
  )
];

void sumbit(context){
cachehelper.savedata(key: 'onboarding', value: true).then((value) {
  navigateandfinish(context, loginshopp());
});

}



var pagecontroller=PageController();


class onboardingscreen extends StatefulWidget {

  @override
  State<onboardingscreen> createState() => _onboardingscreenState();
}

class _onboardingscreenState extends State<onboardingscreen> {

  bool islast=false;

  List<boarding> boardinglist=[
boarding(
image: 'images/onboard.jpg',
  title: 'Hello, welcome to Matgar',
  body: 'Our Hot offers are waiting for you',
),
  boarding(
    image: 'images/onboard.jpg',
    title: 'title',
    body: 'body',
  ),
  boarding(
    image: 'images/onboard.jpg',
    title: 'Hello, welcome to Matgar',
    body: 'Our Hot offers are waiting for you',
  ),
];

  @override
   Widget  build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      actions: [
        TextButton(
            onPressed: (){
          sumbit(context);
            },
            child: Text('SKIP'),),
      ],
    ),
    body:   Padding(
padding: const EdgeInsets.all(30.0),
child:   Column(
children: [
Expanded(

child: PageView.builder(
  onPageChanged: (int index){
    if(index== boardinglist.length-1) {
      islast = true;
   print('last');
    }
    else{
      setState(() {
        islast=false;
      });
    }
  },
  itemBuilder: (context,index)=>onboardingitem(boardinglist[index]

),

controller: pagecontroller,
physics: BouncingScrollPhysics(),


itemCount: boardinglist.length,
),
),



SizedBox(height: 77,),
Row(children:  [
SmoothPageIndicator(controller: pagecontroller, count: boardinglist.length,effect: ExpandingDotsEffect(
  dotHeight: 10,
  dotColor: Colors.grey,
  activeDotColor: Colors.blue,
)

  ,

),

  Spacer(),
FloatingActionButton(



onPressed: () {
  if(islast)
    {
      sumbit(context);
    }
  else
  pagecontroller.nextPage(duration: Duration(milliseconds: 750,), curve: Curves.fastLinearToSlowEaseIn);
},
child: Icon(Icons.navigate_next),
),


],)
],
),
)

);
  }
}



  Widget onboardingitem(boarding Model) => Column(


  crossAxisAlignment: CrossAxisAlignment.start,

  children:   [

  Expanded(
  child: Image(

  image: AssetImage('${Model.image}'),),
  ),

  Text(

  '${Model.title}',

  style: TextStyle(

  fontSize: 30,
fontWeight: FontWeight.bold
  ),



  ),

  SizedBox(height: 15,),

  Text(

  '${Model.body}',
    style: TextStyle(

      fontSize: 20,

    ),


  ),

  ],

  );

