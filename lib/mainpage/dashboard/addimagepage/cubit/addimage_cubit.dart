import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'addimage_state.dart';

class AddimageCubit extends Cubit<AddimageState> {
  AddimageCubit() : super(AddimageInitial());
  final secureStorage = FlutterSecureStorage();
  File? selectedImage;
  File? selectedVideo;

  Future<void> pickImageFromGallery() async {
    final status = await Permission.photos.request();

    if (status.isGranted) {
      // Store permission granted
      await secureStorage.write(key: 'isGalleryPermissionGranted', value: 'true');

      final returned = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returned != null) {
        selectedImage = File(returned.path);
        emit(AddimageInitial());
      }
    } else if (status.isPermanentlyDenied) {
      await secureStorage.write(key: 'isGalleryPermissionGranted', value: 'false');
      openAppSettings();
      emit(AddimageInitial());
    } else {
      await secureStorage.write(key: 'isGalleryPermissionGranted', value: 'false');
      emit(AddimageInitial());
    }
  }
  Future<void> pickVideoFromGallery() async {
    final status = await Permission.videos.request();

    if (status.isGranted) {
      await secureStorage.write(key: 'isGalleryPermissionGranted', value: 'true');

      final returned = await ImagePicker().pickVideo(source: ImageSource.gallery);
      if (returned != null) {
        selectedVideo = File(returned.path);
        emit(AddimageInitial());
      }
    } else if (status.isPermanentlyDenied) {
      await secureStorage.write(key: 'isGalleryPermissionGranted', value: 'false');
      openAppSettings();
      emit(AddimageInitial());
    } else {
      await secureStorage.write(key: 'isGalleryPermissionGranted', value: 'false');
      emit(AddimageInitial());
    }
  }



}
