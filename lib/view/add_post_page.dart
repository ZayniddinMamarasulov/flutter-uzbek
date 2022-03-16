import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/color/app_color.dart';
import 'package:image_picker/image_picker.dart';
class AddPostPage extends StatefulWidget {
  const AddPostPage({Key? key}) : super(key: key);
  static final String id="add_post_page";

  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {

  final formKey =GlobalKey<FormState>();
  final _picker = ImagePicker();
  File _selectedImage = File('');

  String title="";
  String text="";
  bool _isLoading = false;


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
        body: SingleChildScrollView(
          child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                child: Column(
                  children: [
                    Container(
                      child: _isLoading
                          ? Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                      )
                          : Container(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                getImage();
                              },
                              child: _selectedImage.path != ''
                                  ? Container(
                                height: 150,
                                margin:
                                EdgeInsets.symmetric(horizontal: 16),
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.file(
                                    _selectedImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                                  : Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16),
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: const Icon(
                                  Icons.add_a_photo_outlined,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),

                    Form(
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

                          Container(
                            height: 260,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade200,
                            ),
                            child: TextFormField(
                              maxLines: null,
                              minLines: null,
                              expands: true,
                              decoration: InputDecoration(
                                contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                hintText: 'Writing Post',
                                hintStyle: TextStyle(color: Colors.grey.shade500),
                                border: InputBorder.none,
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
                  ],
                )
              )
          ),
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

    setState(() {
      _isLoading=true;
    });
    var firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('post_images')
        .child('$title.jpg');
    final task = firebaseStorageRef.putFile(_selectedImage);

    var downloadUrl = await (await task).ref.getDownloadURL();
    print('this is url $downloadUrl');


    final FirebaseFirestore firestore=FirebaseFirestore.instance;
    try{
      await firestore.collection('posts')
          .doc('${title.replaceAll(" ", "_")}')
          .set({
        'title':'$title',
        'text':'$text',
        'imageUrl':downloadUrl
      });
    }catch(e){
      print(e);
    }
  }

  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

}
