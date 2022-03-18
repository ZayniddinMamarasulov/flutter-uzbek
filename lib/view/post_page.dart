import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/color/app_color.dart';
import 'package:flutter_uzbek/model/my_post_model.dart';
import 'package:flutter_uzbek/view/add_post_page.dart';
import 'package:intl/intl.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);
  static final String id="post_page";

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  CollectionReference<MyPosts> fetchPosts(){
    return FirebaseFirestore.instance
        .collection('posts')
        .withConverter<MyPosts>(
      fromFirestore: (snapshots, _) => MyPosts.fromJson(snapshots.data()!),
      toFirestore: (post, _) => post.toJson(),
    );
  }

  @override
  Widget build(BuildContext context) {

    final postsRef=fetchPosts();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      backgroundColor: AppColors.containerFiveColor,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("My Posts",style: TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.w700),),
          Container(
            height: 36,
            width: double.infinity,
            child: CupertinoTextField(
              keyboardType: TextInputType.text,
              placeholder: 'Search',
              placeholderStyle:const TextStyle(
                color: Color(0xffC4C6CC),
                fontSize: 14.0,
                fontFamily: 'Brutal',
              ),
              prefix: const Padding(
                padding:
                const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                child: Icon(
                  Icons.search,
                  color: Color(0xffC4C6CC),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xffF0F1F5),
              ),
            ),
          )
        ],
      ),
      toolbarHeight: 100,
    ),
      body: StreamBuilder<QuerySnapshot<MyPosts>>(
        stream: postsRef.snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }else
            return ListView.builder(
                itemCount: snapshot.data?.size,
                itemBuilder: (context,index){
                  final item=snapshot.data!.docs[index].data();
                  return Dismissible(
                    key: Key(item.text!),
                    onDismissed: (directions){
                      setState(() {
                        _delete(item);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${item.title} dissmised'))
                      );

                    },
                    child: postVidget(
                        item,
                        index
                    ),
                  );
                });
        },
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddPostPage.id);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget postVidget(MyPosts mypost,int index){
    var now = DateTime.now();
    String formattedDate = DateFormat('MM/dd/yyyy').format(now);

    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 242,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(formattedDate.toString()),
                  SizedBox(height: 17,),
                  Text(mypost.title.toString(),style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.black)),
                  SizedBox(height: 8,),
                  Text(mypost.text.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.grey),)
                ],
              ),
            ),
            Expanded(
                child: Row(
                  children: [
                    Container(
                      height: 400,
                      width: 180,
                      child: Image.network(mypost.imageUrl!),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }


  void _delete(MyPosts mypost)async{
    final FirebaseFirestore firestore=FirebaseFirestore.instance;
    try{
      firestore
          .collection('posts')
          .doc('${mypost.title?.replaceAll(" ", "_")}')
          .delete();
      fetchPosts();
    }catch(e){
      print(e);
    }
  }
}