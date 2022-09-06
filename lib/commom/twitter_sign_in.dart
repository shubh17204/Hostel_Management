import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter_login/twitter_login.dart';

void twitter_login() async {
  final twitterLogin = new TwitterLogin(
      apiKey: 'kLL1vnORN3rV16OAmKCxzHYY6',
      apiSecretKey: 'czfQkSAtD06ebreGeKZ1vhWdkMVqNCEIVC2jAzZEWIt7IOFkwb',
      redirectURI:
          'https://hostel-manage-31fb2.firebaseapp.com/__/auth/handler');

  await twitterLogin.login().then((value) async {
    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: value.authToken!,
      secret: value.authTokenSecret!,
    );

    await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
  });
}
