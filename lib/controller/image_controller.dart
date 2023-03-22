import 'package:get/get.dart';

class ImageController extends GetxController{
  var isImagePick = false.obs;
  var imagePath = ''.obs;
  void setImagePath(path){
    isImagePick.value=true;
    imagePath.value =path;
  }
}