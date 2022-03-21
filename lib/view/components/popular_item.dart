import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/model/my_post_model.dart';
import 'package:flutter_uzbek/view/postt_page.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../view_model/post_vm.dart';

class PopularItem extends StatefulWidget {
  const PopularItem({Key? key}) : super(key: key);
  static final String id = "popular_item";

  @override
  _PopularItemState createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<PostViewModel>(context, listen: false);
    authVM.getCurrentPost();
    authVM.fetchPosts();
    final postsRef = authVM.fetchPosts();

    return StreamBuilder<QuerySnapshot<MyPosts>>(
      stream: postsRef.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else
          return Consumer<PostViewModel>(builder: (context, data, index) {
            return ListView.builder(
                itemCount: snapshot.data?.size,
                itemBuilder: (context, index) {
                  final item = snapshot.data!.docs[index].data();
                  return Dismissible(
                    key: Key(item.text!),
                    onDismissed: (directions) {
                      setState(() {
                        authVM.delete(item);
                        //_delete(item);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${item.title} dissmised')));
                    },
                    child: postVidget(item, index),
                  );
                });
          });
      },
    );
    // return ListView.builder(
    //     itemCount: MyPosts.posts.length,
    //     itemBuilder: (BuildContext contex,int index){
    //       return Popular(MyPosts).posts[index]);
    //     }
    // );
  }

  Widget postVidget(MyPosts mypost, int index) {
    var now = DateTime.now();
    String formattedDate = DateFormat('MM/dd/yyyy').format(now);

    return InkWell(
      onTap: () {
        setState(() {
          Navigator.pushNamed(context, PosttPage.id,
              arguments: {'post': mypost});
        });
      },
      child: Card(
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
                    SizedBox(
                      height: 17,
                    ),
                    Text(mypost.title.toString(),
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      mypost.text.toString(),
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    )
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
              ))
            ],
          ),
        ),
      ),
    );
  }
}
