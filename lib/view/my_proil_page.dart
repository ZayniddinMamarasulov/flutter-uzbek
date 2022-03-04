import 'package:flutter/material.dart';
import 'package:flutter_uzbek/color/app_color.dart';

import 'components/payment.dart';
class MyProfilPage extends StatefulWidget {
  const MyProfilPage({Key? key}) : super(key: key);
  static final String id="my_profil_page";

  @override
  _MyProfilPageState createState() => _MyProfilPageState();
}

class _MyProfilPageState extends State<MyProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     body: CustomScrollView(
       slivers: [
         SliverAppBar(
           backgroundColor: AppColors.containerFiveColor,
           pinned: true,
           title: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               TextButton(
                   onPressed: (){
                     Navigator.pop(context);
                   },
                   child: Row(
                     children: [
                       Icon(Icons.arrow_back_ios),
                       Text("Back")
                     ],
                   )
               ),
               Center(child: Text("My Profil",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),)),

               IconButton(
                 onPressed: (){

                 },
                 color: Colors.blue,
                 icon: ImageIcon(AssetImage("assets/icons/iconn.png")),
               ),

             ],
           ),
         ),
         SliverToBoxAdapter(
           child: Padding(
             padding: EdgeInsets.all(10),
             child: Column(
               children: [

                 Column(
                   children: [
                     Container(
                       height: 80,
                       width: 80,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(50),
                           color: Colors.black
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Center(
                             child: Image(
                               image: AssetImage("assets/icons/image11.png"),
                             ),
                           ),
                         ],
                       ),
                     ),
                     Text("Peter Stone",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                     Container(
                       padding: EdgeInsets.all(16),
                       height: 100,
                       width: double.infinity,
                       child: Center(
                         child: Text(
                           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices lectus in pellentesque elit dui",
                           style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.w400),
                         ),
                       ),
                     ),
                     Container(
                       height: 1,
                       color: Colors.grey,
                     ),
                     Row(
                       children: [
                         Expanded(
                             child: Container(
                               height: 66,
                               child: Center(
                                 child: Text("Followers",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w400),),
                               ),
                             )
                         ),
                         Expanded(
                             child: Container(
                               child: Center(
                                 child: Text("Following",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w400),),
                               ),
                             )
                         ),
                       ],
                     ),
                     Container(
                       height: 1,
                       color: Colors.grey,
                     ),
                     SizedBox(height: 32,),
                     Container(
                       height: 24,
                       width: 101,
                       color: Colors.green,
                       child: Center(
                         child: Text("PAYMENT RATE",style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w500),),

                       ),
                     ),
                     Payment(),
                     SizedBox(height: 46,),
                     TextButton(
                         onPressed: (){

                         },
                         child: Text("Sign out",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w600),)
                     )
                   ],
                 )
               ],
             ),
           ),
         )
       ],
     )
    );
  }
}

