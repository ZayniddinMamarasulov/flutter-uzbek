import 'package:flutter/material.dart';
import 'package:flutter_uzbek/model/service.dart';
import 'package:flutter_uzbek/view/postt_page.dart';
class PopularItem extends StatefulWidget {
  const PopularItem({Key? key}) : super(key: key);
  static final String id="popular_item";

  @override
  _PopularItemState createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Infor.infor.length,
        itemBuilder: (BuildContext contex,int index){
          return Popular(Infor.infor[index]);
        }
    );
  }

  Widget Popular(Infor infor){
    return InkWell(
        onTap: (){
          setState(() {
            Navigator.pushNamed(context, PosttPage.id,arguments: {
              'infor':infor
            });
          });
        },
        child: Container(
          padding: EdgeInsets.only(left: 16,top: 21),
          height: 242,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage(infor.iconUrl)),
                        SizedBox(width: 6,),
                        Text(infor.name,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400),),
                      ],
                    ),
                    SizedBox(height: 17,),
                    Text(infor.text,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.black),),
                    SizedBox(height: 8,),
                    Text(infor.information,style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.w400),),
                    SizedBox(height: 21,),
                    Row(
                      children: [
                        Icon(Icons.favorite),
                        SizedBox(width: 4,),
                        Text("125")
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Image(
                    image: AssetImage(infor.imageUrl),
                  )
              )
            ],
          ),
        )
    );
  }

}