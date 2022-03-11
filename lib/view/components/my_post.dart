import 'package:flutter/material.dart';
class MyPost extends StatelessWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 242,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("12.05.2021"),
                    SizedBox(height: 17,),
                    Text("Lorem ipsum dolor sit amet",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w700),),
                    SizedBox(height: 8,),
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit...",style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.w400),),
                    SizedBox(height: 21,),
                    Row(
                      children: [
                        Icon(Icons.favorite,color: Colors.black,),
                        Text("125",style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.w400),)
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                    children: [
                      Image(image: AssetImage("assets/icons/img5.png"))
                    ],
                  )
              )
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.black,
        ),
        SizedBox(height: 16,),
        Container(
          padding: EdgeInsets.only(left: 16,top: 25),
          height: 214,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("12.05.2021",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400),),
              SizedBox(height: 17,),
              Text("Lorem ipsum dolor sit amet",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w700),),
              SizedBox(height: 8,),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices lectus in pellentesque elit dui. Urna ultrices tellus…",
                style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey,
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 242,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("12.05.2021"),
                    SizedBox(height: 17,),
                    Text("Lorem ipsum dolor sit amet",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w700),),
                    SizedBox(height: 8,),
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit...",style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.w400),),
                    SizedBox(height: 21,),
                    Row(
                      children: [
                        Icon(Icons.favorite,color: Colors.black,),
                        Text("125",style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.w400),)
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                    children: [
                      Image(image: AssetImage("assets/icons/img5.png"))
                    ],
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }
}