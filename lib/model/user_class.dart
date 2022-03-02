class User{
  String? image;
  String? name;
  String? message;
  String? data;
  int? count;

  User(this.image,this.name,this.message,this.data,this.count);


  static List<User> user=[
    User("assets/icons/image10.png", "John Doe", "Text message preview long text in two strokes", "12.05.2021", 10),
    User("assets/icons/image10.png", "Samuel Smith", "Text message preview", "12.05.2021", 10),
    User("assets/icons/image10.png", "John Doe", "Text message preview long text in two strokes", "12.05.2021", 10),
    User("assets/icons/image10.png", "Samuel Smith", "Text message preview", "", 10),
    User("assets/icons/image10.png", "John Doe", "Text message preview long text in two strokes", "12.05.2021", 10),
    User("assets/icons/image10.png", "Samuel Smith", "Text message preview", "12.05.2021", 10),
    User("assets/icons/image10.png", "John Doe", "Text message preview long text in two strokes", "12.05.2021", 10),
  ];
}