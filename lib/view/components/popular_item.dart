import 'package:flutter/material.dart';
class PopularItem extends StatefulWidget {
  const PopularItem({Key? key}) : super(key: key);
  static final String id="popular_item";

  @override
  _PopularItemState createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16,),
        Container(
          height: 24,
          width: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200]
          ),
          child: Center(
            child: Text("Today",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
          ),
        ),
        SizedBox(height: 16,),
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
                      Image(image: AssetImage("assets/icons/person1.png"))
                    ],
                  )
              )
            ],
          ),
        ),
      ],
    );
  }
}
