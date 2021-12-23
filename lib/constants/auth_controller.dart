import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trivia_app/app/modules/home/views/home_view.dart';
import 'package:trivia_app/app/modules/login/views/login_view.dart';
import 'package:trivia_app/app/modules/register/views/register_view.dart';
import 'package:trivia_app/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:trivia_app/constants/firebase_auth_constants.dart';

class AuthController extends GetxController {
  static AuthController authInstance = Get.find();

  late Rx<User?> firebaseUser;

  late Rx<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there

    // firebaseUser = Rx<User?>(auth.currentUser);
    // googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    // firebaseUser.bindStream(auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);

    // googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    // ever(googleSignInAccount, _setInitialScreenGoogle);

    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      // if the user is not found then the user is navigated to the Register Screen

      Get.offAll(() => SplashScreenView());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      // Get.snackbar("Succefully", "Registered");
      Get.offAll(() => LoginView());
    }
  }

  // _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
  //   print(googleSignInAccount);
  //   if (googleSignInAccount == null) {
  //     // if the user is not found then the user is navigated to the Register Screen
  //     Get.offAll(() => RegisterView());
  //   } else {
  //     // if the user exists and logged in the the user is navigated to the Home Screen
  //     Get.offAll(() => HomeView());
  //   }
  // }

  // void signInWithGoogle() async {
  //   try {
  //     GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

  //     if (googleSignInAccount != null) {
  //       GoogleSignInAuthentication googleSignInAuthentication =
  //           await googleSignInAccount.authentication;

  //       AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleSignInAuthentication.accessToken,
  //         idToken: googleSignInAuthentication.idToken,
  //       );

  //       await auth
  //           .signInWithCredential(credential)
  //           .catchError((onErr) => print(onErr));
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //       "Error",
  //       e.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     print(e.toString());
  //   }
  // }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (firebaseAuthException) {}
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match

      print(e.message);
    } catch (e) {
      print(e.toString());
    }
  }

  void signOut() async {
    await auth.signOut();
  }
}
