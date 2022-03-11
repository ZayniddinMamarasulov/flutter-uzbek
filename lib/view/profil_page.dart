import 'package:flutter/material.dart';
import 'package:flutter_uzbek/color/app_color.dart';
import 'package:flutter_uzbek/view/components/popular_posts.dart';
import 'package:flutter_uzbek/view/my_profil_page.dart';

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
                      Navigator.pushNamed(context, MyProfilPage.id);
                    },
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.black,
                      child: Center(
                        child: Container(
                          child: Image(
                            height: 28,
                            width: 24,
                            image: AssetImage("assets/icons/person.png"),
                          ),
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
}