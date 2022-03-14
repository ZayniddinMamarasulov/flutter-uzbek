class MyPosts{
  String? title;
  String? text;


  MyPosts(this.title,this.text);

  MyPosts.fromJson(Map<String, dynamic> json){
    title=json['title'];
    text=json['text'];

  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data=new Map<String,dynamic>();
    data['title']=this.title;
    data['text']=this.text;
    return data;
  }
}