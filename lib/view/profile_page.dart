import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/color/app_color.dart';
import 'package:flutter_uzbek/model/user.dart';
import 'package:flutter_uzbek/view/components/popular_posts.dart';
import 'package:flutter_uzbek/view/my_profile_page.dart';
import 'package:provider/provider.dart';

import '../view_model/auth_vm.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static final String id = "profil_page";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context, listen: false);
    authVM.getCurrentUser();

    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(slivers: [
          SliverAppBar(
            expandedHeight: 100,
            pinned: true,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Home".tr(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              ),
              titlePadding: EdgeInsets.only(top: 5, right: 5, left: 20),
            ),
            backgroundColor: AppColors.containerFourColor,
            actions: [
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MyProfilePage.id);
                  },
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.black,
                    child: Center(
                      child: Consumer<AuthViewModel>(
                          builder: (context, data, child) {
                        if (data.currentUser == null) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return imageUI(data.currentUser!);
                      }),
                    ),
                  )),
              SizedBox(
                width: 12,
              ),
            ],
          ),
          PopularPost(),
        ]));
  }

  Widget imageUI(MyUser user) {
    return Container(
      child: ClipOval(
        child: Image.network(
          user.userimageUrl,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
