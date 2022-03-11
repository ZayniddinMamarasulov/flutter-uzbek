import 'package:flutter/material.dart';
class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image(image: AssetImage("assets/icons/mysaly.png")),
              ],
            ),
            Center(
                child: Column(
                  children: [
                    Text(
                      "Payment rate name",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),
                    ),
                    Text("Is your plan now",style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.w400),),
                    SizedBox(height: 148,),
                    Container(
                      padding: EdgeInsets.all(16),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.purple
                      ),
                      child: Center(child: const Text("Upgrade Your Plan",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),)),
                    )
                  ],
                )
            )
          ],
        )
    );
  }
}