import 'package:flutter/material.dart';
class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);
  static final String id="post_page";

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
      ),
    );
  }
}
