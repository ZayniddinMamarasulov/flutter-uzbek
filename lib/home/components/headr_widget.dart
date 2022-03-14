import 'package:flutter/material.dart';
import 'package:flutter_uzbek/service/app_colors.dart';

class HeadrWidget extends StatefulWidget {
  const HeadrWidget({Key? key}) : super(key: key);

  @override
  _HeadrWidgetState createState() => _HeadrWidgetState();
}

class _HeadrWidgetState extends State<HeadrWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            child: const Image(
              image: AssetImage('assets/network/Saly-1.png'),
            )
        ),
        Center(
            child: Column(
              children: [
                const Text('Promo header',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: AppColors.black),),
                SizedBox(height: 12,),
                Text('Short text description',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: AppColors.grey),),
                SizedBox(height: 156,),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: FlatButton(
                    onPressed: () {},
                    child: const Center(
                      child: Text("Call To Action",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: AppColors.appWhite),),
                    ),

                  ),
                )
              ],
            )
        )
      ],
    );
  }
}
