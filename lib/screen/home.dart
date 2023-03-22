import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imagepicker/controller/image_controller.dart';
import 'package:get/get.dart';
class Home extends StatelessWidget {
  ImageController imageController = Get.put(ImageController());
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();
  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Container(
          margin: EdgeInsets.only(top: 50),
          width: double.infinity,
          height: double.infinity,
          child:  Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => CircleAvatar(
                radius: 40,
                backgroundImage:imageController.isImagePick == true?FileImage(File(imageController.imagePath.value))as ImageProvider : AssetImage('assets/do.jpeg'),
              ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    getImage(ImageSource.camera);
                  }, child: Text('Camera')),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed: (){
                    getImage(ImageSource.gallery);
                  }, child: Text('Galery')),
                ],
              )

            ],
          ),
        )
      ),
    );
  }
  Future <void> getImage(ImageSource source) async{
    final pickedImage =await imagePicker.pickImage(source: source,imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    imageController.setImagePath(pickedFile!.path);


  }
}
