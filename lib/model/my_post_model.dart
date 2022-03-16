class MyPosts{
  String? title;
  String? text;
  String? imageUrl;


  MyPosts(this.title,this.text,this.imageUrl);

  MyPosts.fromJson(Map<String, dynamic> json){
    title=json['title'];
    text=json['text'];
    imageUrl=json['imageUrl'];

  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data=new Map<String,dynamic>();
    data['title']=this.title;
    data['text']=this.text;
    data['imageUrl']=this.imageUrl;
    return data;
  }
}