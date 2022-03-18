import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/color/app_color.dart';
import 'package:flutter_uzbek/model/user.dart';
import 'package:flutter_uzbek/view/components/popular_posts.dart';
import 'package:flutter_uzbek/view/my_profile_page.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);
  static final String id="profil_page";

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 100,
                pinned: true,
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("Home",style: TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.w700),),
                  titlePadding: EdgeInsets.only(top: 5,right: 5,left: 20),
                ),
                backgroundColor: AppColors.containerFourColor,
                actions:  [
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, MyProfilePage.id);
                    },
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.black,
                      child: Center(
                        child: FutureBuilder(
                          future: getCurrentUser(),
                          builder: (BuildContext context, AsyncSnapshot<MyUser> snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            return imageUI(snapshot.data!);
                          },
                        ),

                      ),
                    ),
                  ),
                  SizedBox(width: 12,),
                ],
              ),
              PopularPost(),
            ]
        )
    );
  }

  Widget imageUI(MyUser user){
    return Container(
      child: ClipOval(
        child: Image.network(
          user.userimageUrl,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),);
  }
  Future<MyUser> getCurrentUser() async {
    final id = FirebaseAuth.instance.currentUser?.uid;

    final currentUser =
    await FirebaseFirestore.instance.collection('users').doc(id).get();

    final userData = currentUser.data();

    return MyUser.fromData(userData!);
  }

}