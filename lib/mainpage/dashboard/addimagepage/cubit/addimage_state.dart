part of 'addimage_cubit.dart';

@immutable
sealed class AddimageState {}

final class AddimageInitial extends AddimageState {}
final class AddimageIoading extends AddimageState {}
final class AddimageImage extends AddimageState {
  final File image;
  AddimageImage(this.image);
}
final class Addimagevideo extends AddimageState {
  final File video;
  Addimagevideo(this.video);
}
class AddimagePermissionDenied extends AddimageState {}

