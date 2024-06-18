import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/Home_cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/Cashe/Cache.dart';
import '../../controllers_cubits/Controllers_cubits.dart';
part 'profile_photo_cubit_state.dart';

class ProfilePhotoCubit extends Cubit<ProfilePhotoCubitState> {
  ProfilePhotoCubit() : super(ProfilePhotoCubitInitial());
  static ProfilePhotoCubit get(context) => BlocProvider.of(context);

  final _picker = ImagePicker();
  final _storage = FirebaseStorage.instance;
  Future<String?> uploadImageAndGetURL({
    required String Uid,
    required BuildContext context,
  }) async {
    try {
      emit(ProfilePhotoLoading());
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) return null;

      File imageFile = File(pickedFile.path);
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      Reference ref = _storage.ref().child('images/$fileName');
      UploadTask uploadTask = ref.putFile(imageFile);

      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();

      await setDocumentAttribute(
        docId: Uid,
        attributeKey: "ImagePath",
        attributeValue: downloadURL,
      );
      PreferencesService.setCache("ImagePath", downloadURL);
      emit(ProfilePhotoDone());
      return downloadURL;
    } catch (e) {
      emit(ProfilePhotoError());
      print('Image upload failed: $e');
      return null;
    }
  }

  Future<void> setDocumentAttribute({
    required String docId,
    required String attributeKey,
    required String attributeValue,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(docId).update({
        attributeKey: attributeValue,
      });
      emit(ProfilePhotoDone());
      print('Document attribute updated successfully');
    } catch (e) {
      emit(ProfilePhotoError());
      print('Failed to update document attribute: $e');
      // Optionally handle exception
    }
  }
}
