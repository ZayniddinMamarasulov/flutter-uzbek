import '../model/user.dart';

class AuthenticationService {
  late MyUser _currentUser;
  MyUser get currentUser => _currentUser;


  // Future _populateCurrentUser(FirebaseUser user) async {
  //   if (user != null) {
  //     _currentUser = await _firestoreService.getUser(user.uid);
  //   }
  // }
  //
  // Future loginWithEmail({
  //   @required String email,
  //   @required String password,
  // }) async {
  //   try {
  //     var authResult = await _firebaseAuth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     await _populateCurrentUser(authResult.user); // Populate the user information
  //     return authResult.user != null;
  //   } catch (e) {
  //     return e.message;
  //   }
  // }


}