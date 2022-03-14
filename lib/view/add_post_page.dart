import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/color/app_color.dart';
class AddPostPage extends StatefulWidget {
  const AddPostPage({Key? key}) : super(key: key);
  static final String id="add_post_page";

  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {

  final formKey =GlobalKey<FormState>();

  String title="";
  String text="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.containerFiveColor,
          automaticallyImplyLeading: false,
          title: Text('add new post',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.blue,),
          ),
        ),
        body: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                      validator: (value){
                        if(value!=null)
                          if(value!.isEmpty){
                            return "To'ldirilmagan";
                          }

                      },
                      onSaved: (value){
                        title=value!;
                      },
                    ),
                    SizedBox(height: 6,),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Text',
                      ),
                      validator: (value){
                        if(value!=null)
                          if(value!.isEmpty){
                            return "To'ldirilmagan";
                          }

                      },
                      onSaved: (value){
                        text=value!;
                      },
                    ),
                    SizedBox(height: 24,),
                    TextButton(
                        onPressed: (){
                          addMovie();
                        },
                        child: Text("Add",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
                    )
                  ],
                ),
              ),
            )
        )
    );
  }

  void addMovie(){

    bool isValid=formKey.currentState!.validate();

    if(isValid){
      formKey.currentState?.save();
      _create();
      Navigator.pop(context);
    }
  }

  void _create()async{
    final FirebaseFirestore firestore=FirebaseFirestore.instance;
    try{
      await firestore.collection('posts')
          .doc('${title.replaceAll(" ", "_")}')
          .set({
        'title':'$title',
        'text':'$text',
      });
    }catch(e){
      print(e);
    }
  }

}
