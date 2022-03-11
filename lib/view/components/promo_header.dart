import 'package:flutter/material.dart';
class PromoHeader extends StatefulWidget {
  const PromoHeader({Key? key}) : super(key: key);

  @override
  _PromoHeaderState createState() => _PromoHeaderState();
}

class _PromoHeaderState extends State<PromoHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Image(image: AssetImage("assets/icons/img4.png")),
            Center(
                child: Column(
                  children: [
                    Text(
                      "Promo Header",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),
                    ),
                    Text("Short text description",style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.w400),),
                    SizedBox(height: 148,),
                    Container(
                      padding: EdgeInsets.all(16),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue
                      ),
                      child: Center(child: const Text("Call To Action",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),)),
                    )
                  ],
                )
            )
          ],
        )
    );
  }
}