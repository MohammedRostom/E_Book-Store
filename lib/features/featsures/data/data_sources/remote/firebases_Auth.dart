import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/features/featsures/data/models/user_model.dart';

import '../../../../../core/Cashe/Cache.dart';
import '../../../../../core/utils/const.dart';

class Fire_Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<UserModel> signup({required UserModel user}) async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: user.Email!,
        password: user.Password!,
      );

      String? uid = userCredential.user!.uid;
      // Store additional user data in Firestore
      await _db.collection('users').doc(uid).set(user.toMap(Uid: uid));
      print("User signed up: ${userCredential.user!.uid}");
      return user;
    } catch (e) {
      print("Error during signup: $e");
      throw e; // Rethrow the error to handle it in UI if needed
    }
  }

  Future<UserModel?> login({required String user, required String pass}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: user,
        password: pass,
      );
      UserModel userInfo =
          await getUserInfo(id: userCredential.user!.uid) as UserModel;
      if (userInfo != null) {
        // Get From  Document from firebases Collection
        PreferencesService.setCache("uid", userInfo.id);
        PreferencesService.setCache("Username", userInfo.UserName);
        PreferencesService.setCache("Role", userInfo.Role);
        PreferencesService.setCache("Email", userInfo.Email);
        PreferencesService.setCache("Phone", userInfo.Phone);
        PreferencesService.setCache("ImagePath", userInfo.ImagePath);
        return userInfo;
      } else {
        print('User not found in Firestore.');
        return null;
      }
    } on FirebaseAuthException catch (e) {
      print("Error during login: $e");
      return null;
    }
  }

  Future<UserModel?> getUserInfo({required String id}) async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      for (var doc in querySnapshot.docs) {
        if (doc.get('id') == id) {
          UserModel user =
              UserModel.fromJson(doc.data() as Map<String, dynamic>);

          print("================${user.UserName}==================");
          return user;
        }
      }

      print('Document with id $id not found.');
      return null;
    } catch (e) {
      print('Error fetching documents: $e');
      return null;
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      print('Logout successful');
    } catch (e) {
      print('Logout failed: $e');
    }
  }
}
