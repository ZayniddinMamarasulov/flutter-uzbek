class MyUser {
  final String? id;
  final String fullName;
  final String email;
  final String userRole;
  final String userimageUrl;

  MyUser(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.userRole,
      required this.userimageUrl});

  MyUser.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        userRole = data['userRole'],
        userimageUrl=data['userimageUrl'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'userRole': userRole,
      'userimageUrl':userimageUrl
    };
  }
}
